class ChatRoom < ApplicationRecord
  belongs_to :user
   has_many :message, dependent: :destroy
end
end
