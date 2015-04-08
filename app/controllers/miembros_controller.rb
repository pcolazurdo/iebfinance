class MiembrosController < ApplicationController
  before_action :set_miembro, only: [:show, :edit, :update, :destroy]
  before_action :update_table, only: [:index, :show, :edit, :update, :destroy, :create]

  helper ApplicationHelper

  # GET /miembros
  # GET /miembros.json
  def index
    # @miembros = Miembro.all
  end

  def update_table


    if !params[:sort].nil?
      puts "update_table: "+ params[:sort]
      a = process_sort(params[:sort])
      @miembros = Miembro.order(process_sort(params[:sort])).all
    else
      @miembros = Miembro.all
    end
  end

  # GET /miembros/1
  # GET /miembros/1.json
  def show
  end

  # GET /miembros/new
  def new
    @miembro = Miembro.new
  end

  # GET /miembros/1/edit
  def edit
  end

  # POST /miembros
  # POST /miembros.json
  def create
    @miembro = Miembro.new(miembro_params)

    respond_to do |format|
      if @miembro.save
        format.html { redirect_to @miembro, notice: 'Miembro was successfully created.' }
        format.json { render :show, status: :created, location: @miembro }
        format.js {
          self.new
          self.update_table
        }
      else
        format.html { render :new }
        format.json { render json: @miembro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miembros/1
  # PATCH/PUT /miembros/1.json
  def update
    respond_to do |format|
      if @miembro.update(miembro_params)
        format.html { redirect_to @miembro, notice: 'Miembro was successfully updated.' }
        format.json { render :show, status: :ok, location: @miembro }
      else
        format.html { render :edit }
        format.json { render json: @miembro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miembros/1
  # DELETE /miembros/1.json
  def destroy
    @miembro.destroy
    respond_to do |format|
      format.html { redirect_to miembros_url, notice: 'Miembro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miembro
      @miembro = Miembro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miembro_params
      params.require(:miembro).permit(:idFiscal, :nombre, :estado, :tipo, :email, :direccion)
    end
    def process_sort(sort)
      puts "process_sort(sort)" + sort
      splitted = sort.split(" ")
      value = '"' + splitted[0] + '"'
      if !splitted[1].nil?
        case splitted[1].downcase
        when "asc"
          value += " asc"
        when "desc"
          value += " desc"
        else
          puts "Command Injection?"
          # splitted.each do |x|
          #   puts x
          # end
        end
      end
      puts "process_sort" + value
      return value
    end
    
end
