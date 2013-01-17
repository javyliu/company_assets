class UsersController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def edit
  end
  # PUT /data_centers/1
  # PUT /data_centers/1.json
  def update

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
