class AccountMovementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account_movement, only: [:show, :edit, :update, :destroy]
  before_filter :get_investor

  # GET /account_movements
  # GET /account_movements.json
  def index
    authorize AccountMovement
    #@account_movements = AccountMovement.all
    @account_movements = @investor.account_movements
  end

  # GET /account_movements/1
  # GET /account_movements/1.json
  def show
    @account_movement = @investor.account_movements.find(params[:id])
    authorize @account_movement
  end

  # GET /account_movements/new
  def new
    
    authorize AccountMovement
    @investor = Investor.find(params[:investor_id])
    @account_movement = @investor.account_movements.build
    #@account_movement = AccountMovement.new
    respond_to do |format|
      if @account_movement.save
        format.html { redirect_to account_movements_list_investor_path(@investor), notice: 'Movimento em Conta Registado.' }
        format.json { render :show, status: :created, location: @account_movement }
      else
        format.html { render :new }
        format.json { render json: @account_movement.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /account_movements/1/edit
  def edit
    @account_movement = @investor.account_movements.find(params[:id])
    authorize @account_movement
  end

  # POST /account_movements
  # POST /account_movements.json
  def create
    authorize AccountMovement
    @account_movement = @investor.account_movements.build(account_movement_params)
    #@account_movement = AccountMovement.new(account_movement_params)
    respond_to do |format|
      if @account_movement.save
        format.html { redirect_to account_movements_list_investor_path(@investor), notice: 'Movimento em Conta Registado.' }
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
    @account_movement=@investor.account_movements.find(params[:id_])
    respond_to do |format|
      if @account_movement.update(account_movement_params)
        format.html { redirect_to account_movements_list_investor_path(@investor), notice: 'Account movement was successfully updated.' }
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
    @account_movement=@investor.account_movements.find(params[:id])
    @account_movement.destroy
    respond_to do |format|
      format.html { redirect_to account_movements_url, notice: 'Account movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def list_investor
    authorize AccountMovement    
    account_movements_todos=policy_scope(AccountMovement)
    @account_movements = account_movements_todos.where("investor_id = ?",params[:investor_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_movement
      @account_movement = AccountMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_movement_params
      params.require(:account_movement).permit(:investor_id, :value_date, :movement_date, :value, :description, :movement_type)
    end
    
    def get_investor
        @investor = Investor.find(params[:investor_id])
    end
    
end
