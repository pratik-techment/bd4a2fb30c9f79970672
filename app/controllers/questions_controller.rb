class QuestionsController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:show]

  def index
    @questions = current_user.questions
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    if user_signed_in?
      @is_current_user = current_user?(@user)
    end
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

  def current_user?(user)
    user == current_user
  end
end
