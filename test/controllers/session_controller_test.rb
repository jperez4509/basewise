require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  context "GET /new" do
    should "render the new template" do
      get :new
      assert_template :new
      assert_response :success
    end

  end

  context "POST /create" do
    setup do
      @user = Fabricate(:user)
    end

    context "when the user is not found" do
      should "render the new template" do
        post :create, {email: "foobar@foo.com"}
        assert_template :new
      end
    end

    context "when the user is found" do
      context "and the password is incorrect" do
        should "render the new template" do
          post :create, { email: @user.email, password: "foo" }
          assert_template :new
        end
      end

      context "and the password is correct" do
        should "log the user in and redirect to the projects page" do
          post :create, {email: @user.email, password: @user.password }
          assert_not_nil assigns(:current_user)
          assert_redirected_to projects_path
        end
      end
    end

  end

  context "DELETE /destroy" do

  end

end
