class SubsController < ApplicationController

  before_action :require_logged_in, only: [:edit]

  def index
    @subs = Sub.all
    render :index
  end

  def show
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    if current_user == @sub.moderator
      render :edit
    else
      flash.now[:errors] = ['You are not permitted to edit.']
      render :show
    end
  end

  def update
  end

  def new
  end

  def create
  end

end
