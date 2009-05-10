class ContributionsController < ApplicationController
  # GET /contributions
  # GET /contributions.xml
  def index
    @contributions = Contribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributions }
    end
  end

  # GET /contributions/1
  # GET /contributions/1.xml
  def show
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contribution }
    end
  end

end
