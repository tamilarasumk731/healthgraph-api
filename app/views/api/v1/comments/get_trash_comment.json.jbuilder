json.status true
json.total @comments.count
json.comments @comments do |comment|
	json.extract! comment, :id, :post_id, :author, :desc, :is_deleted
end