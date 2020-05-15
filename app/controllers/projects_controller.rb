class ProjectsController  <ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def update
    ContestantProject.create(
      contestant_id: params["Contestant ID:"],
      project_id: params[:id])
    redirect_to "/projects/#{params[:id]}"
  end

end
