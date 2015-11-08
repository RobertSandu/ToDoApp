require 'test_helper'

class TaskAplicatiesControllerTest < ActionController::TestCase
  setup do
    @task_aplicaty = task_aplicaties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_aplicaties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_aplicaty" do
    assert_difference('TaskAplicatie.count') do
      post :create, task_aplicaty: { completed: @task_aplicaty.completed, description: @task_aplicaty.description, endDate: @task_aplicaty.endDate, startDate: @task_aplicaty.startDate, title: @task_aplicaty.title }
    end

    assert_redirected_to task_aplicaty_path(assigns(:task_aplicaty))
  end

  test "should show task_aplicaty" do
    get :show, id: @task_aplicaty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_aplicaty
    assert_response :success
  end

  test "should update task_aplicaty" do
    patch :update, id: @task_aplicaty, task_aplicaty: { completed: @task_aplicaty.completed, description: @task_aplicaty.description, endDate: @task_aplicaty.endDate, startDate: @task_aplicaty.startDate, title: @task_aplicaty.title }
    assert_redirected_to task_aplicaty_path(assigns(:task_aplicaty))
  end

  test "should destroy task_aplicaty" do
    assert_difference('TaskAplicatie.count', -1) do
      delete :destroy, id: @task_aplicaty
    end

    assert_redirected_to task_aplicaties_path
  end
end
