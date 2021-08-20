class PostsController < ApplicationController
    before_action :require_logged_in, only: [:new, :create, :destroy]

    def new
        @post = Post.new
        @sub = Sub.find_by(id: params[:sub_id])
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        @post.sub_id = params[:sub_id]
        if @post.save
            redirect_to sub_post_url(params[:sub_id], @post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show   
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end

end
