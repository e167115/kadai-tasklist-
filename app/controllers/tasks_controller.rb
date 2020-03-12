class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :show, :update, :destroy]
    before_action :require_user_logged_in
    before_action :correct_user, only: [:destroy, :edit, :show, :update]
    def index
        if logged_in?
            @task = current_user.tasks.build
            @tasks = current_user.tasks.order(id: :desc).page(params[:page])
        end
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save 
            flash[:success] = "追加完了"
            redirect_to tasks_path
        else
            flash.now[:danger] = "追加できませんでした"
            render :new
        end
    end

    def new
        @task = Task.new
    end

    def edit
    end

    def show
    end

    def update
        if @task.update(task_params)
            flash[:success] = "登録完了！！"
            redirect_to @task
        else
            flash.now[:danger] = "登録できませんでした"
            render :new
        end
    end

    def destroy
        @task.destroy
        
        flash[:success] = "削除完了！！"
        redirect_to tasks_path
    end



    private
    
    def set_task
        @task = Task.find(params[:id])
        
    end
        
    def task_params
        params.require(:task).permit(:content, :status)
    end

    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to tasks_path
      end
    end        



end
