class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_question, only: %i[ show update destroy ]
  before_action :authorize,except: [:index]

    # GET /questions
    #GET/questions?page=page no.
    def index
      @questions = Question.paginate(page: params[:page], per_page: 3)
      total = Question.count
      #return object with total questions and questions array
      render json: {  questions: ActiveModelSerializers::SerializableResource.new(@questions, each_serializer: QuestionSerializer), count:total}
    end

      #return loged in user's questions
      def myquestions
          questions = Question.where("user_id = ?", @user.id)
          render json: questions
      end

    #search for questions
    def search
      @results = Question.paginate(page: params[:page], per_page: 3)
      term = params[:search_term]
      @results = Question.where("lower(title) LIKE ?", "%#{term.downcase}%")
      render json: {questions: ActiveModelSerializers::SerializableResource.new(@results, each_serializer: QuestionSerializer)}, status: :ok
    end


    # GET /questions/1
    def show
      render json: @question
    end

    # POST /questions
    def create
      @question = Question.create!(question_params)
      render json: @question, status: :created, location: @question
      
    end

    # PATCH/PUT /questions/1
    def update
      @question = @question.update!(question_params)
      render json: @question
   
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

