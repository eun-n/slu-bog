class MainController < ApplicationController
  def index
      @creatures = Creature.all
      @tags = Tag.all
  end

  def create
    creature = Creature.create(creature_params)
    redirect_to creatures_path creature

    tag = Tag.create(tag_params)
    redirect_to tags_path tag
  end

  def new
      @creature = Creature.new
      @tags = Tag.all
      @tag = Tag.new
  end

  def edit
    @creature = Creature.find params[:id]
    @tags = Tag.all
    @tag = Tag.find params[:id]
  end

  def show
    @creature = Creature.find params[:id]
    @tag = Tag.find params[:id]
    @creatures = @tag.creatures
  end

  def update
    c = Creature.find params[:id]
    c.update creature_params
    # update_tags(c)
    redirect_to creatures_path

    t = Tag.find params[:id]
    t.update tag_params
    redirect_to tags_path
  end

  def destroy
    Creature.find(params[:id]).delete
    redirect_to creatures_path

    Tag.find(params[:id]).delete
    redirect_to tags_path
  end

  private

  def creature_params
    params.require(:creature).permit(:description, :name, tag_ids: [])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  # def update_tags(creature)
  #   # get the list of all checkboxes from the form
  #   tags = params[:creature][:tags_ids]

  #   # reset all the tags the creature currently has
  #   creature.tags.clear

  #   # go through al lthe tags from the form
  #   tags.each do |id|
  #     # only re-add the tags where checkboxes were checked
  #     creature.tags << Tag.find(id) unless id.blank?
  #   end
  # end
end