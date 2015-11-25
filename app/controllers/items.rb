##### ITEMS ##### 
# before '/users/*' do
# 	pass if params['splat'][0] == "new"
# 	if (session[:user_id].nil?)
# 		redirect '/'
# 	end
# 	p "Success"
# end
# --------------------------
# --------------------------
#  INDEX ROUTE - retrieves list of items
# --------------------------	
get '/items' do
	@user = User.find(session[:user_id]) if session[:user_id]	
	@items = Item.all
	erb :"items/index"
end	
# --------------------------
# NEW/CREATE - Make a new item
# here the person gets a form to 
# make a new item and that form 
# is a form to post to Create to 
# make the new item.
# --------------------------
get '/items/new' do
	@user = User.find(session[:user_id])
	erb :"items/new"
end
# --------------------------
# CREATE (new and create are partner routes)
# --------------------------
post '/items' do 	
	@user = User.find(session[:user_id])
	@item = @user.items.new(params[:item])	
	if @item.save		
		redirect "/items/#{@item.id}"
	else
		@errors = @item.errors.full_messages
		erb :"items/new"
	end
end	
# --------------------------
# SHOW ROUTE - Shows a new item
# --------------------------
get '/items/:id' do	
	@user = User.find(session[:user_id])	
	@item = Item.where(id: params[:id]).first
	if @item
		erb :"items/show"
	else
		@errors = @item.errors.full_messages
		status 404
		"Item Not Found"
	end
end	
# --------------------------
# EDIT ROUTE
# --------------------------
get '/items/:id/edit' do	
	@user = User.find(session[:user_id])	
	@item = Item.where(id: params[:id]).first
	if @item
		erb :"items/edit"
	else
		@errors = @item.errors.full_messages
		status 404
		"Item Not Found"
	end
end			 
# --------------------------
# UPDATE ROUTE
# --------------------------
put '/items/:id' do
	@user = User.find(session[:user_id])		
	@item = Item.where(id: params[:id]).first
	@item.update_attributes(params[:item])
	if @item.save
		redirect "/items/#{@item.id}"
	else
		@errors = @item.errors.full_messages
		status 401
		erb :"items/edit"
	end
end	
# --------------------------
# DELETE ROUTE
# --------------------------
get '/items/:id/delete' do   	
	@user = User.find(session[:user_id])
	@item = Item.where(id: params[:id]).first
	if @item.destroy
		redirect '/'
	else
		status 404
		"Item not found"
	end
end			