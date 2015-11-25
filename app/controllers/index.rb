get '/' do 
	p "="*100
	p "hello from / route"
	redirect '/items'
end	