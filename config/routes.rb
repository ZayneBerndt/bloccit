Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index] 
  resources :questions
  resources :advertisements
  resources :summaries

  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
     #do
    #   resources :comments, only: [:create, :destroy]
    # end
  end


  # resources :topics do
  #   resources :posts, except: [:index]

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'welcome/contact'

  get 'about' => 'welcome#about'

  get 'advertisement' =>'posts#advertisement'

  get 'question' => 'question#new'

  root to: "welcome#index"

end 
