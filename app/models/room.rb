# frozen_string_literal: true

# Room model to handle relationship and others
class Room < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit { broadcast_append_to 'rooms' }

  has_many :messages, dependent: :destroy
end
