class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.all
    @tasks = @tasks.with_title(params[:title])
    # @tasks = Task.all.with_choices(params[:choices])
    @tasks = Task.where(status: params[:status])

    if params[:sort_expired] == "true"
      @tasks = Task.all.order(id: "DESC")
    elsif 
      @tasks = Task.all
    end

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
    if @task.save
      redirect_to tasks_path, notice: "Taskを作成しました！"
    else
      render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Taskを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"Taskを削除しました！"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :note, :limit, :status)
    end
end
