class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  # before_action :login_not_new
  # before_action :admin_user


  PER = 10

  def index

    tasks = current_user.tasks
    # binding.irb
    # @tasks = Task.all
    # @tasks = @tasks.with_title(params[:title])
    # @tasks = @tasks.with_choice(params[:status]) if params[:status].present?

    if params[:name].present? && params[:status].present?
      @tasks = tasks.with_title(params[:name]).with_choice(params[:status])
    elsif params[:name].present?
      @tasks = tasks.with_title(params[:name])
    elsif params[:status].present?
      @tasks = tasks.with_choice(params[:status])
    else 
      # binding.pry
      # @tasks = Task.all
      @tasks = tasks
    end
    # @tasks = Task.all.with_choices(params[:choices])
    # @tasks = @tasks.where(status: params[:status]) if params[:status].present?
    # binding.irb
    @tasks = tasks.order(limit: "DESC") if params[:sort_expired] == "true"
    @tasks = tasks.order(choice: "ASC") if params[:sort_choice] == "true"
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?

    # binding.irb
    @tasks = @tasks.page(params[:page]).per(PER)

    # elsif 
    #   @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    # binding.irb
    # @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
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

  # def confirm
  #   @blog = current_user.blogs.build(blog_params)
  #   render :new if @blog.invalid?
  # end

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
      params.require(:task).permit(:name, :note, :limit, :status, :choice, :title, :details, label_ids: [])
    end
end
