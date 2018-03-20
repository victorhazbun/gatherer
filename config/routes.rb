Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"

  resources :tasks do
    member do
      patch :up
      patch :down
    end
  end

  resources :projects
end