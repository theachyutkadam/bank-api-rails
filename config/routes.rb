# == Route Map
#

Rails.application.routes.draw do
  resources :salaries, except: %i[new edit]
  resources :account_types, except: %i[new edit]
  resources :cards, except: %i[new edit]
  resources :nominees, except: %i[new edit]
  resources :addresses, except: %i[new edit]
  resources :particular_details, except: %i[new edit]
  resources :particulars, except: %i[new edit]
  resources :departments, except: %i[new edit]
  resources :managers, except: %i[new edit]
  resources :customers, except: %i[new edit]
  resources :employees, except: %i[new edit]
  resources :users, except: %i[new edit]
  resources :user_informations, except: %i[new edit]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
