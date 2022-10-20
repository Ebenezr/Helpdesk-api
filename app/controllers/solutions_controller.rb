class SolutionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   

    def index
        solutions = solution.all
        render json: solutions 
    end

    def show 
        recipe = find_solution
        render json: solution
    end

    def create 
        solution = solution.create!(solution_params)
        render json: solution
    end

    def update
        solution = find_solution
        solution.update!(solution_params)
        render json: solution
    end

    def destroy
        solution = solution.find_by( params[:id])
        solution.destroy
        head :no_content
    end

    private 

    def find_solution
        solution.find(params[:id])
    end

    def solution_params
        params.permit(:description, :votes, :user_id, :question_id)
    end

    def render_not_found_response
        render json: {error: "solution not found"}, status: :not_found
    end

end
