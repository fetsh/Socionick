class StypesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /stypes
  # GET /stypes.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stypes }
    end
  end

  # GET /stypes/1
  # GET /stypes/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stype }
    end
  end

  # GET /stypes/new
  # GET /stypes/new.xml
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stype }
    end
  end

  # GET /stypes/1/edit
  def edit
  end

  # POST /stypes
  # POST /stypes.xml
  def create

    respond_to do |format|
      if @stype.save
        format.html { redirect_to(@stype, :notice => 'Stype was successfully created.') }
        format.xml  { render :xml => @stype, :status => :created, :location => @stype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stypes/1
  # PUT /stypes/1.xml
  def update

    respond_to do |format|
      if @stype.update_attributes(params[:stype])
        format.html { redirect_to(@stype, :notice => 'Stype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stypes/1
  # DELETE /stypes/1.xml
  def destroy
    @stype.destroy

    respond_to do |format|
      format.html { redirect_to(stypes_url) }
      format.xml  { head :ok }
    end
  end
end
