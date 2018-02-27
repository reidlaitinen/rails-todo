class TodosController < ApplicationController
  #GET /todos
  def index
    @todos = Todo.all.order(:priority)
  end

  #GET /todos/:id
  def show
    @todo = Todo.find(params[:id])
  end

  #GET /todos/new
  def new
    @todo = Todo.new
  end

  #GET /todos/completed
  def completed
    @todos = Todo.where(completed: true)
  end

  #GET /todos/:id/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  #PUT/PATCH /todos/:id
  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  #POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todo_path(@todo)
    else
      render :new
    end
  end

  #DELETE /todos/:id
  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :description, :completed, :priority)
    end
end