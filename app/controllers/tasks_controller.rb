class TasksController < ApplicationController

  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to todo_path(@task.todo_id)
    else
      redirect_to root_path
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to todo_path(@task.todo_id)
    else
      redirect_to root_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to todo_path(@task.todo_id), notice: 'Tarefa excluída.'
    else
      redirect_to todo_path(@task.todo_id), alert: 'Tarefa não pôde ser excluída.'
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :done, :todo_id)
  end
end
