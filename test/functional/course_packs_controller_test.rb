require 'test_helper'

class CoursePacksControllerTest < ActionController::TestCase
  setup do
    @course_pack = course_packs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_pack" do
    assert_difference('CoursePack.count') do
      post :create, course_pack: {  }
    end

    assert_redirected_to course_pack_path(assigns(:course_pack))
  end

  test "should show course_pack" do
    get :show, id: @course_pack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_pack
    assert_response :success
  end

  test "should update course_pack" do
    put :update, id: @course_pack, course_pack: {  }
    assert_redirected_to course_pack_path(assigns(:course_pack))
  end

  test "should destroy course_pack" do
    assert_difference('CoursePack.count', -1) do
      delete :destroy, id: @course_pack
    end

    assert_redirected_to course_packs_path
  end
end
