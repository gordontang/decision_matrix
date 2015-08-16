class Decision < ActiveRecord::Base
	has_many :alternatives, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }
end
