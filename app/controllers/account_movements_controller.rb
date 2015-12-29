class AccountMovementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account_movement, only: [:show, :edit, :update, :destroy, :list_investor]

  # GET /account_movements
  # GET /account_movements.json
  def index
    authorize AccountMovement
    @account_movements = AccountMovement.all
  end

  # GET /account_movements/1
  # GET /account_movements/1.json
  def show
    byebug
    authorize @account_movement
  end

  # GET /account_movements/new
  def new
    authorize AccountMovement
    @account_movement = AccountMovement.new
  end

  def new_id
    @investor = Investor.find(params[:id])
    @account_movement = AccountMovement.new
    @account_movement.investor_id = @investor.id 
  end

  # GET /account_movements/1/edit
  def edit
    authorize @account_movement
  end

  # POST /account_movements
  # POST /account_movements.json
  def create
    authorize AccountMovement
    @account_movement = AccountMovement.new(account_movement_params)
    respond_to do |format|
      if @account_movement.save
        format.html { redirect_to @account_movement, notice: 'Account movement was successfully created.' }
        format.json { render :show, status: :created, location: @account_movement }
      else
        format.html { render :new }
        format.json { render json: @account_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_movements/1
  # PATCH/PUT /account_movements/1.json
  def update
    authorize @account_movement
    respond_to do |format|
      if @account_movement.update(account_movement_params)
        format.html { redirect_to @account_movement, notice: 'Account movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_movement }
      else
        format.html { render :edit }
        format.json { render json: @account_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_movements/1
  # DELETE /account_movements/1.json
  def destroy
    authorize @account_movement
    @account_movement.destroy
    respond_to do |format|
      format.html { redirect_to account_movements_url, notice: 'Account movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def list_investor
    authorize AccountMovement    
    account_movements_todos=policy_scope(AccountMovement)
    @account_movements = account_movements_todos.where("investor_id = ?",params[:id_investor])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_movement
      @account_movement = AccountMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_movement_params
      params.require(:account_movement).permit(:investor_id, :value_date, :movement_date, :value)
    end
end
