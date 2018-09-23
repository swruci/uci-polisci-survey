# == Schema Information
#
# Table name: pages
#
#  id         :bigint(8)        not null, primary key
#  survey_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pagenum    :integer
#

class Page < ApplicationRecord
  belongs_to :survey

  has_many :questions, dependent: :destroy
end
