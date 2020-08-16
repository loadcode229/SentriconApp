class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_id
        if current_user
            current_user['id']
        else
            nil
        end
    end

    helper_method :current_user, :logged_in?, :user_id
end
