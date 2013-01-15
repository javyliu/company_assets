class CAssetsController < ApplicationController
  # GET /c_assets
  # GET /c_assets.json
  def index
    @c_assets = CAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @c_assets }
    end
  end

  # GET /c_assets/1
  # GET /c_assets/1.json
  def show
    @c_asset = CAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @c_asset }
    end
  end

  # GET /c_assets/new
  # GET /c_assets/new.json
  def new
    @c_asset = CAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @c_asset }
    end
  end

  # GET /c_assets/1/edit
  def edit
    @c_asset = CAsset.find(params[:id])
  end

  # POST /c_assets
  # POST /c_assets.json
  def create
    @c_asset = CAsset.new(params[:c_asset])

    respond_to do |format|
      if @c_asset.save
        format.html { redirect_to @c_asset, :notice => 'C asset was successfully created.' }
        format.json { render :json => @c_asset, :status => :created, :location => @c_asset }
      else
        format.html { render :action => "new" }
        format.json { render :json => @c_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /c_assets/1
  # PUT /c_assets/1.json
  def update
    @c_asset = CAsset.find(params[:id])

    respond_to do |format|
      if @c_asset.update_attributes(params[:c_asset])
        format.html { redirect_to @c_asset, :notice => 'C asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @c_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /c_assets/1
  # DELETE /c_assets/1.json
  def destroy
    @c_asset = CAsset.find(params[:id])
    @c_asset.destroy

    respond_to do |format|
      format.html { redirect_to c_assets_url }
      format.json { head :no_content }
    end
  end
end
