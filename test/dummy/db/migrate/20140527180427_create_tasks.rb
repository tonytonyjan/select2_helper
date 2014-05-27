class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, index: true
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
