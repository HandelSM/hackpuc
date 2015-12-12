class LawsTopics < ActiveRecord::Migration
  def change
  	create_table :laws_topics do |t|
      t.integer :law_id
      t.integer :topic_id
    end
  end
end
