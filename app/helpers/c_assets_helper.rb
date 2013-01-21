module CAssetsHelper
  def get_value(asset_property_value,property)
    if asset_property_value 
      if property.style == 1
        asset_property_value.get_option_value
      else
        simple_format asset_property_value.str_value
      end 
    end 
  end
end
