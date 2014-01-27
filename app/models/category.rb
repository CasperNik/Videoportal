class Category < ActiveRecord::Base
  has_and_belongs_to_many :films, :class_name =>'::Refinery::Films::Film'
  attr_accessible :id, :name
end
