class TodoItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @todo_items = @todo_list.todo_items.create(todo_list_params)
    redirect_to @todo_list
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Todo item deleted successfully."
    else
      flash[:error] = "Todo list item could not be deleted."
    end
    redirect_to @todo_list
  end

  private
    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_list_params
      params[:todo_item].permit(:content)
    end
    
end
