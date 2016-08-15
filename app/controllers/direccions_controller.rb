class DireccionsController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource
  

  # GET /direccions
  # GET /direccions.json
  def index
    
  end

  # GET /direccions/1
  # GET /direccions/1.json
  def show
  end

  # GET /direccions/new
  def new
  end

  # GET /direccions/1/edit
  def edit
  end

  # POST /direccions
  # POST /direccions.json
  def create

    respond_to do |format|
      if @direccion.save
        format.html { redirect_to @direccion, notice: 'Direccion creada exitosamente.' }
        format.json { render :show, status: :created, location: @direccion }
      else
        format.html { render :new }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direccions/1
  # PATCH/PUT /direccions/1.json
  def update
    respond_to do |format|
      if @direccion.update(direccion_params)
        format.html { redirect_to @direccion, notice: 'Direccion actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @direccion }
      else
        format.html { render :edit }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direccions/1
  # DELETE /direccions/1.json
  def destroy
    @direccion.destroy
    respond_to do |format|
      format.html { redirect_to direccions_url, notice: 'Direccion eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def direccion_params
      params.require(:direccion).permit(:barrio, :direccion, :tel, :numero_id, :municipio_id)
    end
end
