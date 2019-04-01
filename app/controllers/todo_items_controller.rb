class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_items = @todo_list.todo_items.create(todo_list_params)
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo item deleted successfully."
    else
      flash[:error] = "Todo list item could not be deleted."
    end
    redirect_to @todo_list
  end

  def completed
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Todo item completed."
  end

  private
    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_list_params
      params[:todo_item].permit(:content)
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end
    
end
