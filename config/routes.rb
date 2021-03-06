Rails.application.routes.draw do
  resources :questions
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :quizzes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
