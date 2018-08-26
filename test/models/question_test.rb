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

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
