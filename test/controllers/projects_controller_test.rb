require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  context "GET index" do
    setup do
      @project = Fabricate(:project)
      get :index
    end

    should respond_with(200)
    should render_template(:index)
    should "assign to projects" do
      assert_equal [@project], assigns(:projects)
    end
  end
end