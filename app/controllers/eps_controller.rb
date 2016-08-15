class EpsController < ApplicationController
before_filter :authenticate_user!
 load_and_authorize_resource
  # GET /eps
  # GET /eps.json
  def index
   
  end

  def list
     @eps = Ep.where(enable: 1)
    if params[:s_eps]
      @eps = Ep.search(params)
      if Ep.search(params).blank?
        flash[:notice] = "No se obtuvo ningun resultado."         
      end
    else
      @eps = Ep.where(enable: 1)
    end
  end
  
  def searcheps
    @eps = Ep.where('nombre like ? and enable = 1', "%#{params[:query]}%")
  end

  # GET /eps/1
  # GET /eps/1.json
  def show
  end

  # GET /eps/new
  def new
  end

  # GET /eps/1/edit
  def edit
  end

  # POST /eps
  # POST /eps.json
  def create

    respond_to do |format|
      if @ep.save
        format.html { redirect_to @ep, notice: 'EPS creada exitosamente.' }
        format.json { render :show, status: :created, location: @ep }
      else
        format.html { render :new }
        format.json { render json: @ep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eps/1
  # PATCH/PUT /eps/1.json
  def update
    respond_to do |format|
      if @ep.update(ep_params)
        format.html { redirect_to @ep, notice: 'EPS actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @ep }
      else
        format.html { render :edit }
        format.json { render json: @ep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eps/1
  # DELETE /eps/1.json
  def destroy
    @ep.destroy
    respond_to do |format|
      format.html { redirect_to eps_url, notice: 'EPS eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def ep_params
      params.require(:ep).permit(:codigo_eps, :nombre, :enable)
    end
end
