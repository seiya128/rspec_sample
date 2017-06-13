class User < ApplicationRecord
	validates :name,
		presence: true,
		uniqueness: true

	def self.get_new_user()
		return User.last
	end
end
