Rails.application.routes.draw do


  get 'zdjecies/index'

  get 'zdjecies/nowa'

  get 'zdjecies/pokaz'

  get 'zdjecies/edycja'

  get 'zdjecies/usun'

  get 'galeries/index'

  get 'galeries/nowa'

  get 'galeries/pokaz'

  get 'galeries/edycja'

  get 'galeries/usun'

  root 'test#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

