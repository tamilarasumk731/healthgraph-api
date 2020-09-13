module Api
  module V1
    class PostsController < ApplicationController

    	def create_post
    		@post = Post.new(post_params)
    		unless @post.save 
	          render json: { status: false, messages: @post.errors.full_messages.to_sentence }, status: :ok and return
	        else
	          render json: {status: true, message: "Post creation successful"}, status: :ok and return
	        end
    	end

    	def get_all_post
    		@posts = Post.where(is_deleted: false)
    	end

    	def get_trash_post
    		@posts = Post.where(is_deleted: true)
    	end

    	def soft_delete_post
    		@post = Post.find(params[:postId])
    		if @post
    			@post.update(is_deleted: true)
    			render json: {status: true, message: "Post moved to trash"}, status: :ok and return
    		else
    			render json: {status: false, message: "Post not found"}, status: :ok and return
    		end
    	end

    	def restore_post
    		@post = Post.find(params[:postId])
    		begin
	    		if @post
	    			@post.update(is_deleted: false)
	    			@post.comments.update_all(is_deleted: false)

	    			render json: {status: true, message: "Post restored to feed"}, status: :ok and return
	    		else
	    			render json: {status: false, message: "Post not found"}, status: :ok and return
	    		end
	    	rescue Exception => e
          return render json: {status: false, error: e.message }, status: :ok
        end
    	end

    	def delete_post
    		@post = Post.find(params[:postId])
    		begin
	    		if @post
	    			@post.destroy
	    			render json: {status: true, message: "Post deleted successful"}, status: :ok and return
	    		else
	    			render json: {status: false, message: "Post not found"}, status: :ok and return
	    		end
	    	rescue Exception => e
          return render json: {status: false,	 error: e.message }, status: :ok
        end
    	end


    	private
    	def post_params
    		params.require(:post).permit(:author, :content)
    	end

    end
  end
end