class InterestsController < ApplicationController
  def create
    debugger
    question = Question.find(params[:question_id])
    topic = Topic.find(params[:topic_id])
    if topic.present?
      current_user.interests << topic
    end

    respond_to do |format|
      format.html { redirect_to question_path(question) }
      format.js
    end
  end
end
