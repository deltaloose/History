class PostImagesController < ApplicationController
	before_action :authenticate_user!
	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(post_image_params)
	    @post_image.user_id = current_user.id
	    @post_image.save
	    redirect_to root_path
	end

	def index
		@post_images = PostImage.all
	end

	def show
		@post_image = PostImage.find(params[:id])
    	@post_comment = PostComment.new
	end

	private
	def post_image_params
		params.require(:post_image).permit(:shop_name, :image, :caption)
	end
end
