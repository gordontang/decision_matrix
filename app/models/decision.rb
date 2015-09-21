class Decision < ActiveRecord::Base
	has_many :alternatives, dependent: :destroy
	has_many :goals, dependent: :destroy
	has_many :scores, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }

	accepts_nested_attributes_for :alternatives,
		:reject_if => lambda { |a| a[:content].blank? },
		:allow_destroy => true
	accepts_nested_attributes_for :goals,
		:reject_if => lambda { |a| a[:content].blank? },
		:allow_destroy => true
	accepts_nested_attributes_for :scores,
		:reject_if => lambda { |a| a[:content].blank? },
		:allow_destroy => true

	# def alternative_attributes=(alternative_attributes)
	#   alternative_attributes.each do |attributes|
	#     alternatives.build(attributes)
	#   end
	# end
end
