class Comment < ActiveRecord::Base

	acts_as_votable



	validates :content, presence: true, presence:{:message => "O comentário não pode ser vazio"}, length: { maximum: 255 }
end

