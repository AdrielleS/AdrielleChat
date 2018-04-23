class Api::V1::ChatRoomsController < Api::V1::ApiController
	before_action :set_chat_room, only: [:show, :destroy]
	before_action :require_autorization!, only: [:show, :destroy]
	def index
		@chat_rooms = current_user.chat_rooms

		render json: @chat_rooms
		
	end

	def show
		@chat_room =ChatRoom.includes(:messages).find_by(id: params[:id])
		@message = Message.new
		render json: @chat_room
	end

	

	def create
		@chat_room = ChatRoom.new(chat_room_params.merge(user: current_user))
		if @chat_room.save
			render json: @chat_room, status: :created
		else
			render json: @chat_room.errors, status: :unprocessable_entity
		end
	end

	def delete
		@chat_room.destroy
		
	end


	private
	def chat_room_params
		params.require(:chat_room).permite(:title)
	end
	def set_chat_room
		@chat_room = Contact.find(params[:id])
		
	end
	def require_autorization!
		unless current_user == @chat_room.user
			render json: {}, status: :forbidden
			
		end
		
	end
end
