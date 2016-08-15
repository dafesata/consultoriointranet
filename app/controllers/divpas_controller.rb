class DivpasController < ApplicationController
  before_filter :authenticate_user!
 load_and_authorize_resource

  # GET /divpas
  # GET /divpas.json
  def index
      
  end

  def list
    @divpas = Divpa.where(enable: 1).paginate(:page => params[:page], :per_page => 20)
    if (params[:s_municipio] && params[:s_departamento])
      @divpas = Divpa.search(params).paginate(:page => params[:page], :per_page => 20)
       if Divpa.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @divpas = Divpa.where(enable: 1).paginate(:page => params[:page], :per_page => 20)
    end

  end
  
    # GET /divpas/1
  # GET /divpas/1.json
  def show
  end

  # GET /divpas/new
  def new
  end

  # GET /divpas/1/edit
  def edit
  end

  # POST /divpas
  # POST /divpas.json
  def create

    respond_to do |format|
      if @divpa.save
        format.html { redirect_to @divpa, notice: 'Municipio creado exitosamente.' }
        format.json { render :show, status: :created, location: @divpa }
      else
        format.html { render :new }
        format.json { render json: @divpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divpas/1
  # PATCH/PUT /divpas/1.json
  def update
    respond_to do |format|
      if @divpa.update(divpa_params)
        format.html { redirect_to @divpa, notice: 'Municipio actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @divpa }
      else
        format.html { render :edit }
        format.json { render json: @divpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divpas/1
  # DELETE /divpas/1.json
  def destroy
    @divpa.destroy
    respond_to do |format|
      format.html { redirect_to divpas_url, notice: 'Municipio eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def divpa_params
      params.require(:divpa).permit(:cod_dpto, :cod_muni, :cod_cp, :nombre_dpto, :nombre_muni, :nombre_cp, :tipo, :enable)
    end
end
