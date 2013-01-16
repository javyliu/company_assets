class Property < ActiveRecord::Base
  default_scope order("id")
  attr_accessible :name, :style
  has_many :check_options
  validates_presence_of :name,:style

  Style = [["字符类型",0],["选项类型",1]]
end
