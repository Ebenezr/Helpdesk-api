class ApplicationController < ActionController::API
    
     rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def not_found
        render json: {error: 'not_found'}
    end
    
    def authorize_request
        header = request.headers['Authorization']
        header = header.split('').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
            
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: {errors: e.message}, status: :unauthorized
        end
          
    end

     private

     def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
     end
end

    

