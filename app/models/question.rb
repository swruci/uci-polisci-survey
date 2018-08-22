# == Schema Information
#
# Table name: questions
#
#  id          :bigint(8)        not null, primary key
#  q_type      :text
#  description :text
#  survey_id   :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  settings    :json
#

class Question < ApplicationRecord
  belongs_to :survey

  enum type: [:multiple_choice,:free_response,:game]
  validates :q_type, :inclusion => {:in => Question.types.keys}

  has_many :answers, dependent: :destroy
end
