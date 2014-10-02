class WelcomeController < ApplicationController
  # load_and_authorize_resource

  #before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    @publications = Publication.where(:publication_status => 2)
  end
end
