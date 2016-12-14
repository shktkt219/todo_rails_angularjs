Rails.application.routes.draw do

  root 'templates#home'
  get '/home' => 'templates#home'
  get '/index/dashboard' => 'templates#index'
  get '/index/todo_lists/:id' => 'templates#index'
  get '/help' => 'templates#help'
  get '/about' => 'templates#about'
  get '/templates/:path.html' => 'templates#template', constraints: { path: /.+/ }

  namespace :api, defaults: { format: :json } do
    resources :todo_lists, only: [:index, :show, :create, :destroy] do
      resources :todos, except: [:index, :new, :edit]
    end
  end

end
