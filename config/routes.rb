Rails.application.routes.draw do
  
 resources :posts, :advertisement

  get 'welcome/contact'

 get 'about' => 'welcome#about'

 get 'advertisement' =>'posts#advertisement'

  root to: "welcome#index"


end
