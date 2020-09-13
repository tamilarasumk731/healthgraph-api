module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post

      def create_comment
        @comment = @post.comment.new(author: comment_params[:author], desc: comment_params[:desc])
        if @post.save 
          render json: {status: true, message: "Post creation successful"}, status: :ok and return
        else
          render json: { status: false, messages: @post.errors.full_messages.to_sentence }, status: :unprocessable_entity and return
        end
      end

      def soft_delete_comment
        @commnet = Comment.find(params[:commentId])
        if @comment
          @comment.update(is_delted: true)
          render json: {status: true, message: "Comment moved to trash"}, status: :ok and return
        else
          render json: {status: false, message: "Comment not found"}, status: :not_found and return
        end
      end

      def restore_comment
        @comment = Comment.find(params[:commentId])
        begin
          if @comment
            @comment.update(is_delted: false)
            render json: {status: true, message: "Comment restored to feed"}, status: :ok and return
          else
            render json: {status: false, message: "Comment not found"}, status: :not_found and return
          end
        rescue Exception => e
          return render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def detele_comment
        @comment = Comment.find(params[:commentId])
        begin
          if @comment
            @comment.destroy
            render json: {status: true, message: "Comment deleted successful"}, status: :ok and return
          else
            render json: {status: false, message: "Comment not found"}, status: :not_found and return
          end
        rescue Exception => e
          return render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      private
      def comment_params
        params.require(:comment).permit(:author, :desc, :post_id)
      end

      def set_post
        @post = Post.find(comment_params[:post_id])
        unless @post
          render json: {status: false, message: "Post not found"}, status: :not_found and return
        end
      end
    end
  end
end