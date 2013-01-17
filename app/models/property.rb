class Property < ActiveRecord::Base
  default_scope order("id")
  attr_accessible :name, :style
  has_many :check_options
  has_many :category_properties
  validates_presence_of :name,:style
  #scope :used,includes(:category_properties).where(:category_properties => {:int_value => nil})

  Style = [["字符类型",0],["单选类型",1]]
end
