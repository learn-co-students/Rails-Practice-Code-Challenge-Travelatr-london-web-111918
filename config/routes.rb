Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :destinations
  resources :posts
  resources :bloggers

  get "/posts/:id/like", to: 'posts#like_post', as: 'like_post'
end
