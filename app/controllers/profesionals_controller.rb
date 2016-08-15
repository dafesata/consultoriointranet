class ProfesionalsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /profesionals
  # GET /profesionals.json
  def index

  end

  def list
     @profesionals = Profesional.all
    if (params[:s_identificacion] && params[:s_pnombre] && params[:s_snombre] && params[:s_papellido] && params[:s_sapellido])
      @profesionals = Profesional.search(params)
      if Profesional.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @profesionals = Profesional.all
    end      
  end

  # GET /profesionals/1
  # GET /profesionals/1.json
  def show
    
    
  end

  # GET /profesionals/new
  def new
    @profesional.build_persona
    @profesional.direccions.build
  end

  # GET /profesionals/1/edit
  def edit
    @profesional.direccions.build
  end

  # POST /profesionals
  # POST /profesionals.json
  def create

    respond_to do |format|
      if @profesional.save
        format.html { redirect_to @profesional, notice: 'Profesional creado exitosamente.' }
        format.json { render :show, status: :created, location: @profesional }
      else
        format.html { render :new }
        format.json { render json: @profesional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesionals/1
  # PATCH/PUT /profesionals/1.json
  def update
    respond_to do |format|
      if @profesional.update(profesional_params)
        format.html { redirect_to @profesional, notice: 'Profesional actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @profesional }
      else
        format.html { render :edit }
        format.json { render json: @profesional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesionals/1
  # DELETE /profesionals/1.json
  def destroy
    @profesional.destroy
    respond_to do |format|
      format.html { redirect_to profesionals_url, notice: 'Profesional eliminad exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesional_params
      params.require(:profesional).permit(:numero_id, :reg_med, :especialidad_id, persona_attributes: [:tipoid, :numero_id, :numero_type, :primer_apellido, :segundo_apellido, :primer_nombre, :segundo_nombre, :estado_civil, :fecha_nac, :sexo, :celular], direccions_attributes:[:id,:numero_id,:numero_type,:barrio,:direccion,:tel,:municipio_id,:_destroy])
    end
end
