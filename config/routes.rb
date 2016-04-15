Rails.application.routes.draw do
  devise_for :users

  root "landing#home"

  resources :leads do
    member do
      post 'claim'
      post 'unclaim'
    end
  end

  get '/my_leads' => 'claims#index'
end
