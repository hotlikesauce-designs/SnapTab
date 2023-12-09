Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "landing#show"

  get("/", { :controller => "landing", :action => "show" })


  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the Membership resource:

  # CREATE
  post("/insert_membership/:group_id", { :controller => "memberships", :action => "create" })
          
  # READ
  get("/memberships", { :controller => "memberships", :action => "index" })
  
  get("/memberships/:path_id", { :controller => "memberships", :action => "show" })
  
  # UPDATE
  
  post("/modify_membership/:path_id", { :controller => "memberships", :action => "update" })
  
  # DELETE
  get("/delete_membership/:path_id", { :controller => "memberships", :action => "destroy" })

  #------------------------------

  # Routes for the Line item resource:

  # CREATE
  post("/insert_line_item", { :controller => "line_items", :action => "create" })
          
  # READ
  get("/line_items", { :controller => "line_items", :action => "index" })
  
  get("/line_items/:path_id", { :controller => "line_items", :action => "show" })
  
  # UPDATE
  
  post("/modify_line_item/:path_id", { :controller => "line_items", :action => "update" })
  
  # DELETE
  get("/delete_line_item/:path_id", { :controller => "line_items", :action => "destroy" })

  #------------------------------

  # Routes for the Group resource:

  # CREATE
  post("/insert_group", { :controller => "groups", :action => "create" })
          
  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  
  get("/groups/:path_id", { :controller => "groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_group/:path_id", { :controller => "groups", :action => "update" })
  
  # DELETE
  get("/delete_group/:path_id", { :controller => "groups", :action => "destroy" })

  #------------------------------

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

  # ACCEPT
  post("/accept_friend_request/:path_id", { :controller => "friend_requests", :action => "accept" })
  
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



end
