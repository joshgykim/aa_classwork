class Api::TodosController < ApplicationController

    def show
        render json: TodoItem.find(params[:id])
    end
      
    def create
        @todo = TodoItem.new(todo_params)
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

        if @todo && @todo.update(todo_params)
            
        end 
    end 

    def destroy 

    end 

    private 

    def todo_params
        params.require(:TodoItem).permit(:title, :body, :done)
    end 

end
