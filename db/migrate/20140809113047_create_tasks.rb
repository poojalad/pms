class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
    	t.integer "project_id"
      t.string :name
      t.timestamps
    end
    
    add_index("tasks","project_id")
  end
  
  def self.down
  	drop_table :tasks
  end
  
end
