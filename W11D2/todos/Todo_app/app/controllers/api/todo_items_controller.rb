class Api::TodoItemsController < ApplicationController

    def show
        render json: TodoItem.find_by(id: params[:id])
    end
      
    def create
        @todo = TodoItem.new(todo_item_params)
        if @todo.save
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    def index 
        render json: TodoItem.all
    end 

    def update 
        @todo = TodoItem.find_by(id: params[:id])
        if @todo && @todo.update(todo_item_params)
            render json: @todo
        else
            render json: @todo.errors.full_messages, status: 422
        end 
    end 

    def destroy 
        @todo = TodoItem.find_by(id: params[:id])
        if @todo
            @todo.destroy
            render json: @todo
        else
            render json: {error: "No todo item with that ID."}, status: 404
        end
    end 

    private 

    def todo_item_params
        params.require(:todo_item).permit(:title, :body, :done)
    end 

end
