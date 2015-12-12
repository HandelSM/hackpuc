class Law < ActiveRecord::Base
	has_and_belongs_to_many :topics
	has_many :politicians

	acts_as_votable

	validates :description, presence: true
end