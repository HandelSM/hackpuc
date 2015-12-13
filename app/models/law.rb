class Law < ActiveRecord::Base
	acts_as_votable
	has_many :opinions, dependent: :destroy
	validates :description, presence: true
end
