class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :edit]

  def index
    @projects = Project.all.order("created_at desc")
  end

  def show 
  end

  def new 
    @project = Project.new
  end

  def create 
    @project = Project.new project_params
    
    if @project.save 
      redirect_to @project, notice: "Hey Caleb! The project was succesfully created"
    else
      render 'new'
    end
  end

  
  private 


  def find_project 
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end

end
