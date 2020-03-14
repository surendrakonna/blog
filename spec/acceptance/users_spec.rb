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

      context 'when failed' do
        let(:params) { { user: { name: 'Surendra', email: ''} } }
        example '422' do
          # Act
          do_request

          # Assert
          expect(status).to eq(422)
        end
      end
    end
  end

  route "/api/users/:id", "Get User" do
    header 'X-ACCESS-TOKEN', :access_token
    parameter :id, "User ID", type: :integer, example: '123', required: true

    get 'Get User' do
      context 'when success' do
        let(:id) { FactoryBot.create(:user).id}
        # let(:params) { { user: { name: 'Surendra', email: 'user@test.com', password: 'Apple123', password_confirmation: 'Apple123'} } }
        example '200' do
          # Act
          do_request

          # Assert
          expect(status).to eq(200)
        end
      end
    end
  end

  route "/api/users/:id", "Update User" do
    header 'X-ACCESS-TOKEN', :access_token
    parameter :id, 'User id', type: :integer, example: 100, required: true

    let(:id) { user.id }
    let(:access_token) { user.authentication_token }
    let(:user) { FactoryBot.create(:user) }

    put 'Update User' do
      let(:raw_post) { params.to_json }
      context do
        let(:params) { { user: { name: 'Surendra K' } } }
        example '200' do
          # Act
          do_request

          # Assert
          expect(status).to eq(200)
          expect(user.reload.name).not_to be_nil
        end
      end

      context do
        let(:params) { { user: { email: '' } } }
        example '422' do
          # Act
          do_request

          # Assert
          expect(status).to eq(422)
        end
      end
    end
  end

  route "/api/users/:id", "Delete User" do
    header 'X-ACCESS-TOKEN', :access_token
    parameter :id, 'User id', type: :integer, example: 100, required: true

    let(:access_token) { user.authentication_token }
    let(:user) { FactoryBot.create(:user) }

    delete 'Delete User' do
      context do
        let(:id) { user.id }
        example '200' do
          # Act
          do_request

          # Assert
          expect(status).to eq(200)
        end
      end

      context do
        let(:id) { 0 }
        example '404' do
          # Act
          do_request

          # Assert
          expect(status).to eq(404)
        end
      end
    end
  end

end
