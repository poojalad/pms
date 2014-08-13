
class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  
  layout 'style'
  
  before_filter :find_project
  
  def index
    
    @tasks = @project.tasks
		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
 
    @task = @project.tasks.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new(:project_id => params[:id])
		@projects = Project.sorted
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end
  
   # POST /tasks
  # POST /tasks.json
  def create
 
    @task = @project.tasks.new(params[:task])

      if @task.save
        redirect_to(project_tasks_path(@project))
        flash[:notice] = 'Task was successfully created.' 
      else
      	
        render('new')
      end
  end

  # GET /tasks/1/edit
  def edit
  	
    @task = @project.tasks.find(params[:id])

  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
  	@task = @project.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to(project_tasks_path(@project))
      flash[:notice] = 'Task was successfully updated.'
    else
      render('edit')
    end
  end 
  
  
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(project_tasks_path(@project)) }
      format.json { head :no_content }
    end
  end
  
  def search
  	@tasks = @project.tasks.by_name(params[:name])
  	respond_to do |format|
      format.html 
      format.json { render json: @project }
    end
  end
  
  def result
  	@project = Project.find_by_id(params[:id])
  	@task = Task.find_by_name(params[:task]["name"])
  	redirect_to(show_task_path(@task, @project))
  end
  
  
  private
  
  def find_project
    @project = Project.find(params[:project_id])
  end
  
end
