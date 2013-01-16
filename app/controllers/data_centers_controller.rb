class DataCentersController < ApplicationController
  # GET /data_centers
  # GET /data_centers.json
  def index
    @data_centers = DataCenter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @data_centers }
    end
  end

  # GET /data_centers/1
  # GET /data_centers/1.json
  def show
    @data_center = DataCenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @data_center }
    end
  end

  # GET /data_centers/new
  # GET /data_centers/new.json
  def new
    @data_center = DataCenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @data_center }
    end
  end

  # GET /data_centers/1/edit
  def edit
    @data_center = DataCenter.find(params[:id])
  end

  # POST /data_centers
  # POST /data_centers.json
  def create
    @data_center = DataCenter.new(params[:data_center])

    respond_to do |format|
      if @data_center.save
        format.html { redirect_to data_centers_path, :notice => 'Data center was successfully created.' }
        format.json { render :json => @data_center, :status => :created, :location => @data_center }
      else
        format.html { render :action => "new" }
        format.json { render :json => @data_center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data_centers/1
  # PUT /data_centers/1.json
  def update
    @data_center = DataCenter.find(params[:id])

    respond_to do |format|
      if @data_center.update_attributes(params[:data_center])
        format.html { redirect_to data_centers_path, :notice => 'Data center was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @data_center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_centers/1
  # DELETE /data_centers/1.json
  def destroy
    @data_center = DataCenter.find(params[:id])
    @data_center.destroy

    respond_to do |format|
      format.html { redirect_to data_centers_url }
      format.json { head :no_content }
    end
  end
end
