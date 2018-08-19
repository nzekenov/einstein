Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :authors
  authenticated :author do
    root 'blog/lessons#index', as: :authenticated_root
  end

  root 'blog/pages#welcome'
  namespace :authors do
    get '/account' => 'accounts#edit', as: :account
    put '/info' => 'accounts#update_info', as: :info
    put '/change_password' => 'accounts#change_password', as: :change_password
    resources :lessons do
      put 'publish' => 'lessons#publish', on: :member
      put 'unpublish' => 'lessons#unpublish', on: :member
    end
  end


  scope module: 'blog' do
    resources :categories, only: [:show]
    get 'lessons' => 'lessons#index', as: :lessons
    get 'lessons/:id' => 'lessons#show', as: :lesson
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
