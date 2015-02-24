class OfrendasController < ApplicationController
  before_action :set_ofrenda, only: [:show, :edit, :update, :destroy]

  list(:ofrendas, joins: [:Cuenta, :Miembro]) do |t|
    t.column :fecha, :datatype => :date
    t.column :nombre, through: :Cuenta, url: true
    t.column :miembro_id
    t.column :montoPesos
    t.column :montoDolares
    t.column :esCheque, :datatype => :boolean
    t.column :comentario
  end


  # GET /ofrendas
  # GET /ofrendas.json
  def index
    @ofrendas = Ofrenda.all
    @totals = self.totals
  end

  def totals
    hash = {}

    if !@ofrendas.nil?
      hash[:SumaOfrendaPesos] = @ofrendas.sum(:montoPesos)
      hash[:SumaOfrendaDolares] = @ofrendas.sum(:montoDolares)
    end

    return hash
  end

  # GET /ofrendas/1
  # GET /ofrendas/1.json
  def show
  end

  # GET /ofrendas/new
  def new
    @ofrenda = Ofrenda.new
  end

  # GET /ofrendas/1/edit
  def edit
  end

  # POST /ofrendas
  # POST /ofrendas.json
  def create
    @cuenta = Cuenta.find(params[:ofrenda][:cuenta_id])
    @ofrenda = @cuenta.ofrendas.new(ofrenda_params)

    respond_to do |format|
      if @ofrenda.save
        format.html { redirect_to @ofrenda, notice: 'Ofrenda was successfully created.' }
        format.json { render :show, status: :created, location: @ofrenda }
      else
        format.html { render :new }
        format.json { render json: @ofrenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ofrendas/1
  # PATCH/PUT /ofrendas/1.json
  def update
    respond_to do |format|
      if @ofrenda.update(ofrenda_params)
        format.html { redirect_to @ofrenda, notice: 'Ofrenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @ofrenda }
      else
        format.html { render :edit }
        format.json { render json: @ofrenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ofrendas/1
  # DELETE /ofrendas/1.json
  def destroy
    @ofrenda.destroy
    respond_to do |format|
      format.html { redirect_to ofrendas_url, notice: 'Ofrenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ofrenda
      @ofrenda = Ofrenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ofrenda_params
      params.require(:ofrenda).permit(:miembro_id, :cuenta_id, :fecha, :montoPesos, :montoDolares, :esCheque, :idcheque, :comentario)
    end
end
