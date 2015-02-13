class CuentaController < ApplicationController
  before_action :set_cuentum, only: [:show, :edit, :update, :destroy]

  # GET /cuenta
  # GET /cuenta.json
  def index
    @cuenta = Cuenta.all
  end

  # GET /cuenta/1
  # GET /cuenta/1.json
  def show
  end

  # GET /cuenta/new
  def new
    @cuentum = Cuenta.new
  end

  # GET /cuenta/1/edit
  def edit
  end

  # POST /cuenta
  # POST /cuenta.json
  def create
    @cuentum = Cuenta.new(cuentum_params)

    respond_to do |format|
      if @cuentum.save
        format.html { redirect_to @cuentum, notice: 'Cuenta was successfully created.' }
        format.json { render :show, status: :created, location: @cuentum }
      else
        format.html { render :new }
        format.json { render json: @cuentum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuenta/1
  # PATCH/PUT /cuenta/1.json
  def update
    respond_to do |format|
      if @cuentum.update(cuentum_params)
        format.html { redirect_to @cuentum, notice: 'Cuenta was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuentum }
      else
        format.html { render :edit }
        format.json { render json: @cuentum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuenta/1
  # DELETE /cuenta/1.json
  def destroy
    @cuentum.destroy
    respond_to do |format|
      format.html { redirect_to cuenta_index_url, notice: 'Cuenta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuentum
      @cuentum = Cuenta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuentum_params
      params.require(:cuentum).permit(:cuenta, :subcuenta1, :subcuenta2, :subcuenta3, :subcuenta4, :subcuenta5, :descripcion, :nombre, :estado, :tipo)
    end
end
