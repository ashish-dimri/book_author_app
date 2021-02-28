class Author < ApplicationRecord
	has_and_belongs_to_many :books
	validates :first_name, :last_name, :dob, presence: true
	attr_accessor :full_name

	def full_name
		self.first_name + " " + self.last_name
	end
end
