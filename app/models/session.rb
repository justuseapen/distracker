class Session < ActiveRecord::Base
	belongs_to :user
	has_many :tallies
	validates :name, presence: true
end
