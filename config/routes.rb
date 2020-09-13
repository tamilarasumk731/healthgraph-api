Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    	resources :post do
        collection do
        	post 		"/", 					to: "post#create_post"
        	put  		"/trashing", 	to: "post#soft_delete_post"
        	put  		"/restore",  	to: "post#restore_post"
        	delete 	"/delete", 		to: "post#delete_post"
        	get  		"/",					to: "post#get_all"
          post :signup
          post :login
          post :resend_otp
          post :update_name
        end
      end
    end
  end

end
