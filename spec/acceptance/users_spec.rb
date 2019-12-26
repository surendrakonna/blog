require 'acceptance_helper'

resource 'Users' do
  header "Content-Type", "application/json"

  route "/api/users", "Add User" do
    parameter :name, "User name", type: :string, example: 'John Wick', required: true
    parameter :email, "User email", type: :string, example: 'user@test.com', required: true
    parameter :password, "User password", type: :string, required: true
    parameter :password_confirmation, type: :string, required: true

    post 'Create User' do
      let(:raw_post) { params.to_json }
      context 'when success' do
        let(:params) { { user: { name: 'Surendra', email: 'user@test.com', password: 'Apple123', password_confirmation: 'Apple123'} } }
        example '200' do
          # Act
          do_request

          # Assert
          expect(status).to eq(200)
        end
      end
    end
  end

end
