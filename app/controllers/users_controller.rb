class UsersController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:index, :new, :create]

    def index
        if session[:user_id]
            user = User.find(session[:user_id])
            redirect_to user_path(user)
        else
            render 'index'
        end
    end

    def new
        @user = User.new
    end

    def create
        if (user = User.create user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        account_id_arr = AccountsUser.all.collect do |a_u|
            if a_u.user_id == @user.id
                a_u.account_id
            end
        end.compact
        @accounts = Account.find(account_id_arr)
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
