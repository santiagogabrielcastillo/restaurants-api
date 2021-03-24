Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # GET /api/v1/restaurants
      # GET /api/v1/restaurants/:id
      # PATCH /api/v1/restaurants/:id authenticated!!!!
      # POST /api/v1/restaurants
      # DELETE /api/v1/restaurants/:id authenticated!!!
      resources :restaurants, only: %I[index show update create destroy]


      # GET api/v1/restaurants/:restaurant_id/comments
      # GET api/v1/restaurants/:restaurant_id/comments/:id
      # POST api/v1/restaurants/restaurant_id/comments
      # PATCH api/v1/restaurants/:restaurant_id/comments/:id
      # DELETE api/v1/restaurants/:restaurant_id/comments/:id
      resources :restaurants do
        resources :comments, only: %I[show index create update destroy]
      end
    end
  end
end
