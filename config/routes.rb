Rails.application.routes.draw do
  
 
  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  authenticated :user do
      root :to => 'main#index', as: :authenticated_root
  end
  root :to => 'welcome#index'
  
  get 'programas' => 'main#programas', as: :programas
  get 'riesgo' => 'riesgo#index', as: :riesgo
  get '/riesgo/cancerseno' => 'riesgo#cancerseno', as: :cancerseno

  resources :users_admin, :controller => 'users' 
  match 'users_admin/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  
  
  resources :encuestasenos  do
    get :list, on: :collection
    get :export, on: :collection    
  end  
  resources :divpas do
    get :list, on: :collection
    get :export, on: :collection    
  end
  resources :eps do
    get :list, on: :collection
    get :export, on: :collection
    get :searcheps, :on => :collection
  end
  resources :consultorios do
    get :list, on: :collection
    get :export, on: :collection
  end
  resources :servicios do
    get :list, on: :collection
    get :export, on: :collection
  end
  resources :cita do
    get :list, on: :collection
    get :export, on: :collection    
  end
  resources :especialidads do
    get :list, on: :collection
    get :export, on: :collection
  end
  resources :profesionals do
    get :list, on: :collection
    get :export, on: :collection
  end
  resources :pacientes do
    get :list, on: :collection
    get :export, on: :collection    
    get :searchpaciente, :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
