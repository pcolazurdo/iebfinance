class EfectivosController < ApplicationController
  before_action :set_efectivo, only: [:show, :edit, :update, :destroy]

  # GET /efectivos
  # GET /efectivos.json
  def index
    @efectivos = Efectivo.all
  end

  # GET /efectivos/1
  # GET /efectivos/1.json
  def show
  end

  # GET /efectivos/new
  def new
    @efectivo = Efectivo.new
  end

  # GET /efectivos/1/edit
  def edit
  end

  # POST /efectivos
  # POST /efectivos.json
  def create
    @efectivo = Efectivo.new(efectivo_params)

    respond_to do |format|
      if @efectivo.save
        format.html { redirect_to @efectivo, notice: 'Efectivo was successfully created.' }
        format.json { render :show, status: :created, location: @efectivo }
      else
        format.html { render :new }
        format.json { render json: @efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /efectivos/1
  # PATCH/PUT /efectivos/1.json
  def update
    respond_to do |format|
      if @efectivo.update(efectivo_params)
        format.html { redirect_to @efectivo, notice: 'Efectivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @efectivo }
      else
        format.html { render :edit }
        format.json { render json: @efectivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /efectivos/1
  # DELETE /efectivos/1.json
  def destroy
    @efectivo.destroy
    respond_to do |format|
      format.html { redirect_to efectivos_url, notice: 'Efectivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_efectivo
      @efectivo = Efectivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def efectivo_params
      params.require(:efectivo).permit(:fecha, :Pesos2, :Pesos5, :Pesos10, :Pesos20, :Pesos50, :Pesos100, :PesosMonedas, :Dolares1, :Dolares2, :Dolares5, :Dolares10, :Dolares20, :Dolares50, :Dolares100, :DolaresMonedas)
    end
end
