class PokemonPurchasesController < ApplicationController
  before_action :set_pokemon_purchase, only: %i[ show edit update destroy ]

  # GET /pokemon_purchases or /pokemon_purchases.json
  def index
    @pokemon_purchases = PokemonPurchase.all
  end

  # GET /pokemon_purchases/1 or /pokemon_purchases/1.json
  def show
  end

  # GET /pokemon_purchases/new
  def new
    @pokemon_purchase = PokemonPurchase.new
  end

  # GET /pokemon_purchases/1/edit
  def edit
  end

  # POST /pokemon_purchases or /pokemon_purchases.json
  def create
    @pokemon_purchase = PokemonPurchase.new(pokemon_purchase_params)

    respond_to do |format|
      if @pokemon_purchase.save
        format.html { redirect_to pokemon_purchase_url(@pokemon_purchase), notice: "Pokemon purchase was successfully created." }
        format.json { render :show, status: :created, location: @pokemon_purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemon_purchases/1 or /pokemon_purchases/1.json
  def update
    respond_to do |format|
      if @pokemon_purchase.update(pokemon_purchase_params)
        format.html { redirect_to pokemon_purchase_url(@pokemon_purchase), notice: "Pokemon purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon_purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemon_purchases/1 or /pokemon_purchases/1.json
  def destroy
    @pokemon_purchase.destroy

    respond_to do |format|
      format.html { redirect_to pokemon_purchases_url, notice: "Pokemon purchase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_purchase
      @pokemon_purchase = PokemonPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_purchase_params
      params.require(:pokemon_purchase).permit(:value)
    end
end
