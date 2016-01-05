get '/answers/new' do
	@user = User.find(session[:user_id])
	@question = Question.find_by(id: @user.id)
	erb :"answers/new"
end

get '/answers/:answer_id' do
	@user = User.find_by_id(session[:user_id])
	@answers = Answer.find_by(id: params[:answer_id])
	erb :"/answers/show"
end

post '/answers' do
end

post '/question/:question_id/answers' do
	@user = User.find(session[:user_id])
	@question = Question.find_by(id: params[:question_id])
	erb :"answers/new"
end

post '/question/:question_id/answers/new' do
	@question = Question.find_by(id: params[:question_id])
	@user = User.find_by(id: session[:user_id])
	@answer = Answer.new(ans: params[:answer][:ans], question_id: params[:question_id], user_id: session[:user_id] )
	
	if @answer.save
		erb :"answers/showqa"
	else
		redirect "/answers/new"
	end
end


post '/question/:question_id/answers' do
	redirect "answers/new"
end

get '/my_answers' do
	@user = User.find_by_id(session[:user_id])
	@my_answers = @user.answers
	erb :"answers/my_answers"
end