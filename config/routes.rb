Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    	resource :posts, only: [:index] do
	      collection do
	      	post 		"/", 					to: "posts#create_post"
	      	get  		"/",					to: "posts#get_all_post"
	      	put  		"/trash", 		to: "posts#soft_delete_post"
	      	put  		"/restore",  	to: "posts#restore_post"
	      	delete 	"/delete", 		to: "posts#delete_post"

	      	get 		"/trash",			to: "posts#get_trash_post"
	      end
	    end

	    resource :comments, only: [] do
	      collection do
	      	post 		"/", 					to: "comments#create_comment"
	      	put  		"/trash", 		to: "comments#soft_delete_comment"
	      	put  		"/restore",  	to: "comments#restore_comment"
	      	delete 	"/delete", 		to: "comments#delete_comment"

	      	get 		"/trash",			to: "comments#get_trash_comment"

	      end
	    end

    end
  end

end
