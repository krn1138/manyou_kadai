class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  PER = 10

  def index
    # binding.irb
    # @tasks = Task.all
    # @tasks = @tasks.with_title(params[:title])
    # @tasks = @tasks.with_choice(params[:status]) if params[:status].present?

    if params[:title].present? && params[:status].present?
      @tasks = Task.with_title(params[:title]).with_choice(params[:status])
    elsif params[:title].present?
      @tasks = Task.with_title(params[:title])
    elsif params[:status].present?
      @tasks = Task.with_choice(params[:status])
    else 
      # binding.pry
      @tasks = Task.all
    end
    # @tasks = Task.all.with_choices(params[:choices])
    # @tasks = @tasks.where(status: params[:status]) if params[:status].present?
    # binding.irb
    @tasks = Task.all.order(limit: "DESC") if params[:sort_expired] == "true"
    @tasks = Task.all.order(choice: "ASC") if params[:sort_choice] == "true"
    # binding.irb
    # @tasks_page = @tasks.page(params[:page]).per(PER)
    Post.all.page(params[:page]).per(10)

    # elsif 
    #   @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    # binding.irb
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
      params.require(:task).permit(:name, :note, :limit, :status, :choice)
    end
end
