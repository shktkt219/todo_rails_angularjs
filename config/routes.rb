Rails.application.routes.draw do
  root 'templates#index'
  get '/dashboard' => 'templates#dashboard'
  get '/todo_list' => 'templates#todo_list'

  namespace :api, defaults: { format: :json } do
    resources :todo_lists, only: :show do
      resources :todos, except: [:index, :new, :edit, :show]
    end
  end
end
