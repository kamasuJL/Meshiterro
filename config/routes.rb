Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"

  resources :users, only: [:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # 以下3行の記載なしでログアウトできなかったので追記してます（AI質問
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
