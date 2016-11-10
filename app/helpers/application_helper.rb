module ApplicationHelper
	def bootstrap_class_for(flash_type)
		case flash_type
		when "success"
			return "alert-success"
		when "error"
			return "alert-danger"
		when "alert"
			return "alert-warning"
		when "notice"
			return "alert-info"
		else
			flash_type.to_s
		end
	end
end
