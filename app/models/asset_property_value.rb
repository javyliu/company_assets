# == Schema Information
#
# Table name: asset_property_values
#
#  id          :integer          not null, primary key
#  property_id :integer
#  c_asset_id  :integer
#  str_value   :string(255)
#  int_value   :integer
#

class AssetPropertyValue < ActiveRecord::Base
  default_scope order("property_id")
  belongs_to :property
  belongs_to :c_asset
  belongs_to :option,:class_name => "CheckOption",:foreign_key => :int_value
  attr_accessor :check_options,:is_radio,:property_name
  attr_accessible :property_id,:c_asset_id,:int_value, :str_value,:check_options,:property_name,:is_radio

  def get_option_value
    self.option.tap{|x| logger.info("--------#{x.inspect}-----")}.item_name 
  end

 # def check_options
 #   @check_options || CheckOption.where(:property_id => self.property_id) 
 # end
 # def check_options=(value)
 #   @check_options = value
 # end

  #def is_radio
  #  @is_radio || self.property.style
  #end
  #def is_radio=(value)
  #  @is_radio = value
  #end

  def is_radio?
    self.is_radio == 1 
  end

  #def property_name
  #  @property_name || self.property.name
  #end
  #def property_name=(value)
  #  @property_name = value
  #end
end
