require 'test_helper'

class PublicationsControllerTest < ActionController::TestCase
  setup do
    @publication = publications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publication" do
    assert_difference('Publication.count') do
      post :create, publication: { address: @publication.address, author_id: @publication.author_id, body: @publication.body, category: @publication.category, date_archive: @publication.date_archive, date_end: @publication.date_end, date_publish: @publication.date_publish, date_start: @publication.date_start, latitude: @publication.latitude, longitude: @publication.longitude, publisher_id: @publication.publisher_id, region: @publication.region, scale: @publication.scale, subtitle: @publication.subtitle, title: @publication.title, type: @publication.type }
    end

    assert_redirected_to publication_path(assigns(:publication))
  end

  test "should show publication" do
    get :show, id: @publication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publication
    assert_response :success
  end

  test "should update publication" do
    patch :update, id: @publication, publication: { address: @publication.address, author_id: @publication.author_id, body: @publication.body, category: @publication.category, date_archive: @publication.date_archive, date_end: @publication.date_end, date_publish: @publication.date_publish, date_start: @publication.date_start, latitude: @publication.latitude, longitude: @publication.longitude, publisher_id: @publication.publisher_id, region: @publication.region, scale: @publication.scale, subtitle: @publication.subtitle, title: @publication.title, type: @publication.type }
    assert_redirected_to publication_path(assigns(:publication))
  end

  test "should destroy publication" do
    assert_difference('Publication.count', -1) do
      delete :destroy, id: @publication
    end

    assert_redirected_to publications_path
  end
end
