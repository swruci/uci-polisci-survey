class Survey < ApplicationRecord
  has_many :questions, dependant: :destroy
end
