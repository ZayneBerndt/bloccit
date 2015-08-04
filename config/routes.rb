Rails.application.routes.draw do
  
 devise_for :users
 resources :questions
 resources :advertisements
 
 resources :topics do
     resources :posts, except: [:index]
   end

  get 'welcome/contact'

 get 'about' => 'welcome#about'

 get 'advertisement' =>'posts#advertisement'

 get 'question' => 'question#new'

  root to: "welcome#index"


end
