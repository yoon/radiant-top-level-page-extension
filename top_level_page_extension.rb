# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class TopLevelPageExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/top_level_page"
  
  # define_routes do |map|
  #   map.connect 'admin/top_level_page/:action', :controller => 'admin/top_level_page'
  # end
  
  def activate
    # admin.tabs.add "Top Level Page", "/admin/top_level_page", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Top Level Page"
  end
  
end