class Session < ActiveRecord::Base
	belongs_to :user
	has_many :distractions, dependent: :destroy
	validates :name, presence: true
end
