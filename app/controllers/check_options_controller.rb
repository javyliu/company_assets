class CheckOptionsController < ApplicationController
  # GET /check_options
  # GET /check_options.json
  def index
    @property = Property.find(params[:property_id])
    @check_options = CheckOption.where(:property_id => params[:property_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @check_options }
    end
  end

  # GET /check_options/1
  # GET /check_options/1.json
  def show
    @check_option = CheckOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @check_option }
    end
  end

  # GET /check_options/new
  # GET /check_options/new.json
  def new
    @check_option = CheckOption.new(:property_id => params[:property_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @check_option }
    end
  end

  # GET /check_options/1/edit
  def edit
    @check_option = CheckOption.find(params[:id])
  end

  # POST /check_options
  # POST /check_options.json
  def create
    @check_option = CheckOption.new(params[:check_option])

    respond_to do |format|
      if @check_option.save
        format.html { redirect_to check_options_path(:property_id => @check_option.property_id), :notice => 'Check option was successfully created.' }
        format.json { render :json => @check_option, :status => :created, :location => @check_option }
      else
        format.html { render :action => "new" }
        format.json { render :json => @check_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /check_options/1
  # PUT /check_options/1.json
  def update
    @check_option = CheckOption.find(params[:id])

    respond_to do |format|
      if @check_option.update_attributes(params[:check_option])
        format.html { redirect_to check_options_path(:property_id => @check_option), :notice => 'Check option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @check_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /check_options/1
  # DELETE /check_options/1.json
  def destroy
    @check_option = CheckOption.find(params[:id])
    @check_option.destroy

    respond_to do |format|
      format.html { redirect_to check_options_path(:property_id => @check_option.property_id) }
      format.json { head :no_content }
    end
  end
end
