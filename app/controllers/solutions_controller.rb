class SolutionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :find_solution, except: [:create, :index]
    before_action :authorize, except: [:index]

    def index
        solutions = Solution.all
        render json: solutions, status: :ok 
    end

      #return loged in user's solutions
    def mysolutions
        solutions = Solution.where("user_id = ?",  params[:id])
        render json: solutions
    end

    def show 
        render json: @solution, status: :ok
    end

    def create 
        @solution = Solution.create!(solution_params)
        # @notification = SolutionNotification.create!(notify_params) 
        render json: @solution.question, status: :created
    end

    def update
        @solution.update!(solution_params)
        render json: @solution.question, status: :accepted
    end

    def destroy
        @solution.destroy
        head :no_content
    end

   

    private 

    def find_solution
        @solution = Solution.find(params[:id])
    end

    def solution_params
        params.permit(:description, :votes, :question_id, :user_id)
    end

    def notify_params
        params.permit(:question_id, :user_id)
    end

    def render_not_found_response
        render json: {error: "Solution not found"}, status: :not_found
    end

end
