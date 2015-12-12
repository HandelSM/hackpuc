class AddTopicIdToLaws < ActiveRecord::Migration
  def change
  	add_column :laws, :topic_id, :integer
  end
end
