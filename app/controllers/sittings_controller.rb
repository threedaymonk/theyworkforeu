class SittingsController < ApplicationController
  # GET /sittings
  # GET /sittings.xml
  def index
    @sittings = Sitting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sittings }
    end
  end

  # GET /sittings/1
  # GET /sittings/1.xml
  def show
    @sitting = Sitting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sitting }
    end
  end

  # GET /sittings/new
  # GET /sittings/new.xml
  def new
    @sitting = Sitting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sitting }
    end
  end

  # GET /sittings/1/edit
  def edit
    @sitting = Sitting.find(params[:id])
  end

  # POST /sittings
  # POST /sittings.xml
  def create
    @sitting = Sitting.new(params[:sitting])

    respond_to do |format|
      if @sitting.save
        flash[:notice] = 'Sitting was successfully created.'
        format.html { redirect_to(@sitting) }
        format.xml  { render :xml => @sitting, :status => :created, :location => @sitting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sitting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sittings/1
  # PUT /sittings/1.xml
  def update
    @sitting = Sitting.find(params[:id])

    respond_to do |format|
      if @sitting.update_attributes(params[:sitting])
        flash[:notice] = 'Sitting was successfully updated.'
        format.html { redirect_to(@sitting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sitting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sittings/1
  # DELETE /sittings/1.xml
  def destroy
    @sitting = Sitting.find(params[:id])
    @sitting.destroy

    respond_to do |format|
      format.html { redirect_to(sittings_url) }
      format.xml  { head :ok }
    end
  end
end
