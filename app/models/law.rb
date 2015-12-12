class Law < ActiveRecord::Base
	has_and_belongs_to_many :topics
	has_many :politicians
	has_many :comments

	accepts_nested_attributes_for :topics, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :politicians, :reject_if => :all_blank, :allow_destroy => true

	acts_as_votable

	validates :description, presence: true
end
