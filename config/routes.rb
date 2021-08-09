Rails.application.routes.draw do
 
  devise_for :users

  namespace :api do
  scope :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "api/v1/omniauth_callbacks" }
  end
end

get '/me', to: 'current_users#me'

scope '/articles' do
  get '/' => 'articles#index'
  post '/' => 'articles#create'
  put '/:article_id' => 'articles#update'
  delete '/:id' => 'articles#delete'
    end

     get '/my-articles' => 'articles#show_my_articles'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
