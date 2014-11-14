class ParserController < ApplicationController
  # load_and_authorize_resource

  #  для получения контента через http
  #  require 'open-uri'
  # подключаем Nokogiri

  # def entities
  #   Entity.import_local
  #   @entities = Entity.all
  #   render "entities/index"
  # end
  #
  # def events
  #   Publication.import_local
  #   @publications = Publication.all
  #   render "publications/index"
  # end
  #
  #
  # def regions
  #   Region.import_local
  #   @regions = Region.all
  #   render "regions/index"
  # end

  def import_all
    Entity.import
    Region.import
    Region.where("code in (37, 44, 76)").each do |region|
      region.public = true
      region.save
    end
    Publication.import

    render 'welcome/index'
  end
end
