require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before(:each) do
    @sign_up_url = '/api/v1/auth/' 
    @signup_params = {
        email: 'user@example.com',
        password: '12345678',
        password_confirmation: '12345678'
    }

    @article_params = {
        title: 'Test title',
        body: 'Test body for article', 
        user_id: 1
    }
  end


  describe "GET /index" do
    it "returns http success" do
      get "/articles"
      expect(response).to have_http_status(:success)
    end
  end



  # describe "POST /create" do
  #      before do
  #         post @sign_up_url, params: @signup_params
  #       end
  #   it "returns 'created'" do
  #     post "/articles", :params => { :article => {:title => "My Widget", :body => "Test article"} }
  #     expect(response).to have_http_status(:created)
  #   end
  # end


end
