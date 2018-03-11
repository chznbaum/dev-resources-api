Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      post 'signup', to: 'users#register'
      post 'auth/login', to: 'users#login'
      scope '/categories' do
        get '/' => 'categories#index'
        post '/' => 'categories#create'
        scope '/:id' do
          get '/' => 'categories#show'
          put '/' => 'categories#update'
        end
      end
      scope '/resources' do
        get '/' => 'resources#index'
        post '/' => 'resources#create'
        scope '/:id' do
          get '/' => 'resources#show'
          put '/' => 'resources#update'
        end
      end
    end
  end
end
