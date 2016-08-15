class EspecialidadsController < ApplicationController
  before_filter :authenticate_user!
 load_and_authorize_resource

  # GET /especialidads
  # GET /especialidads.json
  def index    
 
  end

  def list
       @especialidads = Especialidad.where(enable: 1).paginate(:page => params[:page], :per_page => 10)
    if params[:s_especialidad] && params[:s_servicio]
      @especialidads = Especialidad.search(params).paginate(:page => params[:page], :per_page => 10)
      if Especialidad.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @especialidads = Especialidad.where(enable: 1).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /especialidads/1
  # GET /especialidads/1.json
  def show
  end

  # GET /especialidads/new
  def new
  end

  # GET /especialidads/1/edit
  def edit
  end

  # POST /especialidads
  # POST /especialidads.json
  def create

    respond_to do |format|
      if @especialidad.save
        format.html { redirect_to @especialidad, notice: 'Servicio creado exitosamente.' }
        format.json { render :show, status: :created, location: @especialidad }
      else
        format.html { render :new }
        format.json { render json: @especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialidads/1
  # PATCH/PUT /especialidads/1.json
  def update
    respond_to do |format|
      if (Servicio.where(id: especialidad_params[:servicio_id]).select(:enable).first.enable)
        if @especialidad.update(especialidad_params)
          format.html { redirect_to @especialidad, notice: 'Servicio actualizado exitosamente.' }
          format.json { render :show, status: :ok, location: @especialidad }
        else
          format.html { render :edit }
          format.json { render json: @especialidad.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit }
        format.json { render json: @especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialidads/1
  # DELETE /especialidads/1.json
  def destroy
    @especialidad.destroy
    respond_to do |format|
      format.html { redirect_to especialidads_url, notice: 'Servicio eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialidad_params
      params.require(:especialidad).permit(:especialidad_id, :nombre, :servicio_id, :enable)
    end
end
