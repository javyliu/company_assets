class AssetCategoriesController < ApplicationController
  # GET /asset_categories
  # GET /asset_categories.json
  def index
    @asset_categories = AssetCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @asset_categories }
    end
  end

  # GET /asset_categories/1
  # GET /asset_categories/1.json
  def show
    @asset_category = AssetCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @asset_category }
    end
  end

  # GET /asset_categories/new
  # GET /asset_categories/new.json
  def new
    @asset_category = AssetCategory.new
    @properties = Property.all
    @ids = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @asset_category }
    end
  end

  # GET /asset_categories/1/edit
  def edit
    @properties = Property.all 
    @asset_category = AssetCategory.find(params[:id])
    @ids = @asset_category.category_properties.pluck(:property_id)
    logger.info(@ids.inspect)
  end

  # POST /asset_categories
  # POST /asset_categories.json
  def create
    @asset_category = AssetCategory.new(params[:asset_category])

    respond_to do |format|
      if @asset_category.save
        if params[:category_property_ids].length > 0 
          params[:category_property_ids].each do |item|
            @asset_category.category_properties << CategoryProperty.new(:property_id => item) 
          end
        end
        format.html { redirect_to asset_categories_path, :notice => 'Asset category was successfully created.' }
        format.json { render :json => @asset_category, :status => :created, :location => @asset_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @asset_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_categories/1
  # PUT /asset_categories/1.json
  def update
    @asset_category = AssetCategory.find(params[:id])

    respond_to do |format|
      if @asset_category.update_attributes(params[:asset_category])
        ids = @asset_category.category_properties.pluck(:property_id)
        new_ids = params[:category_property_ids].map{|item|item.to_i}
        (new_ids - ids).each do |item| 
            @asset_category.category_properties << CategoryProperty.new(:property_id => item) 
        end
        CategoryProperty.delete_all(:asset_category_id => @asset_category.id,:property_id => (ids - new_ids)) if (ids-new_ids).present?

        format.html { redirect_to asset_categories_path, :notice => 'Asset category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @asset_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_categories/1
  # DELETE /asset_categories/1.json
  def destroy
    @asset_category = AssetCategory.find(params[:id])
    @asset_category.destroy

    respond_to do |format|
      format.html { redirect_to asset_categories_url }
      format.json { head :no_content }
    end
  end
end
