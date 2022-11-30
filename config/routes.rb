# == Route Map
#

Rails.application.routes.draw do
  get 'salaries/index'
  post 'salaries/create'
  put 'salaries/update'
  get 'salaries/show'
  get 'salaries/delete'

  get 'account_types/index'
  post 'account_types/create'
  put 'account_types/update'
  get 'account_types/show'
  get 'account_types/delete'

  get 'cards/index'
  post 'cards/create'
  put 'cards/update'
  get 'cards/show'
  get 'cards/delete'

  get 'nominees/index'
  post 'nominees/create'
  put 'nominees/update'
  get 'nominees/show'
  get 'nominees/delete'

  get 'addresses/index'
  post 'addresses/create'
  put 'addresses/update'
  get 'addresses/show'
  get 'addresses/delete'

  get 'particular_users/index'
  post 'particular_users/create'
  put 'particular_users/update'
  get 'particular_users/show'
  get 'particular_users/delete'

  get 'particulars/index'
  post 'particulars/create'
  put 'particulars/update'
  get 'particulars/show'
  get 'particulars/delete'

  get 'departments/index'
  post 'departments/create'
  put 'departments/update'
  get 'departments/show'
  get 'departments/delete'

  get 'managers/index'
  post 'managers/create'
  put 'managers/update'
  get 'managers/show'
  get 'managers/delete'

  get 'customers/index'
  post 'customers/create'
  put 'customers/update'
  get 'customers/show'
  get 'customers/delete'

  get 'employees/index'
  post 'employees/create'
  put 'employees/update'
  get 'employees/show'
  get 'employees/delete'

  get 'users/index'
  post 'users/create'
  put 'users/update'
  get 'users/show'
  get 'users/delete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
