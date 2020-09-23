class PostCommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post_comment_new = PostComment.new(post_comment_params)
		@user = @post.user
		@comments = @post.post_comments
		@post_comment_new.user_id = current_user.id
		@post_comment_new.post_id = @post.id
		if @post_comment_new.save
			redirect_to post_path(@post.id),notice: "Successful comment posting!!"
		else
			flash[:alert] = "Posting error!!"
			render template: 'posts/show'
		end
	end
	def destroy
		@comment = PostComment.find(params[:post_id])
		@comment.destroy
		redirect_to request.referer,notice: "Successful deleting!!"
	end
	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
