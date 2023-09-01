class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(username: params[:user][:username])

    if user&.valid_password?(params[:user][:password])
      sign_in user
      respond_with user, status: :ok
    else
      render json: {
        status: {
          code: 401,
          message: 'Invalid username or password'
        }
      }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split[1], ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: 'Signed out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'User has no active session'
      }, status: :unauthorized
    end
  end
end
