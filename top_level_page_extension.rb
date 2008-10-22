require_dependency 'application'
class TopLevelPageExtension < Radiant::Extension
  version "0.2"
  description "This extension changes the top level page of a user from the home page to a page of the administrator's choosing."
  url "git://github.com/yoon/radiant-top-level-page-extension.git"
  
  define_routes do |map|
    # # Admin Routes
    # map.with_options(:controller => 'admin/welcome') do |welcome|
    #   welcome.admin          'admin',                              :action => 'index'
    #   welcome.welcome        'admin/welcome',                      :action => 'index'
    # end
    # # Page Routes
    # map.with_options(:controller => 'admin/page') do |page|
    #   page.page_index        'admin/pages',                        :action => 'index'
    # end
    # # Users Routes
    # map.with_options(:controller => 'admin/user') do |user|
    #   user.user_edit         'admin/users/edit/:id',               :action => 'edit'
    #   user.user_new          'admin/users/new',                    :action => 'new'
    # end
  end  
  
  def activate
    Admin::PageController.class_eval do
      def index
        @homepage = current_user.page_id ? Page.find(user.page_id) : Page.find_by_parent_id(nil)
      end
    end
  end
  
  def deactivate
  end
end