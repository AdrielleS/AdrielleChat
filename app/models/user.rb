class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :chat_rooms, dependent: :destroy
    has_many :message, dependent: :destroy

    acts_as_token_authenticatable
end
