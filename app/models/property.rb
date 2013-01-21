# == Schema Information
#
# Table name: properties
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  style :integer
#

class Property < ActiveRecord::Base
  default_scope order("id")
  attr_accessible :name, :style,:width
  has_many :check_options
  has_many :category_properties
  validates_presence_of :name,:style
  #scope :used,includes(:category_properties).where(:category_properties => {:int_value => nil})

  Style = [["字符类型",0],["单选类型",1]]

  before_save :set_attrubute

  private

  def set_attrubute
    unless self.width.end_with?("%","px")
      self.width = self.width.scan(/\d+/)+"px"
    end 
  end
end
