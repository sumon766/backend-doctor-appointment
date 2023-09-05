require 'swagger_helper'

describe 'Doctors API' do
  path '/api/v1/doctors' do
    post 'Creates a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: ['name', 'description']
      }

      response '201', 'doctor created' do
        let(:doctor) { { name: 'John Doe', description: 'Sample Description' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'John Doe' } }
        run_test!
      end
    end

    get 'Lists all doctors' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'doctors found' do
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    parameter name: :id, in: :path, type: :integer

    put 'Updates a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        }
      }

      response '200', 'doctor updated' do
        let(:id) { Doctor.create(name: 'John Doe', description: 'Sample Description').id }
        let(:doctor) { { name: 'Updated Name', description: 'Updated Description' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Doctor.create(name: 'John Doe', description: 'Sample Description').id }
        let(:doctor) { { name: nil, description: nil } }
        run_test!
      end
    end

    delete 'Deletes a doctor' do
      tags 'Doctors'

      response '204', 'doctor deleted' do
        let(:id) { Doctor.create(name: 'John Doe', description: 'Sample Description').id }
        run_test!
      end
    end
  end
end
