class QuestionsTagsController < ApplicationController
  before_action :set_questions_tag, only: %i[ show update destroy ]

  # GET /questions_tags
  def index
    @questions_tags = QuestionsTag.all

    render json: @questions_tags
  end

  # GET /questions_tags/1
  def show
    render json: @questions_tag
  end

  # POST /questions_tags
  def create
    @questions_tag = QuestionsTag.new(questions_tag_params)

    if @questions_tag.save
      render json: @questions_tag, status: :created, location: @questions_tag
    else
      render json: @questions_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions_tags/1
  def update
    if @questions_tag.update(questions_tag_params)
      render json: @questions_tag
    else
      render json: @questions_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions_tags/1
  def destroy
    @questions_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questions_tag
      @questions_tag = QuestionsTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questions_tag_params
      params.require(:questions_tag).permit(:question_id, :tag_id)
    end
end
