Rails.application.routes.draw do
  devise_for :users
  root "leads#index"

  resources :leads do
    member do
      post 'claim'
      post 'unclaim'
    end
  end
end
