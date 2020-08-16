class Users::SessionsController < Devise::SessionsController
    def new
        super
    end

    def create
        super
    end

    def destroy
        super
    end

    protected

    def configure_sign_in_params
        devise_paramater_sanitizer.permit(:sign_in, keys: [:attribute])
    end
end