class CitaController < ApplicationController
   before_filter :authenticate_user!
 load_and_authorize_resource
 
 

  # GET /cita
  # GET /cita.json
  def index
   
    
  end

  def list
     @cita = Citum.all
    if (params[:s_tipo] && params[:s_identificacion] && params[:s_nombre] && params[:s_apellido] && params[:s_especialidad]&& params[:s_fecha])
      @cita = Citum.search(params)
      if Citum.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @cita = Citum.all
    end      
     
  end

  def export
  end

  
  # GET /cita/1
  # GET /cita/1.json
  def show
  end

  # GET /cita/new
  def new
    
  end

  # GET /cita/1/edit
  def edit
  end
  
  
  # POST /cita
  # POST /cita.json
  def create
    
    respond_to do |format|
      
      if @citum.save
        format.html { redirect_to @citum, notice: 'Cita creada exitosamente.' }
        format.json { render :show, status: :created, location: @citum }
      else
        format.html { render :new }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end    
      
    end
  end

  # PATCH/PUT /cita/1
  # PATCH/PUT /cita/1.json
  def update
    respond_to do |format|
      if @citum.update(citum_params)
        format.html { redirect_to @citum, notice: 'Cita actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @citum }
      else
        format.html { render :edit }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cita/1
  # DELETE /cita/1.json
  def destroy
    @citum.destroy
    respond_to do |format|
      format.html { redirect_to cita_url, notice: 'Cita fue borrada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def citum_params
      params.require(:citum).permit(:paciente_id, :fecha, :hora, :consultorio_id, :servicio_id, :especialidad_id, :profesional_id, :integer, :llegada, :atendido,:riesgo,:psicosocial, :nro_autorizacion, :primera_vez)
    end
end
