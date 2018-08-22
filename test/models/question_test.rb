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

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
