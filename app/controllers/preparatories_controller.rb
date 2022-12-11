class PreparatoriesController < ApplicationController
  before_action :set_preparatory, only: %i[ show edit update destroy ]

  # GET /preparatories or /preparatories.json
  def index
    @preparatories = Preparatory.all
  end

  # GET /preparatories/1 or /preparatories/1.json
  def show
  end

  # GET /preparatories/new
  def new
    @preparatory = Preparatory.new
  end

  # GET /preparatories/1/edit
  def edit
  end

  # POST /preparatories or /preparatories.json
  def create
    @preparatory = Preparatory.new(preparatory_params)

    respond_to do |format|
      if @preparatory.save
        format.html { redirect_to preparatory_url(@preparatory), notice: "Preparatory was successfully created." }
        format.json { render :show, status: :created, location: @preparatory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preparatory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preparatories/1 or /preparatories/1.json
  def update
    respond_to do |format|
      if @preparatory.update(preparatory_params)
        format.html { redirect_to preparatory_url(@preparatory), notice: "Preparatory was successfully updated." }
        format.json { render :show, status: :ok, location: @preparatory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preparatory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preparatories/1 or /preparatories/1.json
  def destroy
    @preparatory.destroy

    respond_to do |format|
      format.html { redirect_to preparatories_url, notice: "Preparatory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preparatory
      @preparatory = Preparatory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def preparatory_params
      params.require(:preparatory).permit(:name, :duration, :youtube_video_id)
    end
end
