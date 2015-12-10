class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end
  
  # GET /deals/new
  def new_deal_investor_project
    @deal = Deal.new
    @deal.project_id = params["id_project"]
    @deal.investor_id = params["id_investor"]
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    #verifica se o investidor tem fundos suficientes na conta
    @investor = Investor.find(params["deal"]["investor_id"])
    if @investor.saldo >= deal_params[:value].to_f then 
      #cria um registo a debito na conta 
      @account_movement = AccountMovement.new
      @account_movement.value= - deal_params[:value].to_f
      @account_movement.value_date= Date.today
      @account_movement.movement_date= Date.today
      @account_movement.investor_id= deal_params[:investor_id]
      @account_movement.save
      @deal = Deal.new(deal_params)
      deal_save = @deal.save
    else
      deal_save = false
    end

    respond_to do |format|
      if deal_save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:investor_id, :project_id, :value, :confirmed, :confirmation_date)
    end
end
