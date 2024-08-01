class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit {broadcast_append_to self.room}

  delegate :is_private, to: :room, prefix: true, allow_nil: true
  delegate :username, to: :user, prefix: true, allow_nil: true
end
