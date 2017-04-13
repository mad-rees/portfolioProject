class SitePortfoliosController < ApplicationController
	def index
		@portfolio_items = SitePortfolio.all
		end
	def new
		@portfolio_item = SitePortfolio.new
		3.times { @portfolio_item.technologies.build }
		end
		
	def create
	    @site_portfolio =  SitePortfolio.new(site_portfolio_params)
		    respond_to do |format|
			    if @site_portfolio.save
			        format.html { redirect_to site_portfolios_path, notice: 'Portfolio successfully created.' }
				    else
				    format.html { render :new }
				end
			end
		end
    def edit
	   	@portfolio_item = SitePortfolio.find(params[:id])
	   	end
	def update
		@portfolio_item = SitePortfolio.find(params[:id])
	    respond_to do |format|
		    if @portfolio_item.update(site_portfolio_params)
		        format.html { redirect_to site_portfolios_path, notice: 'Blog was successfully updated.' }
			    else
		        format.html { render :edit }
			    end
		    end
		end
	def show
		@portfolio_item = SitePortfolio.find(params[:id])
		end
	def destroy
		@portfolio_item = SitePortfolio.find(params[:id])
		@portfolio_item.destroy
			respond_to do |format|
				format.html { redirect_to site_portfolios_url, notice: 'Portolio item was successfully destroyed.' }
    		end
		end
	private 
	
	def site_portfolio_params
		params.require(:site_portfolio).permit(
		:title, 
		:subtitle, 
		:image,
		:body, 
		technologies_attributes: [:name])
		end
	end

