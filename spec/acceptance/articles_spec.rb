require 'acceptance_helper'

resource 'Articles' do
  header "Content-Type", "application/json"
  header 'X-ACCESS-TOKEN', :access_token

  let(:user) { FactoryBot.create(:user) }
  let(:access_token) { user.authentication_token }

  route "/api/articles", "Add Article" do
    parameter :title, "Title", type: :string, example: 'Awesome title', required: true
    parameter :description, "Description", type: :string, required: true
    parameter :state, "State", type: :string

    post 'Create Article' do
      let(:raw_post) { params.to_json }
      context 'when success' do
        let(:params) { { article: FactoryBot.attributes_for(:article) } }
        example '200' do
          # Act
          do_request

          # Assert
          expect(status).to eq(200)
        end
      end

      context 'when failed' do
        let(:params) { { article: FactoryBot.attributes_for(:article).merge(title: '') } }
        example '422' do
          # Act
          do_request

          # Assert
          expect(status).to eq(422)
        end
      end
    end
  end

  route "/api/articles/:id", "Get Article" do
    header 'X-ACCESS-TOKEN', :access_token
    parameter :id, "Article ID", type: :integer, example: '123', required: true

    get 'Get Article' do
      context 'when success' do
        let(:id) { FactoryBot.create(:article, author: user).id}
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

  route "/api/articles/:id", "Update Article" do
    header 'X-ACCESS-TOKEN', :access_token
    parameter :id, 'Article id', type: :integer, example: 100, required: true

    let(:id) { article.id }
    let(:article) { FactoryBot.create(:article, author: user) }

    put 'Update Article' do
      let(:raw_post) { params.to_json }
      context do
        let(:params) { { article: { title: 'Awesome Blog' } } }
        example '200' do
          # Act
          do_request

          # Assert
          expect(status).to eq(200)
          expect(article.reload.title).to eq('Awesome Blog')
        end
      end

      context do
        let(:params) { { article: { title: '' } } }
        example '422' do
          # Act
          do_request

          # Assert
          expect(status).to eq(422)
        end
      end
    end
  end

  route "/api/articles/:id", "Delete Article" do
    header 'X-ACCESS-TOKEN', :access_token
    parameter :id, 'Article id', type: :integer, example: 100, required: true

    let(:article) { FactoryBot.create(:article, author: user) }

    delete 'Delete User' do
      context do
        let(:id) { article.id }
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
