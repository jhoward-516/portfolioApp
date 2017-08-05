class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
    @page_title = "My Portfolio Items"
  end
  
  def show
     @portfolio_item = Portfolio.find(params[:id])
     @page_title = Portfolio.find(params[:id]).title
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolio_path, notice: 'The record was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    
    @portfolio_item.destroy
    
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: "Portfolio item was removed." }
    end
  end
  
  private
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name])
    end
  
end
