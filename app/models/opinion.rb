class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :law

  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :law_id, presence: true
  validates :content, :length => {:maximum => 160}
end
