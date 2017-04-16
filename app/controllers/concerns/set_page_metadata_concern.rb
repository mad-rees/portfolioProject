module SetPageMetadataConcern
	extend ActiveSupport::Concern
	
	included do
		before_filter :set_metadata_defaults
		end
		
	def set_metadata_defaults
		@page_title = "My Portfolio Website"
		end
	end
