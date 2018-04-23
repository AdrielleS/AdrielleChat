Rails.application.routes.draw do
  devise_for :users
  
  namespace 'api' do
  	namespace 'v1' do
  		resources :chat_rooms
  		resources :message
  	end
  end
end
