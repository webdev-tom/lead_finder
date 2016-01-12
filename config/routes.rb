Rails.application.routes.draw do
  devise_for :users
  root "leads#index"
end
