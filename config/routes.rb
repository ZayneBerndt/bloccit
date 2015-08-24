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
     resources :posts, except: [:index]
   end
   resources :posts, only: [] do
   resources :comments, only: [:create, :destroy]
   end
     
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
    end
   end

  get 'welcome/contact'

 get 'about' => 'welcome#about'

 get 'advertisement' =>'posts#advertisement'

 get 'question' => 'question#new'

  root to: "welcome#index"


end
