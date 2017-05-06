Rails.application.routes.draw do
  resources :visits
  resources :stations do
    collection do
      get "visited"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
