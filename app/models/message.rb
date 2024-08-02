# frozen_string_literal: true

# message model for defining the relations, scopes and others.
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to room }

  delegate :is_private, to: :room, prefix: true, allow_nil: true
  delegate :username, to: :user, prefix: true, allow_nil: true
end
