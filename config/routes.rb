Rails.application.routes.draw do
  
  get 'comments/create'

  get 'comments/show'

  get 'comments/destroy'

  get 'comments/edit'

 devise_for :users
 resources :users, only: [:update]
 resources :questions
 resources :advertisements
 
 resources :topics do
     resources :posts, except: [:index] do
     resources :comments, only: [:create, :destroy]
    end
   end

  get 'welcome/contact'

 get 'about' => 'welcome#about'

 get 'advertisement' =>'posts#advertisement'

 get 'question' => 'question#new'

  root to: "welcome#index"


end
