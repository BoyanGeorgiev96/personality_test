class PersonalityTestsController < ApplicationController
  before_action :login

  def index
    questions = Question.all.map do |question|
      {
        id: question.id,
        content: question.content,
        answers: question.answers.select_attributes_for_questions
      }
    end
    answered = current_user.answers.pluck_ids
    render json: { questions:, answered: }
  end

  def create
    answer = create_user_answer # handle edge case where user has already answered all questions, so don't create user answer
    render json: { answer: } and return unless all_questions_answered? # maybe render json instead of return?

    result = calculate_result
    render json: {
      name: result.name,
      content: result.content
    }
  end

  def update
    ActiveRecord::Base.transaction do
      UserAnswer.destroy_old_answer(current_user.id, params[:old_answer_id]) # handle old useranswer not existing
      answer = create_user_answer(params[:new_answer_id])
      render json: { answer: } and return
    end

    # raise some error and errorhandler it instead of rendering here.
    render json: {}
  end

  def calculate_result
    score = current_user.answers.sum(:score)
    result = Result.calculate(score)
    user_result = UserResult.new(user_id: current_user.id, result_id: result.id)
    return result if user_result.save

    # maybe raise some error? and errorhandler it
    render json: {}
  end

  def all_questions_answered?
    current_user.answers.count >= Question.count
  end

  def create_user_answer(answer_id = params[:answer_id])
    user_answer = UserAnswer.new(user_id: current_user.id, answer_id:)
    return user_answer if user_answer.save

    # maybe raise some error? and errorhandler it instead of rendering here.
    render json: {}
  end

  def login
    # just raise an error as it is surely an unauthorized access
    redirect_to login_path unless current_user
  end
end
