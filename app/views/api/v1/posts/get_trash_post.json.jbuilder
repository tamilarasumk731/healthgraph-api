json.status true
json.total @posts.count
json.posts @posts do |post|
	json.extract! post, :id, :author, :content, :is_deleted
end