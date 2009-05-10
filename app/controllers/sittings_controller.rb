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

end
