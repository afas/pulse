class ServiceDataController < ApplicationController
  before_action :set_service_datum, only: [:show, :edit, :update, :destroy]

  # GET /service_data
  # GET /service_data.json
  def index
    @service_data = ServiceDatum.all
  end

  # GET /service_data/1
  # GET /service_data/1.json
  def show
  end

  # GET /service_data/new
  def new
    @service_datum = ServiceDatum.new
  end

  # GET /service_data/1/edit
  def edit
  end

  # POST /service_data
  # POST /service_data.json
  def create
    @service_datum = ServiceDatum.new(service_datum_params)

    respond_to do |format|
      if @service_datum.save
        format.html { redirect_to @service_datum, notice: 'Service datum was successfully created.' }
        format.json { render :show, status: :created, location: @service_datum }
      else
        format.html { render :new }
        format.json { render json: @service_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_data/1
  # PATCH/PUT /service_data/1.json
  def update
    respond_to do |format|
      if @service_datum.update(service_datum_params)
        format.html { redirect_to @service_datum, notice: 'Service datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_datum }
      else
        format.html { render :edit }
        format.json { render json: @service_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_data/1
  # DELETE /service_data/1.json
  def destroy
    @service_datum.destroy
    respond_to do |format|
      format.html { redirect_to service_data_url, notice: 'Service datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_datum
      @service_datum = ServiceDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_datum_params
      params[:service_datum]
    end
end
