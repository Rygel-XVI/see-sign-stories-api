Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do

      get "video/index", to: "video#index"
      get "channel/index", to: "channel#index"
      put "channel/update", to: "channel#update"

  end

end
