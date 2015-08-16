class Goal < ActiveRecord::Base
  belongs_to :decision
  validates :decision_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :constraint, inclusion: [true, false]
  validates :rank, numericality: {only_integer: true,
  																greater_than_or_equal_to: 1},
  									allow_blank: true
  validates :weight, numericality: {greater_than_or_equal_to: 0,
  																	less_than_or_equal_to: 1},
  										allow_blank: true
end
