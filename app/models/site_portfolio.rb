class SitePortfolio < ApplicationRecord
has_many :technologies
	validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
	accepts_nested_attributes_for :technologies, 
		reject_if: lambda { |attrs| attrs['name'].blank? }
		


	def self.angular
		where(subtitle: "AngularJS")
	end
	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
	
	after_initialize :set_defaults
		
		
	def set_defaults
		self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||=  "http://placehold.it/350x200"
	end
		
end