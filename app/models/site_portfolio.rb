class SitePortfolio < ApplicationRecord
	validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
	
	def self.angular
		where(subtitle: "AngularJS")
	end
		
end
