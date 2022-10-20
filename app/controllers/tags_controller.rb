class TagsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :find_tag, except: [:create, :index]

    def index
        @tags = Tag.all 
        render json: @tags, status: :ok
    end
    
    def show
        render json: @tag, status: :ok
    end

    def create
        @tag = Tag.create!(tag_params)
        render json: @tag, status: :created
    end
    
    
    def update
        @tag.update!(tag_params)
         render json: @tag, status: :accepted
    end
    
    def destroy
        @tag.destroy
        head :no_content
    end


    private
    def find_tag
        @tag = Tag.find(params[:id])
    end
    
    def tag_params
        params.permit(
         :name
        )
    end
    
    def render_not_found_response
        render json: { error: "Tag not found" }, status: :not_found
    end

end
