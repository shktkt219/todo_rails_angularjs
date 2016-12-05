Rails.application.routes.draw do

  root 'templates#index'
  get '/home' => 'templates#home'
  get '/dashboard' => 'templates#index'
  get '/todo_lists/:id' => 'templates#index'
  get '/help' => 'templates#help'
  get '/about' => 'templates#about'
  get '/templates/:path.html' => 'templates#template', constraints: { path: /.+/ }

  namespace :api, defaults: { format: :json } do
    resources :todo_lists, only: [:index, :show, :create, :destroy] do
      resources :todos, except: [:index, :new, :edit, :show]
    end
  end

end
