class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def method_git
		
	end
	def show
		@post = Post.find(params[:id])
	end
	def new
		@post = Post.new
	end
	def create
		# @post = Post.new(params[:post])
		@post = Post.new(app_params)
		if @post.save
			redirect_to posts_path, :notice => "Your post has been saved"
		else
			render "new"
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		 if @post.update(app_params)
		 	redirect_to posts_path
		 else
		 	render "edit"
		 end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"
	end

	 private
  def app_params
    params.require(:post).permit(:title, :content, :updated_at, :created_at)
  end
end
