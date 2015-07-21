Rails.application.routes.draw do
  

 devise_for :users
 resources :posts
 resources :questions
 resources :advertisements

  get 'welcome/contact'

 get 'about' => 'welcome#about'

 get 'advertisement' =>'posts#advertisement'

 get 'question' => 'question#new'

  root to: "welcome#index"


end
