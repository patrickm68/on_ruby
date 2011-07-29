HamburgOnRuby::Application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :wishes do
    resources :votes
  end

  resources :users

  resources :events do
    get 'rss', :on => :collection
    post 'add_user', :on => :member
    get 'publish', :on => :member
    resources :materials
    resources :topics
    resources :participants
  end

  match '/auth/:provider/callback',   :to => 'sessions#create'
  match '/auth/failure',              :to => 'sessions#failure'
  match '/auth/destroy_user_session', :to => 'sessions#destroy_user_session', :as => :destroy_user_session
  match '/auth/destroy_session',      :to => 'sessions#destroy',              :as => :destroy_session
  match '/admin/logout',              :to => 'sessions#destroy' # make the logout of rails-admin functional
  match '/auth/login/:provider',      :to => 'sessions#auth',                 :as => :auth,                 :defaults => { :provider => 'twitter' }

  match '/home/info',     :to => 'home#info',     :as => :info
  match '/home/imprint',  :to => 'home#imprint',  :as => :imprint

  match '/sitemap.xml',   :to => 'misc#sitemap',  :constraints => {:format => /(xml)/}

  root :to => "home#index"
end
