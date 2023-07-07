require 'swagger_helper'

describe 'Departments API' do

  path '/api/v1/departments' do

    post 'Creates a department' do
      tags 'Departments'
      consumes 'application/json', 'application/xml'
      parameter name: :department, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          abbreviation: { type: :string }
        },
        required: [ 'name', 'abbreviation' ]
      }

      response '201', 'Successful operation' do
        let(:department) { { name: 'UFO', abbreviation: 'UFO' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:department) { { name: 'TTT' } }
        run_test!
      end
    end
  end

  path '/api/v1/departments/{id}' do

    get 'Retrieves a department' do
      tags 'Departments'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'department found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            abbreviation: { type: :string }
          },
          required: [ 'name', 'abbreviation' ]

        let(:id) { Department.create(name: 'UFO', abbreviation: 'UFO').id }
        run_test!
      end

      response '404', 'department not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates an department' do
      tags 'Departments'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
    
      response '200', 'department updated' do
        let(:id) { Department.create(name: 'UFO', abbreviation: 'UFO').id }
        let(:department) { { name: 'Updated', abbreviation: 'UPD' } }
        run_test!
      end
    
      response '400', 'invalid request' do
        let(:id) { 'invalid' }
        let(:department) { {} }
        run_test!
      end
    end
    
    delete 'Deletes a department' do
      tags 'Departments'
      parameter name: :id, in: :path, type: :string
    
      response '204', 'department deleted' do
        let(:id) { Department.create(name: 'UFO', abbreviation: 'UFO').id }
        run_test!
      end
    
      response '404', 'department not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end