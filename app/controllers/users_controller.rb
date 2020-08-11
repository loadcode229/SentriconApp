class UsersController < ApplicationController

    def index

    end

    def create

    end

    def show

    end

    private

    def user_params
        params.require(:user).permit(
            :username,
            :email,
            :password,
            :password_confirmation
        )
    end
end
