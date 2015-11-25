###Oridnary users only needs index and show pages
###Admin will also have access to edit, create, and delete
###functions


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
#  INDEX ROUTE - retrieves list of hospitals
# --------------------------
get '/hospitals' do
	@user = User.find(session[:user_id]) if session[:user_id]
	@hospitals = Hospital.all
	erb :"hospitals/index"
end
# --------------------------
# NEW/CREATE - Make a new hospital
# here the person gets a form to
# make a new hospital and that form
# is a form to post to Create to
# make the new hospital.
# --------------------------
get '/hospitals/new' do
	@user = User.find(session[:user_id])
	erb :"hospitals/new"
end
# --------------------------
# CREATE (new and create are partner routes)
# --------------------------
post '/hospitals' do
	###general users do not create new hospitals
	###maybe admin can create new
	@user = User.find(session[:user_id])
	@hospital = @user.hospitals.new(params[:hospital])
	if @hospital.save
		redirect "/hospitals/#{@hospital.id}"
	else
		@errors = @hospital.errors.full_messages
		erb :"hospitals/new"
	end
end
# --------------------------
# SHOW ROUTE - Shows a new hospital
# --------------------------
get '/hospitals/:id' do
	@user = User.find(session[:user_id])
	@hospital = Hospital.where(id: params[:id]).first
	if @hospital
		erb :"hospitals/show"
	else
		@errors = @hospital.errors.full_messages
		status 404
		"Hospital Not Found"
	end
end
# --------------------------
# EDIT ROUTE
# --------------------------
get '/hospitals/:id/edit' do
	@user = User.find(session[:user_id])
	@hospital = Hospital.where(id: params[:id]).first
	if @hospital
		erb :"hospitals/edit"
	else
		@errors = @hospital.errors.full_messages
		status 404
		"Hospital Not Found"
	end
end
# --------------------------
# UPDATE ROUTE
# --------------------------
put '/hospitals/:id' do
	@user = User.find(session[:user_id])
	@hospital = Hospital.where(id: params[:id]).first
	@hospital.update_attributes(params[:hospital])
	if @hospital.save
		redirect "/hospitals/#{@hospital.id}"
	else
		@errors = @hospital.errors.full_messages
		status 401
		erb :"hospitals/edit"
	end
end
# --------------------------
# DELETE ROUTE
# --------------------------
get '/hospitals/:id/delete' do
	@user = User.find(session[:user_id])
	@hospital = Hospital.where(id: params[:id]).first
	if @hospital.destroy
		redirect '/'
	else
		status 404
		"Hospital not found"
	end
end
