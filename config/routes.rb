Rails.application.routes.draw do

  get 'stronas/index'

  get 'stronas/pokaz'

  get 'stronas/nowa'

  get 'stronas/edycja'

  get 'stronas/usun'

  root 'test#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

