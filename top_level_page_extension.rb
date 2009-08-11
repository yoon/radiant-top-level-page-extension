class TopLevelPageExtension < Radiant::Extension
  version "0.2"
  description "This extension changes the top level page of a user from the home page to a page of the administrator's choosing."
  url "http://github.com/yoon/radiant-top-level-page-extension"
  
  def activate
    require_dependency 'application_controller'
    Admin::PagesController.send :include, TopLevelPage::PagesControllerExtensions
    Page.send :include, TopLevelPage::PageExtensions
    admin.user.edit.add :form, "edit_top_level_page", :before => "edit_notes"
  end
end