module UsersHelper
	def friend_buttons(user)
		case current_user.friend_status(user)
		when "not friends"
			link_to "Add Friend",friendships_path(user_id:user.id),method: :post
		when "friends"
			link_to "Remove Friend",friendship_path(current_user.friend_relation(user),:notice=>"Friend Removed"),method: :delete
		when "pending"
			link_to "Cancel Request",friendship_path(current_user.friend_relation(user),:notice=>"Request Cancelled"),method: :delete
		when "requested"
			accept = link_to "Accept",accept_friendship_path(current_user.friend_relation(user)),method: :put
			deny = link_to "Deny",friendship_path(current_user.friend_relation(user),:notice=>"Request Denied"),method: :delete
			return accept + "||" + deny
		end
	end
end
