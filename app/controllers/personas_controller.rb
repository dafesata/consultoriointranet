class PersonasController < ApplicationController
  before_filter :authenticate_user!  
  load_and_authorize_resource





  # GET /personas
  # GET /personas.json
  def index
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    
  end

  # GET /personas/1/edit
  def edit
    
  end

  # POST /personas
  # POST /personas.json
  def create

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona creada exitosamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:tipoid, :numero_id, :numero_type, :primer_apellido, :segundo_apellido, :primer_nombre, :segundo_nombre, :estado_civil, :fecha_nac, :sexo, :celular)
    end
end
