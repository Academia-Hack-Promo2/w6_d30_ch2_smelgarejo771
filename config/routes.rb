Rails.application.routes.draw do
    get "/todos" => "todos#show" 
  get "/todos/:id" => "todos#showspecifit"
  post "/todos" => "todos#create"
  put "/todos/:id" => "todos#update"
  delete "/todos/:id" => "todos#delete"
end
