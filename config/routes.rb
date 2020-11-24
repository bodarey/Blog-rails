Rails.application.routes.draw do
  
  devise_for :users
  #,controllers:{
  #  sessions:'users/sessions'
  #}
  # get 'comments/new'
  # get 'comments/create'
  # get 'comments/edit'
  # get 'comments/show'
  # get 'comments/update'
  # get 'comments/index'
  # get 'articles/create'
  # get 'articles/new'
  # get 'articles/show'
  # get 'articles/edit'
  # get 'articles/update'
  # get 'articles/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'articles#index'
resources :articles do 
  resources :comments

end


end
