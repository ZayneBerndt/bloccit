Rails.application.routes.draw do
  

 resources :posts, :question,:advertisement

  get 'welcome/contact'

 get 'about' => 'welcome#about'

 get 'advertisement' =>'posts#advertisement'

 get 'question' => 'question#new'

  root to: "welcome#index"


end
