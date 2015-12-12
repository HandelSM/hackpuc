class Topic < ActiveRecord::Base
	
	has_many :laws

	acts_as_votable

	validates :name, presence: true, length: { maximum: 50 }
end
