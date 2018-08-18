class Question < ApplicationRecord
  belongs_to :survey

  enum type: [:multiple_choice,:free_response,:game]
  validates :q_type, :inclusion => {:in => Question.types.keys}

  has_many :answers, dependent: :destroy
end
