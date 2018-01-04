class FavoritesController < ApplicationController

def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)

     if favorite.save
        flash[:notice] = "Successfully favorited"
        redirect_to [post.topic, post]
     else
       flash[:error] = "Unsuccesful favorite attempt, please try again."
       redirect_to [post]
     end
   end

def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite

   if favorite.destroy
     flash[:notice] = "Post successfully unfavorited"
     redirect_to [post.topic, post]
   else
     flash[:error] = "Unfavorite attempt unsuccesful, please try again."
     redirect_to [post]
   end
 end
end
