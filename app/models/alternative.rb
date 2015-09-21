class Alternative < ActiveRecord::Base
  belongs_to :decision
  has_many :scores, dependent: :destroy
  default_scope -> { order(created_at: :asc) }
  validates :decision_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  accepts_nested_attributes_for :scores, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
