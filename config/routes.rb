Rails.application.routes.draw do
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
