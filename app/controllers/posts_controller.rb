class PostsController < ApplicationController
	before_action :authenticate_user
	before_action :ensure_correct_user,{only:[:edit, :update]}
	def new
		@user = current_user
		@post = Post.new
	end
	def create
		@user = current_user
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
		   redirect_to post_path(@post.id),notice: "Successful posting!!"
			else
				render :new
		end
	end
	def index
		@user = current_user
		@posts = Post.all.order(id: "DESC")
	end
	def show
		@post = Post.find(params[:id])
		@user = @post.user
		@comments = @post.post_comments
		@post_comment_new = PostComment.new
	end
	def edit
		@user = current_user
		@post = Post.find(params[:id])
	end
	def update
		@user = current_user
		@post = Post.find(params[:id])
		@post.user = current_user
		if @post.update(post_params)
		   redirect_to post_path(@post.id),notice: "Successful editing!!"
		else
			render :edit
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path,notice: "Successful deleting!!"
	end
	def ensure_correct_user
         @post = Post.find(params[:id])
      if @post.user_id != current_user.id
         redirect_to post_path(@post.id)
      end
    end
	private
	def post_params
		params.require(:post).permit(:title, :body, :image, :user_id)
	end
end
