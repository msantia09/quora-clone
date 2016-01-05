
get '/index' do
	@user = User.find_by_id(session[:user_id])
	@all_questions = Question.all
	erb :"static/index"
end

# not used anywhere i think
get '/questions/new' do 
	erb :"static/index"
end

get '/questions' do
	# @user = User.find_by_id(session[:user_id])
	# @my_questions = @user.questions
	# erb :"static/my_questions"
end

post '/questions' do
	@user = User.find_by_id(session[:user_id])
	@question = @user.questions.new(params[:question])
	# @question.user_id = session[:user_id]

	if @question.save
		redirect "/question/#{@question.id}"
	else
		erb :"static/index"
	end
end

get '/question/:question_id' do
	@question = Question.find(params[:question_id])
	erb :"static/show"
end

post '/question/:question_id' do
	byebug
	@question = Question.find(params[:question_id])
	@question.delete
	redirect '/index'
end

get '/my_questions' do
	@user = User.find_by_id(session[:user_id])
	@my_questions = @user.questions
	erb :"static/my_questions"
end

post '/questions/:question_id/pre-edit-q' do
	@question = Question.find(params[:question_id])
	erb :"static/edit"
end

post '/questions/:question_id/edit' do
	@question = Question.find(params[:question_id])
	@question.update(params[:question])

	redirect "/question/#{@question.id}"
end

