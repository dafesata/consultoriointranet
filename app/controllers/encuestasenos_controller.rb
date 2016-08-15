class EncuestasenosController < ApplicationController
  before_filter :authenticate_user!
    load_and_authorize_resource

  # GET /encuestasenos
  # GET /encuestasenos.json
  def index
  end

  def list
      @encuestasenos = EncuestaSeno.all
    if (params[:s_identificacion] && params[:s_pnombre] && params[:s_snombre] && params[:s_papellido] && params[:s_sapellido])
      @encuestasenos = EncuestaSeno.search(params)
      if EncuestaSeno.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @encuestasenos = EncuestaSeno.all
    end    
  end

  # GET /encuestasenos/1
  # GET /encuestasenos/1.json
  def show
  end

  # GET /encuestasenos/new
  def new
    
  end

  # GET /encuestasenos/1/edit
  def edit
  end

  # POST /encuestasenos
  # POST /encuestasenos.json
  def create
    

    respond_to do |format|
      if @encuestaseno.save
        format.html { redirect_to @encuestaseno, notice: 'Encuesta creada exitosamente.' }
        format.json { render :show, status: :created, location: @encuestaseno }
      else
        format.html { render :new }
        format.json { render json: @encuestaseno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encuestasenos/1
  # PATCH/PUT /encuestasenos/1.json
  def update
    respond_to do |format|
      if @encuestaseno.update(encuestaseno_params)
        format.html { redirect_to @encuestaseno, notice: 'Encuesta Actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @encuestaseno }
      else
        format.html { render :edit }
        format.json { render json: @encuestaseno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encuestasenos/1
  # DELETE /encuestasenos/1.json
  def destroy
    @encuestaseno.destroy
    respond_to do |format|
      format.html { redirect_to encuestasenos_url, notice: 'Encuesta eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def encuestaseno_params
      params.require(:encuestaseno).permit(:paciente_id, :ant_fam, :menarquia, :hijos, :edadphijo, :lactancia, :ant_orales, :menopausia, :edad_menopausia, :trh, :alcohol, :fumador, :consumo_grasa, :peso, :talla, :imc, :equivalente, :nro_mamografias, :autoexamen, :exam_anual, :fecha_mamo, :resul_mamo, :desc_resul)
    end
end
