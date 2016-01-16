class EntrepreneursController < ApplicationController
  before_action :set_entrepreneur, only: [:show, :edit, :update, :destroy, :main]
  #before_action :authenticate_user!
  respond_to :js, :html
  # GET /entrepreneurs
  # GET /entrepreneurs.json
  def index
    @entrepreneurs = Entrepreneur.all
    authorize Entrepreneur
  end

  # GET /entrepreneurs/1
  # GET /entrepreneurs/1.json
  def show
    @entrepreneur = Entrepreneur.find(params[:id])
    authorize @entrepreneur
  end
  
  def main
    @entrepreneur = Entrepreneur.find(params[:id])
    authorize @entrepreneur
    @projects_pending = Project.where("entrepreneur_id=" + params[:id].to_s + " and status=0")
    @projects_subscription = Project.where("entrepreneur_id=" + params[:id].to_s + " and status=1")
    @projects_open = Project.where("entrepreneur_id=" + params[:id].to_s + " and status=2")
    @projects_closed = Project.where("entrepreneur_id=" + params[:id].to_s + " and status=3")
  end

  # GET /entrepreneurs/new
  def new
    authorize Entrepreneur
    @entrepreneur = Entrepreneur.new
  end
  
  
  def new_by_user
    user = User.find params[:user_id]
    @entrepreneur=user.entrepreneurs.build(:user_id=>user.id)
  end
  

  # GET /entrepreneurs/1/edit
  def edit
    authorize @entrepreneur
  end

  # POST /entrepreneurs
  # POST /entrepreneurs.json
  def create
    authorize Entrepreneur
    @entrepreneur = Entrepreneur.new(entrepreneur_params)

    respond_to do |format|
      if @entrepreneur.save
        format.html { redirect_to @entrepreneur, notice: 'Entrepreneur was successfully created.' }
        format.json { render :show, status: :created, location: @entrepreneur }
      else
        format.html { render :new }
        format.json { render json: @entrepreneur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrepreneurs/1
  # PATCH/PUT /entrepreneurs/1.json
  def update
    @entrepreneur = Entrepreneur.find(params[:id])
    authorize @entrepreneur
    respond_to do |format|
      if @entrepreneur.update(entrepreneur_params)
        format.html { redirect_to @entrepreneur, notice: 'Entrepreneur was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrepreneur }
      else
        format.html { render :edit }
        format.json { render json: @entrepreneur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrepreneurs/1
  # DELETE /entrepreneurs/1.json
  def destroy
    @entrepreneur = Entrepreneur.find(params[:id])
    authorize @entrepreneur
    @entrepreneur.destroy
    respond_to do |format|
      format.html { redirect_to entrepreneurs_url, notice: 'Entrepreneur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def new_project
    @entrepreneur = Entrepreneur.find(params[:id])
    @project = @entrepreneur.projects.build
    respond_with(@project)
  end


  def create_project
  #@entrepreneur = Entrepreneur.find(params[:id])
  @entrepreneur = Entrepreneur.new(entrepreneur_params)
  #@project = @entrepreneur.projects.build(params[:project])
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new_project}
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrepreneur
      @entrepreneur = Entrepreneur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrepreneur_params
      params.require(:entrepreneur).permit(:commit, :full_name, :address, :zip_code, :town, :country, :fiscal_number, :user_id,
      :projects_attributes => [:id, :value, :description, :start_date, :duration, :entrepreneur_id, :status])
    end
    
end
