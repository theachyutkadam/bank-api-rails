# frozen_string_literal: true

# == Route Map
#
require "sidekiq/web"
require "sidekiq/cron/web"
Rails.application.routes.draw do
  namespace :api do
    mount Motor::Admin => "/motor_admin"
    mount Sidekiq::Web => "/admin/sidekiq"
    resources :salaries, except: %i[new edit]
    resources :account_types, except: %i[new edit]
    resources :cards, except: %i[new edit]
    resources :nominees, except: %i[new edit]
    resources :addresses, except: %i[new edit]
    resources :particulars, except: %i[new edit]
    resources :departments, except: %i[new edit]
    resources :managers, except: %i[new edit]
    resources :customers, except: %i[new edit]
    resources :employees, except: %i[new edit]
    resources :user_informations, except: %i[new edit]
    resources :users, except: %i[new edit] do
      post "login", on: :collection
      get "logout", on: :collection
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
