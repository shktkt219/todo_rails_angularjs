Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    resources :todo_lists, only: [:index, :show, :create, :destroy] do
      resources :todos, except: [:index, :new, :edit, :show]
    end
  end

  root 'templates#index'
  get '/dashboard' => 'templates#dashboard'
  get '/todo_lists/id' => 'templates#todo_list'

end
