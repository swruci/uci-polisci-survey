# == Schema Information
#
# Table name: surveys
#
#  id          :bigint(8)        not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  afterword   :text
#

class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :responses, class_name: "SurveyResponse", foreign_key: "survey_id", dependent: :destroy
end
