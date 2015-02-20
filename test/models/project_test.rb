require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should "not allow a project without a title" do
    project = Fabricate.build(:project, title: nil)
    assert_not project.valid?
  end

  should "not allow a title of less than 5 characters" do
    project = Fabricate.build(:project, title: "foo")
    assert_not project.valid?
  end
end
