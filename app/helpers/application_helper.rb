module ApplicationHelper
# 	Defines a helper for the links to login, register and logout intelligently
#    based on the user's session status
	def login_helper
		if current_user.is_a?(GuestUser) 
        	(link_to "Sign Up", new_user_registration_path) +
        	"<br>".html_safe +
			(link_to "Login", new_user_session_path)
			else
			link_to "Logout", destroy_user_session_path, method: :delete
        	end
        end
#   Defines a helper for the session welcome greeting which includes the source
#   of the user (which site they've come from) and tells them where they are in the application. 
    def source_helper(layout_name)
	    if session[:source]
		    greeting = "Thanks for visiting my #{layout_name} page from #{session[:source]}"
		    content_tag(:p, greeting, class: "source-greeting")
			end
		end
	end
