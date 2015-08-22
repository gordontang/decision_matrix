class Score < ActiveRecord::Base
  belongs_to :decision
  belongs_to :goal
  belongs_to :alternative
  validates :decision_id, presence: true
  validates :goal_id, presence: true
  validates :alternative_id, presence: true
  validates :rating, numericality: {only_integer: true,
  																greater_than_or_equal_to: -2,
  																less_than_or_equal_to: 2},
  									allow_blank: true
end
