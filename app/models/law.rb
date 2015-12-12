class Law < ActiveRecord::Base
	acts_as_votable

	validates :description, presence: true
end
