# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :require_login
  def create
    @message = current_user.messages.create!(msg_params)
  end

  private

  def require_login
    redirect_to '/signin' if current_user.blank?
  end

  def msg_params
    params.require(:message).permit(:content).tap do |msg_param|
      msg_param[:room_id] = params[:room_id]
    end
  end
end
