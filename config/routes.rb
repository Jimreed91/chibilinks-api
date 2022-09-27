Rails.application.routes.draw do
  get 'links', to: 'links#index'
  get '/:slug', to: 'links#show'
  post 'links/', to: 'links#create'
  get '/', to: 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
