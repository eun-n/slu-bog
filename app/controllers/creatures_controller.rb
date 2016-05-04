class CreaturesController < ApplicationController
  def index
      @creatures = Creature.all
  end

  def create
    creature = Creature.create(creature_params)
    redirect_to creatures_path creature
  end

  def new
      @creature = Creature.new
  end

  def edit
    @creature = Creature.find params[:id]
  end

  def show
    @creature = Creature.find params[:id]
  end

  def update
    t = Creature.find params[:id]
    t.update creature_params
    redirect_to creatures_path
  end

  def destroy
    Creature.find(params[:id]).delete
    redirect_to creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:description, :name)
  end
end
