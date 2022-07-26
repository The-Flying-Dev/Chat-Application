Rails.application.routes.draw do
 
  resources :posts, only: [:index, :create] do 
    get 'like'
    get 'repost'
  end
  
  root 'posts#index'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
