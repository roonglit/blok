Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    post :share, on: :member
  end

  root to: 'articles#index'
end
