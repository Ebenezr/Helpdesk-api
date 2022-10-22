class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  before_action :set_question, only: %i[ show update destroy ]

    # GET /questions
    def index
      @questions = Question.all

      render json: @questions
    end

    # GET /questions/1
    def show
      render json: @question
    end

    # POST /questions
    def create
      @question = Question.new(question_params)

      if @question.save
        render json: @question, status: :created, location: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /questions/1
    def update
      if @question.update(question_params)
        render json: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end

    # DELETE /questions/1
    def destroy
      @question.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = Question.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def question_params
        params.require(:question).permit(:user_id, :title, :description, :votes)
      end

      def render_not_found_response
        render json: { error: "Question not found" }, status: :not_found
      end

      def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
      end
end



  #   # GET /questions
  #   def index
  #     questions = Question.all
  #     render json: questions
  #   end

  #   # SHOW /questions/:id
  #   def show
  #     question = Question.find(params[:id])
  #     render json: question
  #   end

  #   # POST /questions
  #   def create
  #       question = Question.create(question_params)
  #       render json: question, status: :created
  #   end

  #   # PATCH /questions/:id
  #   def update
  #       question = Question.find_by(id: params[:id])
  #       question.update(question_params)
  #       render json: question
  #   end

  #   # DELETE /questions/:id
  #   def destroy
  #       question = Question.find_by(id: params[:id])
  #       question.destroy
  #       render json: {message: "Question successfully deleted"}
  #   end

  #   private

  #   def question_params
  #       params.permit(:name, :image, :description)
  #   end

  #   private


  # def question_params
  #   params.permit(:title, :description, :user_id, :votes)
  # end

  # def render_not_found_response
  #   render json: { error: "Question not found" }, status: :not_found
  # end

  # def render_unprocessable_entity_response(invalid)
  #   render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  # end

