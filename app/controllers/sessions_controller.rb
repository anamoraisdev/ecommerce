class SessionsController < ActionController::API
    include Devise::Controllers::SignInOut
    def destroy
        sign_out(current_user)
        render json: { message: 'Signed out successfully.' }
    end

end
