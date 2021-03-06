class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :get_entrepreneur, only: [ :new, :new_by_entrepreneur, :create, :update, :show, :edit]
 


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.joins(:entrepreneur).order("full_name")
    authorize Project
  end
  
  def index_investor
    #@projects = Project.all
    @projects = Project.where( status: Project.statuses[:subscription])
    authorize Project
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project= Project.find(params[:id])
    authorize @project
  end

  # GET /projects/new
  def new
    authorize Project
    @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])
    @project = @entrepreneur.projects.build
    
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
    
    #@project = Project.new
  end
  
  def new_by_entrepreneur
    byebug
    authorize Project
    @project = Project.new
    @project.entrepreneur_id = params[:entrepreneur_id]
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @entrepreneur = @project.entrepreneur
    authorize @project
  end

  # POST /projects
  # POST /projects.json
  def create
    authorize Project
    #@project = Project.new(project_params)
    @project = @entrepreneur.projects.build(project_params)
    @project.status = :pending
    #calcula prestação
    #PV/[(1-(1/(1 + i)n ))/i]
    taxa_mensal= @project.interest_rate/12
    @project.installment = @project.value/((1-(1/(1+taxa_mensal)**@project.duration))/taxa_mensal)
    @project.end_date = @project.start_date + (@project.duration).months
    @project.open_balance=@project.value
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
    @project = Project.find(params[:id])
    #@project = @entrepreneur.projects.find(params[:id])
    taxa_mensal= @project.interest_rate/12
    @project.installment = @project.value/((1-(1/(1+taxa_mensal)**@project.duration))/taxa_mensal)
    @project.end_date = @project.start_date + (@project.duration).months
    #@project = @entrepreneur.projects.build(project_params)
    authorize @project
    @project.open_balance=@project.value
    if @project.status = :open
      deals = @project.deals
      deals.each do |deal|
        deal.status = :open
      end
    end
    respond_to do |format|
      if @project.update(project_params)
        #format.html { redirect_to entrepreneur_projects_url(@entrepreneur), notice: 'Project was successfully updated.' }
        root_path
        format.html { redirect_to edit_project_path(@project), notice: 'Project was successfully updated.' }
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
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
    
    def get_entrepreneur
      if current_user.entrepreneur? then
        @entrepreneur = Entrepreneur.find_by_user_id(current_user.id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      #params.require(:project).permit(:commit, :value, :description, :start_date, :duration, :entrepreneur_id, :status, :entrepreneur_attributes =>[:id,:full_name, :address] )
      params.require(:project).permit(:commit, :value, :description, :start_date, :duration, :entrepreneur_id, :status, :interest_rate, :end_date, :user_id )
    end
end
