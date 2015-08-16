class Alternative < ActiveRecord::Base
  belongs_to :decision
  validates :decision_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
