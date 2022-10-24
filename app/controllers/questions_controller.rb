class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_question, only: %i[ show update destroy ]

    # GET /questions
    #GET/questions?page=page no.
    def index
      @questions = Question.paginate(page: params[:page], per_page: 2)
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

end

