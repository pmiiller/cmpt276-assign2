class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  # GET /trainers
  # GET /trainers.json
  def index
    @trainers = Trainer.all
    @trainers.each do |trainer|
      trainer.level = trainer.tokimons.size / 3
    end
  end

  # GET /trainers/1
  # GET /trainers/1.json
  def show
    @trainer.level = @trainer.tokimons.size / 3
  end

  # GET /trainers/new
  def new
    @trainer = Trainer.new
  end

  # GET /trainers/1/edit
  def edit
  end

  # POST /trainers
  # POST /trainers.json
  def create
    @trainer = Trainer.new(trainer_params)
    @trainer.level = 0

    if @trainer.tname.blank?
      respond_to do |format|
        @trainer.destroy
        flash.now[:notice] = "Please enter a Name."
        format.html { render :new }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        if @trainer.save
          format.html { redirect_to @trainer, notice: 'Trainer was successfully created.' }
          format.json { render :show, status: :created, location: @trainer }
        else
          format.html { render :new }
          format.json { render json: @trainer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /trainers/1
  # PATCH/PUT /trainers/1.json
  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.html { redirect_to @trainer, notice: 'Trainer was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainer }
      else
        format.html { render :edit }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainers/1
  # DELETE /trainers/1.json
  def destroy
    (0..@trainer.tokimons.size-1).each do |i|
      @trainer.tokimons[i].destroy
    end
    @trainer.destroy
    respond_to do |format|
      format.html { redirect_to trainers_url, notice: 'Trainer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainer_params
      params.require(:trainer).permit(:tname, :level)
    end
  end
