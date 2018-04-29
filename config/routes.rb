Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  get 'oppai' => 'oppai#index'
  get 'lessons/form' => 'lessons#form'
  get 'lessons/hello' => 'lessons#hello'
  get 'lessons/register' => 'lessons#register'
  resources :plan_items do
    get :of_today, on: :collection
  end
end
