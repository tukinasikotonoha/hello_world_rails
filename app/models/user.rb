class User < ApplicationRecord
	validates :account, presence: true
	validates :account, uniqueness: true

	has_many :articles
	has_one :user_detail
end
