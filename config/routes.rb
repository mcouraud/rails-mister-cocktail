Rails.application.routes.draw do
root "cocktails#index"
resources :cocktails, only: [:index, :show , :create, :new] do
    resources :doses, only: [ :create]
  end
resources :doses, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
