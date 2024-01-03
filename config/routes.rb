Rails.application.routes.draw do
  devise_for :users
# resources:posts
resources:comments
  root "posts#index"
  resources:posts
end
