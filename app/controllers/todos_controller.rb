class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      redirect_back
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
