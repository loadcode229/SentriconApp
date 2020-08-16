class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user] = @user
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        if current_user
            @user = User.new
        else
            redirect_to sign_in_path
        end
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
