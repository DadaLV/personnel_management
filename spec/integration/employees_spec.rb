require 'swagger_helper'

describe 'Employees API' do

  path '/api/v1/employees' do

    post 'Creates an employee' do
      tags 'Employees'
      consumes 'application/json', 'application/xml'
      parameter name: :employee, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          middle_name: { type: :string },
          last_name: { type: :string },
          passport_data: { type: :string },
          date_of_birth: { type: :string, format: :date },
          place_of_birth: { type: :string },
          home_address: { type: :string },
          department_id: { type: :integer }
        },
        required: [ 'first_name', 'last_name', 'passport_data', 'date_of_birth', 'place_of_birth', 'home_address', 'department_id' ]
      }

      response '201', 'Successful operation' do
        let(:employee) { { first_name: 'John', last_name: 'Doe', department_id: 3 } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:employee) { { first_name: 'John' } }
        run_test!
      end
    end
  end

  path '/api/v1/employees/{id}' do

    get 'Retrieves an employee' do
      tags 'Employees'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'employee found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            first_name: { type: :string },
            middle_name: { type: :string },
            last_name: { type: :string },
            passport_data: { type: :string },
            date_of_birth: { type: :string, format: :date },
            place_of_birth: { type: :string },
            home_address: { type: :string },
            department_id: { type: :integer }
          },
          required: [ 'id', 'first_name', 'last_name', 'passport_data', 'date_of_birth', 'place_of_birth', 'home_address', 'department_id' ]

        let(:id) { Employee.create(first_name: 'John', last_name: 'Doe', department_id: 3).id }
        run_test!
      end

      response '404', 'employee not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates an employee' do
      tags 'Employees'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
    
      response '200', 'employee updated' do
        let(:id) { Employee.create(first_name: 'John', last_name: 'Doe', department_id: 3).id }
        let(:employee) { { first_name: 'Updated', last_name: 'Employee', department_id: 5 } }
        run_test!
      end
    
      response '400', 'invalid request' do
        let(:id) { 'invalid' }
        let(:employee) { {} }
        run_test!
      end
    end
    
    delete 'Deletes an employee' do
      tags 'Employees'
      parameter name: :id, in: :path, type: :string
    
      response '204', 'employee deleted' do
        let(:id) { Employee.create(first_name: 'John', last_name: 'Doe', department_id: 3).id }
        run_test!
      end
    
      response '404', 'employee not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end