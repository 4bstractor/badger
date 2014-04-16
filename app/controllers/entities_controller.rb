class EntitiesController < ApplicationController
  def index
    if current_user.entities.count > 0
      @entities = current_user.entities.uniq

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @entities }
      end
    else
      redirect_to new_entity_path, :notice => "It looks like you don't have an entity yet! Take a second to create one"
    end
  end

  def show
    @entity = Entity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entity }
    end
  end

  def new
    @entity = Entity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entity }
    end
  end

  def edit
    @entity = Entity.find(params[:id])
  end

  def create
    @entity = Entity.new(params[:entity])

    respond_to do |format|
      if @entity.save
        # Add entity to user
        current_user.entities.push(@entity)
        format.html { redirect_to entities_path, notice: 'Entity was successfully created.' }
        format.json { render json: @entity, status: :created, location: @entity }
      else
        format.html { render action: "new" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @entity = Entity.find(params[:id])

    respond_to do |format|
      if @entity.update_attributes(params[:entity])
        format.html { redirect_to entities_path, notice: 'Entity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url }
      format.json { head :no_content }
    end
  end
end
