class SitePortfoliosController < ApplicationController
	def index
		@portfolio_items = SitePortfolio.all
		end
	def new
		@portfolio_item = SitePortfolio.new
		end
	def create
	    @site_portfolio =  SitePortfolio.new(params.require(:site_portfolio).permit(:title, :subtitle, :body))
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
		    if @portfolio_item.update(params.require(:site_portfolio).permit(:title, :subtitle, :body))
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
	end

