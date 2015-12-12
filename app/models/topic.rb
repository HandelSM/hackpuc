class Topic < ActiveRecord::Base
	
	has_and_belongs_to_many :laws

	acts_as_votable

	validates :name, presence: true, length: { maximum: 50 }
end
