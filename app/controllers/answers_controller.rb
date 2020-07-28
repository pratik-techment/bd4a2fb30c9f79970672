class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(text_value: answer_params[:text_value], user_id: current_user.id, question_id: @question.id)
    redirect_to question_path(@question)
   end

  private

  def answer_params
    params.require(:answer).permit(:text_value)
  end
end
