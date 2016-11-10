class ActivitiesController<ApplicationController
	def index
		@users=current_user.get_friends
		@users.push(current_user)
		@activities=PublicActivity::Activity.where(owner_id:@users).order('created_at DESC')
	end
end