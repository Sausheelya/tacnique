# config/routes.rb
Rails.application.routes.draw do
  # Active Admin + Devise for admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Public quiz pages
  root to: 'quizzes#index'

  resources :quizzes, only: [] do
    member do
      get  :take     # /quizzes/:id/take
      post :submit   # /quizzes/:id/submit
      get  :results  # /quizzes/:id/results
    end
  end
end

