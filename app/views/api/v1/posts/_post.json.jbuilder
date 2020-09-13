json.extract! post, :id, :author, :content, :is_deleted if !post.is_deleted
json.comments post.comments , partial: 'api/v1/posts/comment', as: :comment