require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  context "GET" do
    should "should get new" do
      get :new
      assert_response :success
      assert_not_nil assigns(:user)
    end
  end

  context "CREATE" do
    context "when user params are valid" do
      setup do
        @valid_params = {
          email: "jpereaz@gmail.com",
          first_name: "Joel",
          last_name: "Perez",
          password: "fooBar$1",
        }
      end

      should "do all the expected things" do
        post :create, { user: @valid_params }

        assert_equal 1, User.count
        assert_not_nil assigns(:current_user)
        assert_redirected_to projects_path
      end
    end

    context "when user params are invalid" do
      setup do
        @invalid_params = {
          email: "jo.com",
          first_name: "",
          last_name: "",
          password: "111111",
        }

        post :create, { user: @invalid_params }
      end



      should "not create a new user" do
        assert_equal 0, User.count
      end

      should "render the new template" do
        assert_template :new
      end

    end
  end
end
