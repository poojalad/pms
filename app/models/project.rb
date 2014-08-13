class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks
  has_many :users
  
  scope :sorted, order('projects.id ASC')
  scope :by_name, lambda{|name| where(["name like (?)","%#{name}%"])}
  
end
