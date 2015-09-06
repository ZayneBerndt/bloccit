require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "favorited(post)" do
     before do
     @post = associated_post
     @user = authenticated_user
   end

   it "returns `nil` if the user has not favorited the post" do
     expect( @user.favorited(@post) ).to be_nil
   end

   it "returns favorite" do
     favorite = Favorite.new
     expect( @user.favorite ).to eq( favorited(@post) )
   end

   it "returns `nil` if the user has favorited another post" do

   end
  end
end  
