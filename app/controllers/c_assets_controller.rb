class CAssetsController < ApplicationController
  # GET /c_assets
  # GET /c_assets.json
  def index
      @asset_categories = AssetCategory.order.all
      @asset_category = params[:asset_category_id].present? ? @asset_categories.detect{|item| item.id == params[:asset_category_id].to_i} : @asset_categories.first
      redirect_to asset_categories_path,:notice => "请先添加产品类别" and return if @asset_categories.blank?
      @c_assets = CAsset.where(:asset_category_id => @asset_category.id).paginate(:page => params[:page],:per_page => 1).includes(:asset_property_values=>:option)
      @properties = @asset_category.properties 
    respond_to do |format|
      format.html # index.html.erb
      format.js
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
    @asset_categories = AssetCategory.order
    @c_asset = CAsset.new(:asset_category_id => params[:asset_category_id] || @asset_categories.first.id) 

    authorize! :new, @c_asset
    properties = @c_asset.asset_category.properties.includes(:check_options)
    properties.each do |item|
      @c_asset.asset_property_values.build(:property_id => item.id,:check_options => item.check_options,:property_name => item.name,:is_radio => item.style )
    end

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render :json => @c_asset }
    end
  end

  # GET /c_assets/1/edit
  def edit
    @c_asset = CAsset.find(params[:id])
    authorize! :edit, @c_asset
    properties = @c_asset.asset_category.properties.includes(:check_options)
    property_ids = properties.map{|item| item.id}
    @asset_property_values = @c_asset.asset_property_values
    old_property_ids = @asset_property_values.map{|item| item.property_id}
    new_property_ids = property_ids - old_property_ids

    #set the check_options etc

    properties.each do |item|
      if item.id.in?(new_property_ids)
        @c_asset.asset_property_values.build(:property_id => item.id,:check_options => item.check_options,:property_name => item.name,:is_radio => item.style )
      else 
        @c_asset.asset_property_values.detect do |em|
          if em.property_id == item.id
            em.check_options = item.check_options
            em.property_name = item.name
            em.is_radio = item.style 
          end 
        end
      end
    end
  end

  # POST /c_assets
  # POST /c_assets.json
  def create
    @c_asset = CAsset.new(params[:c_asset])

    authorize! :create, @c_asset
    respond_to do |format|
      if @c_asset.save
        format.html { redirect_to c_assets_path, :notice => 'C asset was successfully created.' }
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

    authorize! :update, @c_asset
    respond_to do |format|
      if @c_asset.update_attributes(params[:c_asset].merge(:last_update_user => current_user.email))
        format.html { redirect_to c_assets_path, :notice => 'C asset was successfully updated.' }
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
    authorize! :destroy, @c_asset
    @c_asset.destroy

    respond_to do |format|
      format.html { redirect_to c_assets_url }
      format.json { head :no_content }
    end
  end
end
