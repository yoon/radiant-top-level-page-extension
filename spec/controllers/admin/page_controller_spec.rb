require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::PageController do

  it "should allow you to view the index" do
    pending
    get :index
    response.should be_success
    assigns(:homepage).should be_kind_of(Page)
  end

  it "should allow the index to render even with there are no pages" do
    pending
    Page.destroy_all
    get :index
    response.should be_success
    assigns(:homepage).should be_nil
  end

  it "should show the tree partialy expanded on the index" do
    pending
    get :index
    response.should be_success
    assert_rendered_nodes_where { |page| [nil, page_id(:home)].include?(page.parent_id) }
  end

end
