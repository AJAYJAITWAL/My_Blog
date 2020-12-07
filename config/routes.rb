Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'articles/search'
  
  get '/search' => 'articles#search', :as => 'search_page'
  
  root 'welcome#index'
  
resources :articles do
  resources :comments
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
