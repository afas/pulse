class ParserController < ApplicationController
  # load_and_authorize_resource

  #  для получения контента через http
  #  require 'open-uri'
  # подключаем Nokogiri

  def entities
    Entity.import_local
    @entities = Entity.all
    render "entities/index"
  end

  def events
    Publication.import_local
    @publications = Publication.all
    render "publications/index"
  end


  def regions
    Region.import_local
    @regions = Region.all
    render "regions/index"
  end
end
