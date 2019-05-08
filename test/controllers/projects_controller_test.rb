require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { company_name: @project.company_name, date: @project.date, description: @project.description, facebook: @project.facebook, founders: @project.founders, homepage: @project.homepage, instagram: @project.instagram, linkedin: @project.linkedin, location: @project.location, twitter: @project.twitter } }, as: :json
    end

    assert_response 201
  end

  test "should show project" do
    get project_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { company_name: @project.company_name, date: @project.date, description: @project.description, facebook: @project.facebook, founders: @project.founders, homepage: @project.homepage, instagram: @project.instagram, linkedin: @project.linkedin, location: @project.location, twitter: @project.twitter } }, as: :json
    assert_response 200
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project), as: :json
    end

    assert_response 204
  end
end
