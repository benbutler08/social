class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_form_collections, only: [:new, :edit]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
      if @task.save
        flash[:success] = 'Task was successfully created.'
        redirect_to tasks_url 
      else
        render :new 
      end
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated.'
      redirect_to tasks_url 
    else
      render :edit 
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task was successfully destroyed.'
    redirect_to tasks_url 
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_form_collections
      @status = [['active'],['staging'],['complete']]
      @assignments = Assignment.all.map { |assignment| [assignment.name, assignment.id] } 
    end

    def task_params
      params.require(:task).permit(:title, :description, :status, :assignment_id)
    end
end
