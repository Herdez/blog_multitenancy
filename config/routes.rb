Subscribem::Engine.routes.draw do
  root "dashboard#index"
  #route for sign_up view
  get "/sign_up", :to => "accounts#new", :as => :sign_up
  post "/accounts", :to => "accounts#create", :as => :accounts
end
