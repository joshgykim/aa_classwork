class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credential(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:error] = ["Wrong credentials"]
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end