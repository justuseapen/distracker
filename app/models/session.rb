class Session < ActiveRecord::Base
	belongs_to :user
	has_many :distractions
	validates :name, presence: true
end
