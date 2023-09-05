require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of doctors' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { doctor: { name: 'Dr. Smith', description: 'Lorem ipsum' } } }

    it 'creates a new doctor' do
      post :create, params: valid_params
      expect(response).to have_http_status(201)
    end

    it 'returns JSON with the created doctor' do
      post :create, params: valid_params
      expect(JSON.parse(response.body)['name']).to eq('Dr. Smith')
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { doctor: { name: '' } } }

      it 'does not create a new doctor' do
        post :create, params: invalid_params
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'POST #create' do
    it 'creates a new doctor' do
      doctor_params = { name: 'Dr. Smith', description: 'Lorem ipsum' }
      post :create, params: { doctor: doctor_params }
      
      expect(response).to have_http_status(201)
      expect(Doctor.last.name).to eq('Dr. Smith')
    end

    it 'returns JSON with the created doctor' do
      doctor_params = { name: 'Dr. Smith', description: 'Lorem ipsum' }
      post :create, params: { doctor: doctor_params }
      
      expect(response).to have_http_status(201)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['name']).to eq('Dr. Smith')
    end

    context 'with invalid parameters' do
      it 'does not create a new doctor' do
        invalid_params = { name: '' }
        post :create, params: { doctor: invalid_params }

        expect(response).to have_http_status(422)
        expect(Doctor.count).to eq(0)
      end
    end
  end

  describe 'PUT #update' do
    let!(:doctor) { Doctor.create(name: 'Dr. Original', description: 'Initial description') }

    it 'updates a doctor' do
      updated_params = { name: 'Dr. Updated', description: 'Updated description' }
      put :update, params: { id: doctor.id, doctor: updated_params }
      
      expect(response).to have_http_status(200)
      expect(doctor.reload.name).to eq('Dr. Updated')
    end

    context 'with invalid parameters' do
      it 'does not update the doctor' do
        invalid_params = { name: '' }
        put :update, params: { id: doctor.id, doctor: invalid_params }
        
        expect(response).to have_http_status(422)
        expect(doctor.reload.name).to eq('Dr. Original')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:doctor) { Doctor.create(name: 'Dr. Smith', description: 'Lorem ipsum') }

    it 'deletes a doctor' do
      delete :destroy, params: { id: doctor.id }
      
      expect(response).to have_http_status(204)
      expect { doctor.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
