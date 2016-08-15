class ServiciosController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource

  # GET /servicios
  # GET /servicios.json
  def index
  end

  def list
  end
  
  # GET /servicios/1
  # GET /servicios/1.json
  def show
  end

  # GET /servicios/new
  def new
  end

  # GET /servicios/1/edit
  def edit
  end

  # POST /servicios
  # POST /servicios.json
  def create

    respond_to do |format|
      if @servicio.save
        format.html { redirect_to @servicio, notice: 'Programa o Grupo de Servicios creado exitosamente.' }
        format.json { render :show, status: :created, location: @servicio }
      else
        format.html { render :new }
        format.json { render json: @servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicios/1
  # PATCH/PUT /servicios/1.json
  def update
    respond_to do |format|
      if @servicio.update(servicio_params)
        format.html { redirect_to @servicio, notice: 'Programa o Grupo de Servicios actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @servicio }
      else
        format.html { render :edit }
        format.json { render json: @servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicios/1
  # DELETE /servicios/1.json
  def destroy
    @servicio.destroy
    respond_to do |format|
      format.html { redirect_to servicios_url, notice: 'Programa o Grupo de Servicios eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def servicio_params
      params.require(:servicio).permit(:nombre, :enable)
    end
end
