class MessagesController < ApplicationController
     
    before_action :authenticate_user!
    
    def create
        if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
          @message = Message.create(message_params)
          redirect_to "/rooms/#{@message.room_id}"
        else
          redirect_back(fallback_location: root_path)
        end
    end
    
    private 
      def message_params
          params.require(:message).permit(:user_id, :room_id, :content).merge(user_id: current_user.id)
      end
end
