class PacientesController < ApplicationController
    before_filter :authenticate_user!

    load_and_authorize_resource
  
  # GET /pacientes
  # GET /pacientes.json
  def index
    
  end

  def list
     @pacientes = Paciente.all
    if (params[:s_identificacion] && params[:s_pnombre] && params[:s_snombre] && params[:s_papellido] && params[:s_sapellido])
      @pacientes = Paciente.search(params)
      if Paciente.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @pacientes = Paciente.all
    end      
  end

  def searchpaciente
    @oacientes = Paciente.where('numero_id = ?', "%#{params[:query]}%")
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
  end

  
  # GET /pacientes/new
  def new  
    @paciente.build_persona
    @paciente.direccions.build
    
  end

  # GET /pacientes/1/edit
  def edit    
    @paciente.direccions.build
  end

  # POST /pacientes
  # POST /pacientes.json
  def create   
    
    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: 'Paciente creado exitosamente.' }
        format.json { render :show, status: :created, location: @paciente }
      else        
        format.html { render :new}
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update    
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: 'Paciente elimiando exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:numero_id, :eps_id, :tipo_usuario,:lugar_nac,:nacionalidad,:escolaridad,:ocupacion,:estrato,:email,:nro_hijos, persona_attributes: [:tipoid, :numero_id, :numero_type, :primer_apellido, :segundo_apellido, :primer_nombre, :segundo_nombre, :estado_civil, :fecha_nac, :sexo, :celular], direccions_attributes:[:id,:numero_id,:numero_type,:barrio,:direccion,:tel,:municipio_id,:_destroy])
    end
end
