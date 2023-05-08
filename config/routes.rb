Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" }) #changed home to index
  get("/users", { :controller => "users", :action => "index" }) #changed all_users to index
  get("/users/:username", { :controller => "users", :action => "show" }) #made controller users vs user
  get("/insert_user_record", { :controller => "users", :action => "create" })
  get("/update_user/:user_id", { :controller => "users", :action => "update" }) # changed update_users to update_user

  get("/venues", { :controller => "venues", :action => "index" })
  get("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/venues/:venue_id", { :controller => "venues", :action => "show" }) #changed "an_id" to "venue_id"
  post("/update_venue/:venue_id", { :controller => "venues", :action => "update" }) #changed "an_id" to "venue_id"
  get("/delete_venue/:id_to_delete", { :controller => "venue", :action => "destroy" })

  get("/insert_comment_record", { :controller => "comments", :action => "create" })
end
