class  ProjectsController < ApplicationController
  def index
  end

  def new
  end

  def create
    # @project = Project.new(project_params)
    # if @project.save
    #   redirect_to projects_path
    # else
    #   render :new
    # end
  end

  # private

  # def project_params
  #   params.require(:project).permit(:name, :description, :labels)
  # end
end
