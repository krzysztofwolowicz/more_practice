Rails.application.routes.draw do
  get 'uzytkowniks/index'

  get 'uzytkowniks/nowy'

  get 'uzytkowniks/edycja'

  get 'uzytkowniks/usun'

  get 'admin', :to => "dostep#index"
  root 'test#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

