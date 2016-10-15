class TokimonsController < ApplicationController
  before_action :set_tokimon, only: [:show, :edit, :update, :destroy]

  # GET /tokimons
  # GET /tokimons.json

  def index
    @tokimons = Tokimon.all
    @tokimons.each do |tokimon|
      tokimon.total = tokimon.fly + tokimon.fight + tokimon.fire + tokimon.water + tokimon.electric + tokimon.ice
    end

  end

  # GET /tokimons/1
  # GET /tokimons/1.json
  def show
    @tokimon.total = @tokimon.fly + @tokimon.fight + @tokimon.fire + @tokimon.water + @tokimon.electric + @tokimon.ice
  end

  # GET /tokimons/new
  def new
    @tokimon = Tokimon.new
  end

  # GET /tokimons/1/edit
  def edit
  end

  # POST /tokimons
  # POST /tokimons.json
  def create
    @tokimon = Tokimon.new(tokimon_params)
    if @tokimon.trainer_id == nil
      respond_to do |format|
        @tokimon.destroy
        flash.now[:notice] = "Select a Trainer (if no trainer exists, please make one first)."
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    elsif @tokimon.fly == nil || @tokimon.fight == nil || @tokimon.fire == nil || @tokimon.water == nil || @tokimon.electric == nil || @tokimon.ice == nil || @tokimon.height == nil || @tokimon.weight == nil
      respond_to do |format|
        @tokimon.destroy
        flash.now[:notice] = "Please fill out all fields."
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    elsif @tokimon.fly > 100 || @tokimon.fly < 0 || @tokimon.fight > 100 || @tokimon.fight < 0 || @tokimon.fire > 100 || @tokimon.fire < 0 || @tokimon.water > 100 || @tokimon.water < 0 || @tokimon.electric > 100 || @tokimon.electric < 0 || @tokimon.ice > 100 || @tokimon.ice < 0
      respond_to do |format|
        @tokimon.destroy
        flash.now[:notice] = "Fly, Fight, Fire, Water, Electric, and Ice must be between 0 and 100."
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    elsif @tokimon.height < 0 || @tokimon.weight < 0
        respond_to do |format|
          @tokimon.destroy
          flash.now[:notice] = "Height and Weight cannot be negative."
          format.html { render :new }
          format.json { render json: @tokimon.errors, status: :unprocessable_entity }
        end
    else
      @tokimon.trainer = Trainer.find(tokimon_params[:trainer_id])
      @tokimon.total = @tokimon.fly + @tokimon.fight + @tokimon.fire + @tokimon.water + @tokimon.electric + @tokimon.ice
      respond_to do |format|
        if @tokimon.save
          format.html { redirect_to @tokimon, notice: 'Tokimon was successfully created.' }
          format.json { render :show, status: :created, location: @tokimon }
        else
          format.html { render :new }
          format.json { render json: @tokimon.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /tokimons/1
  # PATCH/PUT /tokimons/1.json
  def update
    tempWeight = @tokimon.weight
    tempHeight = @tokimon.height
    tempFly = @tokimon.fly
    tempFight = @tokimon.fight
    tempFire = @tokimon.fire
    tempWater = @tokimon.water
    tempElectric = @tokimon.electric
    tempIce = @tokimon.ice
    tempTrainer = @tokimon.trainer_id


    @tokimon.update(tokimon_params)
    @tokimon.total = @tokimon.fly + @tokimon.fight + @tokimon.fire + @tokimon.water + @tokimon.electric + @tokimon.ice
    if @tokimon.trainer_id == nil
      @tokimon.weight = tempWeight
      @tokimon.height = tempHeight
      @tokimon.fly = tempFly
      @tokimon.fight = tempFight
      @tokimon.fire = tempFire
      @tokimon.water = tempWater
      @tokimon.electric = tempElectric
      @tokimon.ice = tempIce
      @tokimon.trainer_id = tempTrainer
      respond_to do |format|
        flash.now[:notice] = "Select a Trainer (if no trainer exists, please make one first)."
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    elsif @tokimon.fly == nil || @tokimon.fight == nil || @tokimon.fire == nil || @tokimon.water == nil || @tokimon.electric == nil || @tokimon.ice == nil || @tokimon.height == nil || @tokimon.weight == nil
      @tokimon.weight = tempWeight
      @tokimon.height = tempHeight
      @tokimon.fly = tempFly
      @tokimon.fight = tempFight
      @tokimon.fire = tempFire
      @tokimon.water = tempWater
      @tokimon.electric = tempElectric
      @tokimon.ice = tempIce
      @tokimon.trainer_id = tempTrainer
      respond_to do |format|
        flash.now[:notice] = "Please fill out all fields."
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    elsif @tokimon.fly > 100 || @tokimon.fly < 0 || @tokimon.fight > 100 || @tokimon.fight < 0 || @tokimon.fire > 100 || @tokimon.fire < 0 || @tokimon.water > 100 || @tokimon.water < 0 || @tokimon.electric > 100 || @tokimon.electric < 0 || @tokimon.ice > 100 || @tokimon.ice < 0
      @tokimon.weight = tempWeight
      @tokimon.height = tempHeight
      @tokimon.fly = tempFly
      @tokimon.fight = tempFight
      @tokimon.fire = tempFire
      @tokimon.water = tempWater
      @tokimon.electric = tempElectric
      @tokimon.ice = tempIce
      @tokimon.trainer_id = tempTrainer
      respond_to do |format|
        flash.now[:notice] = "Fly, Fight, Fire, Water, Electric, and Ice must be between 0 and 100."
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    elsif @tokimon.height < 0 || @tokimon.weight < 0
      @tokimon.weight = tempWeight
      @tokimon.height = tempHeight
      @tokimon.fly = tempFly
      @tokimon.fight = tempFight
      @tokimon.fire = tempFire
      @tokimon.water = tempWater
      @tokimon.electric = tempElectric
      @tokimon.ice = tempIce
      @tokimon.trainer_id = tempTrainer
      respond_to do |format|
          flash.now[:notice] = "Height and Weight cannot be negative."
          format.html { render :edit }
          format.json { render json: @tokimon.errors, status: :unprocessable_entity }
        end
    else
      respond_to do |format|
        if @tokimon.update(tokimon_params)
          format.html { redirect_to @tokimon, notice: 'Tokimon was successfully updated.' }
          format.json { render :show, status: :ok, location: @tokimon }
        else
          format.html { render :edit }
          format.json { render json: @tokimon.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /tokimons/1
  # DELETE /tokimons/1.json
  def destroy
    @tokimon.destroy
    respond_to do |format|
      format.html { redirect_to tokimons_url, notice: 'Tokimon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tokimon
      @tokimon = Tokimon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tokimon_params
      params.require(:tokimon).permit(:name, :weight, :height, :fly, :fight, :fire, :water, :electric, :ice, :total, :trainer_id)
    end
end
