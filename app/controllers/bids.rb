##### BIDS ##### 
# --------------------------
# --------------------------
#  INDEX ROUTE - retrieves list of bids
# --------------------------	
get '/bids' do
	p "="*100
	p "hello from get /bids route"
	p "="*100
	@bids = Bid.all
	erb :"bids/index"
end	
# --------------------------
# NEW/CREATE - Make a new bid
# here the person gets a form to 
# make a new bid and that form 
# is a form to post to Create to 
# make the new bid.
# --------------------------
get '/bids/new' do
	p "="*100
	p "hello from get /bids/new route"
	p "="*100
	erb :"bids/new"
end
# --------------------------
# CREATE (new and create are partner routes)
# --------------------------
post '/bids' do 
	p "="*100
	p "hello from post /bids route"
	p "="*100
	@user = User.find(params[:id])
	session[:user_id] = @user.id
	@bid = @user.bids.new(params[:bid])	
	if @bid.save
		p "="*100
		p "hello from @bid.save post /bids/new route"
		p "="*100		
		redirect "/bids/#{@bid.id}"
	else
		@errors = @bid.errors.full_messages
		erb :"bids/new"
	end
end	
# --------------------------
# SHOW ROUTE - Shows a new bid
# --------------------------
get '/bids/:id' do
		p "="*100
		p "hello from SHOW get /bids/:id route"
		p "="*100	
	@bid = Bid.where(id: params[:id]).first
	if @bid
		erb :"bids/show"
	else
		@errors = @bid.errors.full_messages
		status 404
		"Bid Not Found"
	end
end	
# --------------------------
# EDIT ROUTE
# --------------------------
get '/bids/:id/edit' do
		p "="*100
		p "hello from EDIT get /bids/:id/edit route"
		p "="*100	
	@bid = Bid.where(id: params[:id]).first
	if @bid
		erb :"bids/edit"
	else
		@errors = @bid.errors.full_messages
		status 404
		"Bid Not Found"
	end
end			 
# --------------------------
# UPDATE ROUTE
# --------------------------
put '/bids/:id' do
		p "="*100
		p "hello from UPDATE put /bids/:id route"
		p "="*100	
	@bid = Bid.where(id: params[:id]).first
	@bid.update_attributes(params[:bid])
	if @bid.save
		redirect "/bids/#{@bid.id}"
	else
		@errors = @bid.errors.full_messages
		status 401
		erb :"bids/edit"
	end
end	
# --------------------------
# DELETE ROUTE
# --------------------------
get '/delete-bids/:id' do
	@bid = Bid.where(id: params[:id]).first
	if @bid.destroy
		redirect '/'
	else
		status 404
		"Bid not found"
	end
end	