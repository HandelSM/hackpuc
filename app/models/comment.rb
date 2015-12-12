class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :law

	acts_as_votable

	validates :content, presence: true, presence:{:message => "O comentário não pode ser vazio"}, length: { maximum: 255 }

	validates :user_id, presence: true

	validates :law_id, presence: true
end

