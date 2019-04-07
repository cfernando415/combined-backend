class ApplicationController < ActionController::API
    before_action :authorized
    def issue_token(payload)
        JWT.encode(payload, '$ec123t')
    end 

    def auth_header
        request.headers['Authorization']
    end 

    def decoded_token
        if auth_header
            token = auth_header
            begin 
            JWT.decode(token, '$ec123t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
            nil 
            end 
        end 
    end 

    def current_user
        # byebug 
        if decoded_token
            if decoded_token[0].keys[0] == "email"
                email = decoded_token[0]
                @member = Member.find_by(email: email["email"])
            else
                full_name = decoded_token[0]['full_name']
                @user = User.find_by(full_name: full_name)
            end
        else
            nil
        end
    end 

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
