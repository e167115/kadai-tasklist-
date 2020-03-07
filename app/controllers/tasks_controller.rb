class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :show, :update, :destroy]
    def index
        @tasks = Task.all
    end

    def create
        @task = Task.new(task_params)
        if @task.save 
            flash[:success] = "登録完了！！"
            redirect_to @task
        else
            flash.now[:danger] = "登録できませんでした"
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
        redirect_to tasks_url
    end



    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content)
    end

end
