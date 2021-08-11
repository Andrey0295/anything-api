require 'rails_helper'

RSpec.describe "Articles", type: :request do
  
  before(:each) do
   
    @user = FactoryBot.create(:user)
   
    @sign_in_url = '/api/v1/auth/sign_in' 

    @sign_out_url = '/api/v1/auth/sign_out'

    @login_params = {
        email: @user.email,
        password: @user.password,   
    }

    @article_params = {
      
        title: 'Test title',
        body: 'Test body for article', 
        user_id: @user.id

    }

    @article = Article.new(@article_params)
    @article.save

    @edit_article_params = {
      title: 'Test title after edit',
      body: 'Test body for article', 

    }
    end



   
    

  describe 'ARTICLES CRUD' do
    before do
      post @sign_in_url, params: @login_params, as: :json
      @headers = {
        'uid' => response.headers['uid'],
        'client' => response.headers['client'],
        'access-token' => response.headers['access-token']
      }
          end
    it 'GET returns status 200, if user is authorized' do
            get '/me', headers: @headers
            expect(response).to have_http_status(200)
          end
    it 'GET returns all articles' do
            get '/articles', headers: @headers
            expect(response).to have_http_status(200)
          end
    it 'GET returns articles by an authorized user' do
            get '/my-articles', headers: @headers
            expect(response).to have_http_status(200)
          end
    it 'POST create a new article, if user authorized, returns status 200' do
            post '/articles', params: @article_params, headers: @headers
            expect(response).to have_http_status(200)
          end 
    it 'PUT edit an article, returns status 200' do
            put "/articles/#{@article.id}", params: @edit_article_params, headers: @headers
            expect(response).to have_http_status(200)
          end 
    it 'DELETE an article, returns 204' do
            delete "/articles/#{@article.id}", headers: @headers
            expect(response).to have_http_status(204)     
          end       
    context 'when login params is invalid' do
            before { post @sign_in_url }
    it 'POST create a new article, if user unauthorized, returns status 401 ' do
            post '/articles', params: @article_params
            expect(response).to have_http_status(401)
          end
    it 'PUT edit an articles, if user unauthorized, returns status 401' do
            delete "/articles/#{@article.id}", params: @edit_article_params
            expect(response).to have_http_status(401) 
          end
    it 'DELETE delete an article, if user anauthorized, returns 401' do
            delete "/articles/#{@article.id}"
            expect(response).to have_http_status(401)     
          end       
        end          
  end
end
