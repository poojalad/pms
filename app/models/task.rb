class Task < ActiveRecord::Base
  attr_accessible :project_id, :name
  
  belongs_to :project
  
  scope :sorted, order('tasks.id ASC')
  scope :by_name, lambda{|name| where(["name like (?)","%#{name}%"])}
end
