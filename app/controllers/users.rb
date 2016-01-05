post '/signup' do
	puts "[LOG] Getting /signup"
	user = User.new(params[:user])
	user.save
	@flash = 'Account successfully created. Please login with your username/password.'
	erb :"static/main"
end


post '/login' do
	puts "[LOG] Getting /login"
	user = User.find_by_email(params[:user][:email])
	if user.authenticate(params[:user][:password])
		session['user_id'] = user.id
		redirect '/index'
	else
		redirect '/'
	end
end


get '/logout' do
	session['user_id'] = ""
	@flash = 'Successfully logged out.'
	erb :"static/main"
end