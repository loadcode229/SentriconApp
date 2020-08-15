class SessionsController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:new, :create]

    def new
    end

    def create
        flash[:notice] = "Username, email, or password is incorrect."
        if authenticates
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.username = authenticates['info']['username']
                u.email = authenticates['info']['email'].lowercase_email
            end
        else
            @user = User.find_by(username: params[:user][:username], email: params[:user][:email])
            @user = @user.try(:authenticate, params[:user][:password])
            return redirect_to login_path unless @user
        end

        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def destroy
        session.delete("user_id")
        redirect_to '/'
    end

    private

    def authenticates
        request.env['omniauth.auth']
    end
end