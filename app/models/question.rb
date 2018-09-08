# == Schema Information
#
# Table name: questions
#
#  id          :bigint(8)        not null, primary key
#  q_type      :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  settings    :json
#  page_id     :bigint(8)
#

class Question < ApplicationRecord
  belongs_to :page

  enum type: [:multiple_choice,:free_response,:button_group,:game,:video]
  validates :q_type, :inclusion => {:in => Question.types.keys}

  has_many :answers, dependent: :destroy
end
