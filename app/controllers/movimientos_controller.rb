require 'date'

class MovimientosController < ApplicationController
  before_action :set_movimiento, only: [:show, :edit, :update, :destroy]
  before_action :update_table, only: [:index, :show, :edit, :update, :destroy, :create]

  def update_table
    params[:q] ||= {}
    puts params[:q]['fecha_gteq(1i)'], params[:q]['fecha_gteq(2i)'], params[:q]['fecha_gteq(3i)']
    if params[:q]['fecha_gteq(1i)'].to_i > 0
      @fecha_gteq = Date.new(params[:q]['fecha_gteq(1i)'].to_i, params[:q]['fecha_gteq(2i)'].to_i, params[:q]['fecha_gteq(3i)'].to_i )
      @fecha_lteq = Date.new(params[:q]['fecha_lteq(1i)'].to_i, params[:q]['fecha_lteq(2i)'].to_i, params[:q]['fecha_lteq(3i)'].to_i )
    end

    @search = Movimiento.ransack(params[:q])
    @movimientos = @search.result(distinct: true).includes(:cuenta)
    @totals = self.totals
  end



  def index
    self.new
  end

  # GET /movimientos/1
  # GET /movimientos/1.json
  def show

  end

  def totals
    hash = {}
    # hash[:SumaIngresoPesos]  = Movimiento.where(condition).sum(:IngresoPesos)
    # hash[:SumaIngresoDolares]  = Movimiento.where(condition).sum(:IngresoDolares)
    # hash[:SumaEgresoPesos]  = Movimiento.where(condition).sum(:EgresoPesos)
    # hash[:SumaEgresoDolares]  = Movimiento.where(condition).sum(:EgresoDolares)

    if !@search.nil?
      hash[:SumaIngresoPesos] = @search.result(distinct: true).includes(:cuenta).sum(:IngresoPesos)
      hash[:SumaIngresoDolares] = @search.result(distinct: true).includes(:cuenta).sum(:IngresoDolares)
      hash[:SumaEgresoPesos] = @search.result(distinct: true).includes(:cuenta).sum(:EgresoPesos)
      hash[:SumaEgresoDolares] = @search.result(distinct: true).includes(:cuenta).sum(:EgresoDolares)
    end


    # hash[:SumaPesos]  = @movimientos.sum(:IngresoPesos) # NOT WORKING!

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
        format.js {
          self.new
          self.update_table
        }
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
