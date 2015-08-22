class Decision < ActiveRecord::Base
	has_many :alternatives, dependent: :destroy
	has_many :goals, dependent: :destroy
	has_many :scores, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }
end
