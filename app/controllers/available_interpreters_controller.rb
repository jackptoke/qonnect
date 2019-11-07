class AvailableInterpretersController < ApplicationController
  before_action :authenticate_user

  before_action :set_available_interpreter, only: [:show, :edit, :update, :destroy]

  # GET /available_interpreters
  def index
    @available_interpreters = AvailableInterpreter.all
  end

  # GET /available_interpreters/1
  def show
  end

  # GET /available_interpreters/new
  def new
    @available_interpreter = AvailableInterpreter.new
  end

  # GET /available_interpreters/1/edit
  def edit
  end

  # POST /available_interpreters
  def create
    @available_interpreter = AvailableInterpreter.new(available_interpreter_params)

    if @available_interpreter.save
      redirect_to @available_interpreter, notice: 'Available interpreter was successfully created.'
    else
      render :new
    end
  end

  # Add that an interpreter is availabe
  def addme
    # byebug
    @available_interpreter = AvailableInterpreter.new(params.permit(:interpreter_id, :job_booking_id))

    if AvailableInterpreter.where(interpreter_id: @available_interpreter.interpreter_id, job_booking_id: @available_interpreter.job_booking_id).count > 0
      redirect_to available_jobs_path, notice: 'Your availability has been noted.'
      return
    end

    if @available_interpreter.save
      redirect_to available_jobs_path, notice: 'Your available was successfully noted.'
    else
      render available_jobs_path
    end
  end

  # PATCH/PUT /available_interpreters/1
  def update
    if @available_interpreter.update(available_interpreter_params)
      redirect_to @available_interpreter, notice: 'Available interpreter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /available_interpreters/1
  def destroy
    @available_interpreter.destroy
    redirect_to available_interpreters_url, notice: 'Available interpreter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_interpreter
      @available_interpreter = AvailableInterpreter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def available_interpreter_params
      params.require(:available_interpreter).permit(:interpreter_id, :job_booking_id)
    end
end
