class RoomsController < ApplicationController
    before_action :require_login
    before_action :fetch_user_and_room_info, only: [:index, :show]
    before_action :set_room, only: :show

    def index
    end
    
    def create
        @room = Room.create(name: params.dig(:room, :name))
    end

    def show
        @message = Message.new
        @messages = @single_room.messages
        render "index"
    end
    
    private
    def require_login
        redirect_to '/signin' unless current_user.present?
    end

    def fetch_user_and_room_info
        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
        @room = Room.new
    end

    def set_room
        @single_room = Room.find(params.dig(:id))
    end
end
