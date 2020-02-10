class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :status
      t.references :assignment

      t.timestamps
    end
  end
end
