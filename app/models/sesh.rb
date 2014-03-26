class Sesh < ActiveRecord::Base
	belongs_to :user
	has_many :distractions, dependent: :destroy
	validates :name, presence: true
  
  def distractions_count
    self.distractions.size
  end
end
