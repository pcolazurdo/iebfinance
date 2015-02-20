class MovimientosController < ApplicationController
  before_action :set_movimiento, only: [:show, :edit, :update, :destroy]

  list

  # GET /movimientos
  # GET /movimientos.json
  def index
    params[:q] ||= {}
    created_at_gt = params[:q][:created_at_gt]
    @movimientos = Movimiento.all
    @totals = self.totals
    @search = Movimiento.ransack(params[:q])
  end

  # GET /movimientos/1
  # GET /movimientos/1.json
  def show

  end

  def totals
    hash = {}
    hash[:SumaPesos]  = Movimiento.where(["fecha BETWEEN ? AND ?", "01/01/2015", "31/12/2015"]).sum(:IngresoPesos)
    puts "Totals", hash[:SumaPesos]
    # hash[:credit] = self.journal_entry_items.sum(:credit)
    # hash[:balance_debit] = 0.0
    # hash[:balance_credit] = 0.0
    # hash[:balance] = (hash[:debit]-hash[:credit]).abs
    # hash["balance_#{hash[:debit]>hash[:credit] ? 'debit' : 'credit'}".to_sym] = hash[:balance]
    return hash
  end

  # GET /movimientos/new
  def new
    @movimiento = Movimiento.new
  end

  # GET /movimientos/1/edit
  def edit
  end

  # POST /movimientos
  # POST /movimientos.json
  def create
    @cuenta = Cuenta.find(params[:movimiento][:cuenta_id])
    @movimiento = @cuenta.movimientos.new(movimiento_params)

    respond_to do |format|
      if @movimiento.save
        format.html { redirect_to @movimiento, notice: 'Movimiento was successfully created.' }
        format.json { render :show, status: :created, location: @movimiento }
      else
        format.html { render :new }
        format.json { render json: @movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos/1
  # PATCH/PUT /movimientos/1.json
  def update
    respond_to do |format|
      if @movimiento.update(movimiento_params)
        format.html { redirect_to @movimiento, notice: 'Movimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimiento }
      else
        format.html { render :edit }
        format.json { render json: @movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos/1
  # DELETE /movimientos/1.json
  def destroy
    @movimiento.destroy
    respond_to do |format|
      format.html { redirect_to movimientos_url, notice: 'Movimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento
      @movimiento = Movimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_params
      params.require(:movimiento).permit(:cuenta_id, :fecha, :IngresoPesos, :IngresoDolares, :EgresoPesos, :EgresoDolares, :Comprobante, :comentario)
    end
end
