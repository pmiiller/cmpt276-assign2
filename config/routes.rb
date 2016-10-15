Rails.application.routes.draw do
  resources :battles
  resources :battles
  resources :tokimons
  resources :trainers
  resources :people
  resources :things
  get 'say/hello'

  get 'say/goodbye'

  get 'say/index'

  match ':controller(/:action(/:id))', :via => :get
  match ':controller(/:action(/:id))', :via => :post

  resources :widgets
  resources :battle

  root 'welcome#index'

end
