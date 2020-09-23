class UsersController < ApplicationController
	before_action :authenticate_user
     before_action :ensure_correct_user,{only:[:edit, :update]}
	def index
		@user = current_user
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.all.order(id: "DESC")
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   redirect_to user_path(@user.id),notice: "Successful editing!!"
		else
			render :edit
		end
	end
	def ensure_correct_user
      @user = User.find(params[:id])
      if @user.id != current_user.id
         redirect_to user_path(current_user.id)
      end
    end
	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
