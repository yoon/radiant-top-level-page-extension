module TopLevelPage::PagesControllerExtensions
  def self.included(base)
    base.class_eval {
      alias_method_chain :index, :top_level_page
    }
  end
  
  def index_with_top_level_page
    if current_user.attributes.has_key?('page_id')
      if (top_level_page = Page.find_by_id(current_user.page_id))
        @homepage = top_level_page
        response_for :plural
      else
        index_without_top_level_page
      end
    else
      index_without_top_level_page
    end
  end
end