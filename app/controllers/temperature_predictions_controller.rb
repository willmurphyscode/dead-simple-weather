class TemperaturePredictionsController < ApplicationController
  before_action :set_temperature_prediction, only: [:show, :edit, :update, :destroy]

  # GET /temperature_predictions
  # GET /temperature_predictions.json
  def index
    @temperature_predictions = TemperaturePrediction.all
  end

  # GET /temperature_predictions/1
  # GET /temperature_predictions/1.json
  def show
  end

  # GET /temperature_predictions/new
  def new
    @temperature_prediction = TemperaturePrediction.new
  end

  # GET /temperature_predictions/1/edit
  def edit
  end

  # POST /temperature_predictions
  # POST /temperature_predictions.json
  def create
    @temperature_prediction = TemperaturePrediction.new(temperature_prediction_params)

    respond_to do |format|
      if @temperature_prediction.save
        format.html { redirect_to @temperature_prediction, notice: 'Temperature prediction was successfully created.' }
        format.json { render :show, status: :created, location: @temperature_prediction }
      else
        format.html { render :new }
        format.json { render json: @temperature_prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temperature_predictions/1
  # PATCH/PUT /temperature_predictions/1.json
  def update
    respond_to do |format|
      if @temperature_prediction.update(temperature_prediction_params)
        format.html { redirect_to @temperature_prediction, notice: 'Temperature prediction was successfully updated.' }
        format.json { render :show, status: :ok, location: @temperature_prediction }
      else
        format.html { render :edit }
        format.json { render json: @temperature_prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperature_predictions/1
  # DELETE /temperature_predictions/1.json
  def destroy
    @temperature_prediction.destroy
    respond_to do |format|
      format.html { redirect_to temperature_predictions_url, notice: 'Temperature prediction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature_prediction
      @temperature_prediction = TemperaturePrediction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temperature_prediction_params
      params.require(:temperature_prediction).permit(:zip, :temp, :date_covered, :date_issued)
    end
end
