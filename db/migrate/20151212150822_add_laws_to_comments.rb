class AddLawsToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :law, index: true, foreign_key: true
  end
end
