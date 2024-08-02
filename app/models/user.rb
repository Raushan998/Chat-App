# frozen_string_literal: true

# User model to handle relationship and others
class User < ApplicationRecord
  validates :username, uniqueness: true
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end
