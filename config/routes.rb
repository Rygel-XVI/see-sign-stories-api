Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "api/video#index"

  namespace :api do
    resources :video, :channel, only: [:index, :new, :update, :destroy]
  end

end
