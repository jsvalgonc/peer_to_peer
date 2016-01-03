class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :get_entrepreneur

  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.all
    @projects = @entrepreneur.projects
  end
  
  def index_investor
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project= @entrepreneur.projects.find(params[:id])
  end

  # GET /projects/new
  def new
    @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])
    @project = @entrepreneur.projects.build
    
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
    
    #@project = Project.new
  end
  
  def new_by_entrepreneur
    @project = Project.new
    @project.entrepreneur_id = params[:entrepreneur_id]
  end

  # GET /projects/1/edit
  def edit
    @project = @entrepreneur.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    #@project = Project.new(project_params)
    @project = @entrepreneur.projects.build(project_params)
    respond_to do |format|
      if @project.save
        #format.html { redirect_to @project, notice: 'Projecto Registado com Sucesso.' }
        format.html { redirect_to entrepreneur_projects_url(@entrepreneur), notice: 'Projecto Registado com Sucesso.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = @entrepreneur.projects.build(params[:project])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to entrepreneur_project_url(@entrepreneur), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = @entrepreneur.projects.build(params[:project])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to entrepreneur_project_url(@entrepreneur), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
    
    def get_entrepreneur
      @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      #params.require(:project).permit(:commit, :value, :description, :start_date, :duration, :entrepreneur_id, :status, :entrepreneur_attributes =>[:id,:full_name, :address] )
      params.require(:project).permit(:commit, :value, :description, :start_date, :duration, :entrepreneur_id, :status )
    end
end
