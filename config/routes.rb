Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/todos', to: 'todos#new'
  get 'todos/new'
  post '/todos', to: 'todos#create'
  get 'todos/:id', to: 'todos#show', as: 'todo'
  get 'todos/:id/edit', to: 'todos#edit',  as:'edit_todo'
  patch 'todos/:id', to: 'todos#update'
  delete 'todos/:id', to: 'todos#destroy', as:'delete_todo'
  get 'todos/:id/complete', to: 'todos#complete', as:'complete_todo'
  get 'listaa', to:'todos#list', as:'list_todo'
  root 'todos#index'

end
