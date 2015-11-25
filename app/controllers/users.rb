##### USERS ##### 
# ---------------------------------
#----------------------------------
# NEW: a user logs in
#----------------------------------
post '/sessions' do   #post /users
  p "="*100
  p "hello from NEW LOGIN post /sessions route"
  p "="*100 

  @user = User.find_by_email(params[:email])
  p "@user.password #{@user.password} params[:password] #{params[:password]}"
  if @user && @user.password == params[:password]
      session[:user_id] = @user.id

  # if @user = User.authenticate(params[:email], params[:password])
  #   session[:user_id] = @user.id 
    p "="*100
    p "hello from NEW LOGIN post /sessions route USER HAS LOGGED IN"
    p "="*100
    redirect "/users/#{session[:user_id]}"
  else
      p "="*100
      p "hello from NEW LOGIN post /sessions route ERRORS"
      p "="*100
      msg = ["User cannot be authenticated"]
      @errors = msg
      @items = Item.all
      erb :'/items/index'
   end 
end	
#----------------------------------
# NEW: a user registers
#----------------------------------
post '/users' do #post '/users/new'
  p "="*100
  p "hello from NEW REGISTER post /users route"
  p "="*100  
	@user = User.new(params[:user])
	@user.password = params[:password]
	p params
	if @user.save
  p "="*100
  p "hello from @user.save"
  p "="*100    
		session[:user_id] = @user.id	
    	redirect "/users/#{session[:user_id]}"
  	else
    	@errors = @user.errors.full_messages
    	session[:errors] = @errors
    	erb :'/items/index'
  	end	
end	
#----------------------------------
# SHOW: display user profile (specific details)
#----------------------------------
get '/users/:id' do 
  p "="*100
  p "hello from SHOW get /users/:id route"
  p "="*100  
	@user = User.find(params[:id])
  session[:user_id] = @user.id
	erb :'users/show'
end	
#----------------------------------
# LOG OUT
#----------------------------------	
delete '/sessions/:id' do
  p "="*100
  p "hello from delete /sessions/:id route"
  p "="*100  
  session[:user_id] = nil
  redirect '/'
end