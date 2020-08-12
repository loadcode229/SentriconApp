class ApplicationController < ActionController::Base
    protect_from_forgery with: exception
    before_action :verify_user_is_authenticated
    helper method :current_user

    private

    def verify_user_is_authenticated
        redirect_to '/' unless user_authenticated
        #unless user_authenticated
        #   redirect_to '/'
        #end
    end

    def user_authenticated
        !!current_user
    end

    def current_user
        User.find_by(id:session[:user_id])
    end
end
