Rails.application.routes.draw do
  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Friend request resource:

  # CREATE
  post("/insert_friend_request", { :controller => "friend_requests", :action => "create" })
          
  # READ
  get("/friend_requests", { :controller => "friend_requests", :action => "index" })
  
  get("/friend_requests/:path_id", { :controller => "friend_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_friend_request/:path_id", { :controller => "friend_requests", :action => "update" })
  
  # DELETE
  get("/delete_friend_request/:path_id", { :controller => "friend_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Claim resource:

  # CREATE
  post("/insert_claim", { :controller => "claims", :action => "create" })
          
  # READ
  get("/claims", { :controller => "claims", :action => "index" })
  
  get("/claims/:path_id", { :controller => "claims", :action => "show" })
  
  # UPDATE
  
  post("/modify_claim/:path_id", { :controller => "claims", :action => "update" })
  
  # DELETE
  get("/delete_claim/:path_id", { :controller => "claims", :action => "destroy" })

  #------------------------------

  # Routes for the Receipt resource:

  # CREATE
  post("/insert_receipt", { :controller => "receipts", :action => "create" })
          
  # READ
  get("/receipts", { :controller => "receipts", :action => "index" })
  
  get("/receipts/:path_id", { :controller => "receipts", :action => "show" })
  
  # UPDATE
  
  post("/modify_receipt/:path_id", { :controller => "receipts", :action => "update" })
  
  # DELETE
  get("/delete_receipt/:path_id", { :controller => "receipts", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"

end
