Rails.application.routes.draw do
  get 'links', to: 'links#index'
  get 'links/:id' , to: 'links#show', as: :link
  post 'links/', to: 'links#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
