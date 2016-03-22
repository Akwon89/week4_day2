USERS = [{
  id: 1,
  username: "Akwon89",
  password: "123"
  }, {
  id: 2,
  username: "Bob",
  password: "123"
  }, {
  id: 99,
  username: "Akwon89",
  password: 123
}]

#order doesnt matter, keep in action file
helpers do
  #check database to see if user exists, if exists return user other wise nil.
  def current_user
    USERS.find { |u| u[:id] == session[:user_id] }
  end

end

# Homepage (Root path)
get '/' do
  erb :index
end

post '/login' do
  user = USERS.find { |u| u[:username] == params[:username] }
  if user && user[:password] == params[:password]
    session[:user_id] = user[:id]
  end
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end