class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.all
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
  end

  # GET /battles/new
  def new
    @battle = Battle.new
  end

  # GET /battles/1/edit
  def edit
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)
    if @battle.tokimon1 == nil || @battle.tokimon2 == nil
      respond_to do |format|
        @battle.destroy
        flash.now[:notice] = "Please select two Tokimon."
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    else
      tok1 = Tokimon.find(@battle.tokimon1)
      tok2 = Tokimon.find(@battle.tokimon2)
      hp1 = tok1.weight + tok1.height
      hp2 = tok2.weight + tok2.height
      turn = 1
      attacker = tok1
      defender = tok2
      message = "#{tok1.name} HP: #{hp1}"
      message += "\n#{tok2.name} HP: #{hp2}"
      while hp1 > 0 && hp2 > 0
        roll = rand(0..5)
          if roll == 0
            if (defender.water > attacker.fire)
              message += "\n#{defender.name} blocked #{attacker.name}'s fire attack with it's high water ability."
            else
              message += "\n#{defender.name} was hit by #{attacker.name}'s fire attack."
              if attacker == tok1
                hp2 += -attacker.fire
              elsif attacker == tok2
                hp1 += -attacker.fire
              end
            end
          elsif roll == 1
            if (defender.electric > attacker.water)
              message += "\n#{defender.name} blocked #{attacker.name}'s water attack with it's high electric ability."
            else
              message += "\n#{defender.name} was hit by #{attacker.name}'s water attack."
              if attacker == tok1
                hp2 += -attacker.water
              elsif attacker == tok2
                hp1 += -attacker.water
              end
            end
          elsif roll == 2
            if (defender.fight > attacker.electric)
              message += "\n#{defender.name} blocked #{attacker.name}'s electric attack with it's high fight ability."
            else
              message += "\n#{defender.name} was hit by #{attacker.name}'s electric attack."
              if attacker == tok1
                hp2 += -attacker.electric
              elsif attacker == tok2
                hp1 += -attacker.electric
              end
            end
          elsif roll == 3
            if (defender.fly > attacker.fight)
              message += "\n#{defender.name} blocked #{attacker.name}'s fight attack with it's high fly ability."
            else
              message += "\n#{defender.name} was hit by #{attacker.name}'s fight attack."
              if attacker == tok1
                hp2 += -attacker.fight
              elsif attacker == tok2
                hp1 += -attacker.fight
              end
            end
          elsif roll == 4
            if (defender.ice > attacker.fly)
              message += "\n#{defender.name} blocked #{attacker.name}'s fly attack with it's high ice ability."
            else
              message += "\n#{defender.name} was hit by #{attacker.name}'s fly attack."
              if attacker == tok1
                hp2 += -attacker.fly
              elsif attacker == tok2
                hp1 += -attacker.fly
              end
            end
          elsif roll == 5
            if (defender.fire > attacker.ice)
              message += "\n#{defender.name} blocked #{attacker.name}'s ice attack with it's high fire ability."
            else
              message += "\n#{defender.name} was hit by #{attacker.name}'s ice attack."
              if attacker == tok1
                hp2 += -attacker.ice
              elsif attacker == tok2
                hp1 += -attacker.ice
              end
            end
          end
        if attacker == tok1
          attacker = tok2
          defender = tok1
        elsif attacker == tok2
          attacker = tok1
          defender = tok2
        end
        turn += 1
        if turn == 1000
          hp1 = 0
        end
        if hp1 <= 0
          @battle.winner = @battle.tokimon2
        else hp2 <= 0
          @battle.winner = @battle.tokimon1
        end
      end
      respond_to do |format|
        if @battle.save
          format.html { redirect_to @battle, notice: message }
          format.json { render :show, status: :created, location: @battle }
        else
          format.html { render :new }
          format.json { render json: @battle.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url, notice: 'Battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.require(:battle).permit(:tokimon1, :tokimon2, :winner)
    end
end
