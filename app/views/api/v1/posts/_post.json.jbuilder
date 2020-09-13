json.extract! post, :id, :author, :content, :is_deleted if !post.is_deleted
json.comments post.comments do |comment|
	json.extract! comment, :id, :author, :desc, :is_deleted if !comment.is_deleted
end