##### RATINGS #####
# --------------------------
# --------------------------
#  INDEX ROUTE - retrieves list of ratings
# --------------------------
get '/ratings' do
	p "="*100
	p "hello from get /ratings route"
	p "="*100
	@scores = Rating.all
	erb :"ratings/index"
end
# --------------------------
# NEW/CREATE - Make a new bid
# here the person gets a form to
# make a new bid and that form
# is a form to post to Create to
# make the new bid.
# --------------------------
get '/ratings/new' do
	p "="*100
	p "hello from get /ratings/new route"
	p "="*100
	erb :"ratings/new"
end
# --------------------------
# CREATE (new and create are partner routes)
# --------------------------
post '/ratings' do
	p "="*100
	p "hello from post /ratings route"
	p "="*100
	@user = User.find(params[:id])
	session[:user_id] = @user.id
	@score = @user.ratings.new(params[:score])
	if @score.save
		p "="*100
		p "hello from @score.save post /ratings/new route"
		p "="*100
		redirect "/ratings/#{@score.id}"
	else
		@errors = @score.errors.full_messages
		erb :"ratings/new"
	end
end
# --------------------------
# SHOW ROUTE - Shows a new bid
# --------------------------
get '/ratings/:id' do
		p "="*100
		p "hello from SHOW get /ratings/:id route"
		p "="*100
	@score = Rating.where(id: params[:id]).first
	if @score
		erb :"ratings/show"
	else
		@errors = @score.errors.full_messages
		status 404
		"Rating Not Found"
	end
end
# --------------------------
# EDIT ROUTE
# --------------------------
get '/ratings/:id/edit' do
		p "="*100
		p "hello from EDIT get /ratings/:id/edit route"
		p "="*100
	@score = Rating.find(params[:id])
	if @score
		erb :"ratings/edit"
	else
		@errors = @score.errors.full_messages
		status 404
		"Rating Not Found"
	end
end
# --------------------------
# UPDATE ROUTE
# --------------------------
put '/ratings/:id' do
		p "="*100
		p "hello from UPDATE put /ratings/:id route"
		p "="*100
	@score = Rating.find(params[:id])
	@score.update_attributes(params[:score])
	if @score.save
		redirect "/ratings/#{@score.id}"
	else
		@errors = @score.errors.full_messages
		status 401
		erb :"ratings/edit"
	end
end
# --------------------------
# DELETE ROUTE
# --------------------------
get '/delete-ratings/:id' do
	@score = Rating.find(params[:id])
	if @score.destroy
		redirect '/'
	else
		status 404
		"Rating not found"
	end
end
