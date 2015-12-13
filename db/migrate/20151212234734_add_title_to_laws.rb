class AddTitleToLaws < ActiveRecord::Migration
  def change
    add_column :laws, :title, :string
  end
end
