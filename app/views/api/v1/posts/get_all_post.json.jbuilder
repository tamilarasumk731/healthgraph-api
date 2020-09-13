json.status true
json.total @posts.count
json.posts @posts, partial: 'api/v1/posts/post', as: :post