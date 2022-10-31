class ApplicationController < ActionController::API

    
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def not_found
        render json: {error: 'not_found'}
    end
    
    # Application controller
    def encode_token(payload)
        JWT.encode(payload, 'secret')
     end

     def decode_token
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret',  true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
     end

     def authorized_user
        decode_token = decode_token()
        if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by_id(user_id)
        end
         
     end

     def authorize
        render json: {message: 'You have to log in first'}, status: :unauthorized unless
        authorized_user
     end


    private

     def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
     end

end

    

