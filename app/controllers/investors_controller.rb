class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy, :saldo]
  before_action :authenticate_user!

  # GET /investors
  # GET /investors.json
  def index
    authorize Investor
    @investors = Investor.search(params[:search])
  end

  # GET /investors/1
  # GET /investors/1.json
  def show
    @investor = Investor.find(params[:id])
    authorize @investor
  end

  # GET /investors/new
  def new
    authorize Investor
    @investor = Investor.new
  end
  
  def new_by_user
    #authorize Investor
    #@investor = Investor.new
    #@investor.user_id = @user.id
    user = User.find params[:user_id]
    @investor=user.investors.build(:user_id=>user.id)
  end
  

  # GET /investors/1/edit
  def edit
    authorize Investor
  end

  # POST /investors
  # POST /investors.json
  def create
    authorize Investor
    @investor = Investor.new(investor_params)

    respond_to do |format|
      if @investor.save
        format.html { redirect_to @investor, notice: 'Investor was successfully created.' }
        format.json { render :show, status: :created, location: @investor }
      else
        format.html { render :new }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investors/1
  # PATCH/PUT /investors/1.json
  def update
    @investor = Investor.find(params[:id])
    authorize @investor
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to @investor, notice: 'Investor was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investors/1
  # DELETE /investors/1.json
 
  def destroy
    @investor = Investor.find(params[:id])
    authorize @investor
    @investor.destroy
    respond_to do |format|
      format.html { redirect_to investors_url, notice: 'Investor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    authorize Investor
    @investors = Investor.search(params[:search])
  end
  
  def saldo
    authorize Investor
    saldo_investor = 0  
    @account_movements=AccountMovement.where("investor_id=" + investor.id)
    @account_movements.each do |account_movement|
      saldo_investor = saldo_investor + account_movement.value
    end
    saldo_investor
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor
      @investor = Investor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investor_params
      params.require(:investor).permit( :full_name, :address, :zip_code, :town, :country, :NIF, :fiscal_number,:user_id)
    end
end
