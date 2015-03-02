class ValesController < ApplicationController
  before_action :set_vale, only: [:show, :edit, :update, :destroy]

  # GET /vales
  # GET /vales.json
  def index
    @vales = Vale.all
    @totals = self.totals
  end

  # GET /vales/1
  # GET /vales/1.json
  def show
  end

  # GET /vales/new
  def new
    puts "New vale"
    @vale = Vale.new
  end

  def totals
    hash = calcular_vales()
    return hash
  end

  # GET /vales/1/edit
  def edit

  end

  # POST /vales
  # POST /vales.json
  def create
    @cuenta = Cuenta.find(params[:vale][:cuenta_id])
    @vale = @cuenta.vales.new(vale_params)

    respond_to do |format|
      if @vale.save
        format.html { redirect_to @vale, notice: 'Vale was successfully created.' }
        format.json { render :show, status: :created, location: @vale }
      else
        format.html { render :new }
        format.json { render json: @vale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vales/1
  # PATCH/PUT /vales/1.json
  def update
    respond_to do |format|
      if @vale.update(vale_params)
        format.html { redirect_to @vale, notice: 'Vale was successfully updated.' }
        format.json { render :show, status: :ok, location: @vale }
      else
        format.html { render :edit }
        format.json { render json: @vale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vales/1
  # DELETE /vales/1.json
  def destroy
    @vale.destroy
    respond_to do |format|
      format.html { redirect_to vales_url, notice: 'Vale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vale
      @vale = Vale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vale_params
      params.require(:vale).permit(:cuenta_id, :cuenta, :responsable, :fechaEmision, :fechaRendicion, :estado, :montoPesos, :montoDolares, :comentario)
    end
end
