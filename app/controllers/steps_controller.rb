class StepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson
  before_action :set_step, only: %i[ show edit update destroy ]

  # GET /steps or /steps.json
  def index
    #@steps = Step.all
    @steps = @lesson.steps.order(id: "ASC")
    authorize @steps
  end

  # GET /steps/1 or /steps/1.json
  def show
    render layout: 'full_screen'
  end

  # GET /steps/new
  def new
    #@step = Step.new
    @step = @lesson.steps.new
    authorize @step
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps or /steps.json
  def create
    #@step = Step.new(step_params)
    @step = @lesson.steps.new(step_params)
    authorize @step

    respond_to do |format|
      if @step.save
        #format.html { redirect_to step_url(@step), notice: "Step was successfully created." }
        format.html { redirect_to lesson_steps_path(@lesson), notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1 or /steps/1.json
  def update
    respond_to do |format|
      #raise "params[:step][:diary_chap] = #{params[:step][:diary_chap]} -- @step.diary_chap = #{@step.diary_chap}"
      #raise "current_user.role = #{current_user.role}"
      if @step.diary_chap > 0 or current_user.role == "admin" 
        #Aggiorna lo step e vai avanti
        if @step.update(step_params)
          #format.html { redirect_to step_url(@step), notice: "Step was successfully updated." }
          #format.html { redirect_to lesson_step_path(@lesson), notice: 'Step was successfully updated.' }
          format.html do 
            if @step.next.present?
              redirect_to lesson_step_path(@lesson, @step.next.id), notice: 'Step was successfully updated.' 
            else
              redirect_to lesson_step_path(@lesson), notice: 'Step was successfully updated. - Ultima risposta'
            end
          end
          format.json { render :show, status: :ok, location: @step }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @step.errors, status: :unprocessable_entity }
        end
      else
        #----
        #Non aggiornare lo step e vai solo avanti
        format.html do 
          if @step.next.present?
            redirect_to lesson_step_path(@lesson, @step.next.id), notice: 'Step was successfully updated.' 
          else
            redirect_to lesson_step_path(@lesson), notice: 'Step was successfully updated. - Ultima risposta'
          end
        end
        format.json { render :show, status: :ok, location: @step }
        #----
        #tutto questo blocco è stato aggiunto semplicemente per evitare di salvare la risposta sul db. *_*
      end
    end
  end

  # DELETE /steps/1 or /steps/1.json
  def destroy
    @step.destroy

    respond_to do |format|
      #format.html { redirect_to steps_url, notice: "Step was successfully destroyed." }
      format.html { redirect_to lesson_steps_path(@lesson), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    def set_step
      #@step = Step.find(params[:id])
      @step = @lesson.steps.find(params[:id])
      authorize @step
    end

    # Only allow a list of trusted parameters through.
    def step_params
      params.require(:step).permit(:id, :question, :lesson_id, :youtube_video_id, :diary_chap, answers_attributes: [:_destroy, :id, :content, :user_id])
    end
end
