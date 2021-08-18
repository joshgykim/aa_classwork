class SessionsController < ApplicationController
    
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login(@user)
            redirect_to users_url
        else
            flash.now[:errors] = ["Invalid credentials."]
            render :new
        end
    end

    def destroy
        logout!
        redirect_to users_url
    end

end