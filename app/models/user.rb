class User < ApplicationRecord
	validates :account, presence: true
	validates :account, uniqueness: true

	has_many :articles
end
