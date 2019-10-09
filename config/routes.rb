Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do

      get "videos/index", to: "videos#index"
      put "channels/update", to: "channels#update"

  end

end
