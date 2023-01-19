class PersonalityTestsController < ApplicationController
  before_action :find_user

  def index
    questions = Question.includes(:answers).select(:id, :content, :score)
    questions_and_answers = []
    questions.each do |question|
      questions_and_answers << {
        id: question.id,
        content: question.content,
        answers: question.answers
      }
    end
    answered = current_user.answers.pluck_ids
    render json: { questions_and_answers:, answered: }
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
    answer = UserAnswer.new
    ActiveRecord::Base.transaction do
      old_answer = UserAnswer.old_answer(current_user.id, params[:old_answer_id]) # handle old useranswer not existing
      raise ActiveRecord::RecordNotFound unless old_answer

      old_answer.destroy
      answer = create_user_answer(params[:new_answer_id])
    end
    render json: { answer: } and return
  end

  def calculate_result
    score = current_user.answers.sum(:score)
    result = Result.calculate(score)
    user_result = UserResult.new(user_id: current_user.id, result_id: result.id)
    return result if user_result.save!
  end

  def all_questions_answered?
    current_user.answers.count >= Question.count
  end

  def create_user_answer(answer_id = params[:answer_id])
    UserAnswer.create!(user_id: current_user.id, answer_id:)
  end

  def find_user
    raise ApiException::Unauthorized unless current_user
  end
end
