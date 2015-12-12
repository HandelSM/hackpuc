class AddPoliticianIdToLaws < ActiveRecord::Migration
  def change
  	add_column :laws, :politician_id, :integer
  end
end
