module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "John Howard | Portfolio"
    @seo_keywords = "John Howard Portfolio"
  end
    
end