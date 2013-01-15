class CategoryPropertiesController < ApplicationController
  # GET /category_properties
  # GET /category_properties.json
  def index
    @category_properties = CategoryProperty.where(:asset_category_id => params[:asset_category_id])

    respond_to do |format|
      format.html # index.html.erb
      format.js 
      format.json { render :json => @category_properties }
    end
  end

  # GET /category_properties/1
  # GET /category_properties/1.json
  def show
    @category_property = CategoryProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @category_property }
    end
  end

  # GET /category_properties/new
  # GET /category_properties/new.json
  def new
    @asset_category = AssetCategory.find(params[:asset_category_id])
    @category_property = CategoryProperty.new(:asset_category_id => params[:asset_category_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @category_property }
    end
  end

  # GET /category_properties/1/edit
  def edit
    @category_property = CategoryProperty.find(params[:id])
  end

  # POST /category_properties
  # POST /category_properties.json
  def create
    @category_property = CategoryProperty.new(params[:category_property])

    respond_to do |format|
      if @category_property.save
        format.html { redirect_to @category_property, :notice => 'Category property was successfully created.' }
        format.json { render :json => @category_property, :status => :created, :location => @category_property }
      else
        format.html { render :action => "new" }
        format.json { render :json => @category_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /category_properties/1
  # PUT /category_properties/1.json
  def update
    @category_property = CategoryProperty.find(params[:id])

    respond_to do |format|
      if @category_property.update_attributes(params[:category_property])
        format.html { redirect_to @category_property, :notice => 'Category property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @category_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_properties/1
  # DELETE /category_properties/1.json
  def destroy
    @category_property = CategoryProperty.find(params[:id])
    @category_property.destroy

    respond_to do |format|
      format.html { redirect_to category_properties_url }
      format.json { head :no_content }
    end
  end
end
