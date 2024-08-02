# frozen_string_literal: true

# room controller for handling the room data.
class RoomsController < ApplicationController
  before_action :require_login
  before_action :fetch_user_and_room_info, only: %i[index show]
  before_action :set_room, only: :show

  def index; end

  def show
    @message = Message.new
    @messages = @single_room.messages
    render 'index'
  end

  def create
    @room = Room.create(name: params.dig(:room, :name))
  end

  private

  def require_login
    redirect_to '/signin' if current_user.blank?
  end

  def fetch_user_and_room_info
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
    @room = Room.new
  end

  def set_room
    @single_room = Room.find(params[:id])
  end
end
