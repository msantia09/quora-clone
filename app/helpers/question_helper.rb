module QuestionHelper

	def find_question
		Question.find_by(id: params[:id])
	end

end