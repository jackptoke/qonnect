class InterpreterLanguagesController < ApplicationController
  before_action :authenticate_user
  before_action :set_interpreter_language, only: [:show, :edit, :update, :destroy]

  # GET /interpreter_languages
  # GET /interpreter_languages.json
  def index
    if true
      redirect_to root_path, :flash => { :error => "Insufficient rights!" }
    end
    @interpreter_languages = InterpreterLanguage.all
  end

  def my_languages
    if current_interpreter
      @my_dialects = InterpreterLanguage.where(interpreter_id: current_interpreter.id)
    else
        redirect_to root_path, :flash => { :error => "Insufficient rights!" }
    end
  end

  # GET /interpreter_languages/1
  # GET /interpreter_languages/1.json
  def show
  end

  # GET /interpreter_languages/new
  def new
    @interpreter_language = InterpreterLanguage.new
    @interpreter = current_interpreter
    # byebug
  end

  # GET /interpreter_languages/1/edit
  def edit
  end

  # POST /interpreter_languages
  # POST /interpreter_languages.json
  def create
    @interpreter_language = InterpreterLanguage.new(interpreter_language_params)
    # byebug
    respond_to do |format|
      if @interpreter_language.save
        format.html { redirect_to my_languages_path, notice: 'Interpreter language was successfully created.' }
        format.json { render :show, status: :created, location: @interpreter_language }
      else
        format.html { render :new }
        format.json { render json: @interpreter_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interpreter_languages/1
  # PATCH/PUT /interpreter_languages/1.json
  def update
    respond_to do |format|
      if @interpreter_language.update(interpreter_language_params)
        format.html { redirect_to @interpreter_language, notice: 'Interpreter language was successfully updated.' }
        format.json { render :show, status: :ok, location: @interpreter_language }
      else
        format.html { render :edit }
        format.json { render json: @interpreter_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interpreter_languages/1
  # DELETE /interpreter_languages/1.json
  def destroy
    @interpreter_language.destroy
    respond_to do |format|
      format.html { redirect_to my_languages_path, notice: 'Interpreter language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interpreter_language
      @interpreter_language = InterpreterLanguage.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interpreter_language_params
      params.require(:interpreter_language).permit(:interpreter_id, :dialect_id)
    end
end
