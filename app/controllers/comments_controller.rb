class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
+    @post = @Post.find(params[:post_id])
+    @comment = @post.comments.new(comment_params)
+    @comment.user_id = current_user.id
     authorize @comment 
+    if @comment.save
+      redirect_to [@topic.@post,@post], notice: "Comment saved successfully."
+    else
+      redirect_to [@post.@topic,@post], notice: "Comment failed to save."
+    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
 end

  def show
    authorize @comments 
  end

    def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@post.@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.@topic, @post]
     end
   end
  end

  def edit
  end
end