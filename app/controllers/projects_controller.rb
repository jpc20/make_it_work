class ProjectsController  <ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    ContestantProject.create(
      contestant_id: params["Contestant ID:"],
      project_id: project.id)
    redirect_to "/projects/#{project.id}"
  end

end
