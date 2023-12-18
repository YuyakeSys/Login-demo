class ProjectsController < ApplicationController
  def index
    if params[:label].present?
    @projects = Project.where("labels LIKE ?", "%#{params[:label]}%")
    else
    @projects = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project created successfully.'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :labels)
  end
end
