class SecureController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login
    layout "afterLogin"

    private 

    def require_login
        if current_user.nil?
        redirect_to '/users/sign_in'
        end
    end
end
