class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    topic = Topic.where(text_value: params[:topic]).first
    @question = Question.new(text_value: question_params[:text_value], topic_id: topic.id, user_id: current_user.id)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:text_value, :topic)
  end
end
