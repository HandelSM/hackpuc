class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
