class TasksController < ApplicationController
    
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
        @task = Task.find(params[:id])
    end

    def show
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            flash[:success] = "登録完了！！"
            redirect_to @task
        else
            flash.now[:danger] = "登録できませんでした"
            render :new
        end
    end

    def destroy
        @message = Task.find(params[:id])
        @message.destroy
        
        flash[:success] = "削除完了！！"
        redirect_to tasks_url
    end



    private
    
    def task_params
        params.require(:task).permit(:content)
    end

end
