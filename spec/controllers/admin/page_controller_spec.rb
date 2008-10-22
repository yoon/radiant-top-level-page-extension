require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::PageController do
  scenario :top_level_page_users, :pages

  integrate_views

  before :each do
    login_as :top_level_set
  end

  it "should allow you to view the index" do
    get :index
    response.should be_success
    assigns(:homepage).should be_kind_of(Page)
    assigns(:homepage).title.should == "Child"
  end

  it "should allow the index to render even with there are no pages" do
    Page.destroy_all
    get :index
    response.should be_success
    assigns(:homepage).should be_nil
  end

  it "should show the tree with Child, but not Home" do
    get :index
    response.should be_success
    response.should have_tag("tr#page-#{page_id(:child)}")
    response.should_not have_tag("tr#page-#{page_id(:home)}")
  end
end
