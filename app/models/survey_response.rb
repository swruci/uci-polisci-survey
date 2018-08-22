# == Schema Information
#
# Table name: survey_responses
#
#  id         :bigint(8)        not null, primary key
#  survey_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SurveyResponse < ApplicationRecord
  belongs_to :survey

  has_many :answers, dependent: :destroy
end
