Rails.application.routes.draw do
  root to:'homes#top'
  resources :books
  get 'top' => 'homes#top'
  get 'start' => 'books#index'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  #get 'books' => 'books#edit'
  #get 'books' => 'books#show'
  get 'books/:id' => 'books#show', as:'booklist'
  get 'books/:id/edit' => 'books#edit', as:'edit_booklist'
  patch 'books/:id' => 'books#update', as:'update_booklist'
  delete 'books/:id' => 'books#destroy', as:'destroy_booklist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
