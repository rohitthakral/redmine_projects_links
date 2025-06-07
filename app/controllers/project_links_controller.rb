class ProjectLinksController < ApplicationController
  before_action :find_project
  before_action :find_link, only: [:edit, :update, :destroy]
  before_action :authorize

  def index
    @project_links = @project.project_links.order(created_at: :desc)
  end

  def new
    @project_link = @project.project_links.build
  end

  def create
    @project_link = @project.project_links.build(project_link_params)
    @project_link.author = User.current
    if @project_link.save
      redirect_to project_project_links_path(@project), notice: l(:notice_link_created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project_link.update(project_link_params)
      redirect_to project_project_links_path(@project), notice: l(:notice_link_updated)
    else
      render :edit
    end
  end

  def destroy
    @project_link.destroy
    redirect_to project_project_links_path(@project), notice: l(:notice_link_deleted)
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_link
    @project_link = @project.project_links.find(params[:id])
  end

  def project_link_params
    params.require(:project_link).permit(:title, :url)
  end
end