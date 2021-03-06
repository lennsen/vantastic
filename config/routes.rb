Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vans do
    resources :bookings, only: %i[create]
  end
    resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        get :my_offers
      end
    end
  patch '/confirm', to: "bookings#confirm"
end
