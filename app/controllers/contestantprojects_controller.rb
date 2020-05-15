class ContestantprojectsController < ApplicationController

  def new
    ContestantProject.create(
      contestant_id: params["Contestant ID:"],
      project_id: params[:project_id])
    redirect_to "/projects/#{params[:project_id]}"
  end
end
