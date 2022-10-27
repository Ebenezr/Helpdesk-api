class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show update destroy ]
  before_action :authorize

  #return loged in user's bookmarks
  def mybookmarks
      bookmarks = Bookmark.where("user_id = ?", @user.id)
      render json: bookmarks
  end

  # GET /bookmarks
  def index
    @bookmarks = Bookmark.all
    render json: @bookmarks
  end

  # GET /bookmarks/1
  def show
    render json: @bookmark
  end

  # POST /bookmarks
  def create
    @bookmark= Bookmark.create!(bookmark_params.merge(user: @user))
    render json: @bookmark, status: :created
  end

  # PATCH/PUT /bookmarks/1
  def update
    @bookmark.update!(bookmark_params)
    render json: @bookmark
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:question_id)
    end
end
