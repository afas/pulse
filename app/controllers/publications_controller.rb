class PublicationsController < ApplicationController

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /publications
  # GET /publications.json
  def user_publications
    @publications = Publication.where("publication_status <> ? and author_id < ?", 3, params[:id])
  end

  def user_drafts
    @publications = Publication.where("publication_status = ? and author_id = ?", 4, params[:id])
  end

  def user_ready
    @publications = Publication.where("publication_status = ? and author_id = ?", 5, params[:id])
  end

  def user_rejected
    @publications = Publication.where("publication_status = ? and author_id = ?", 3, params[:id])
  end

  def by_category
    @publications = Publication.all
  end

  def next_page
    get_and_show_posts
  end

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    # @publication_attachment = @publication.publication_attachments.all
    #@hash = Gmaps4rails.build_markers(@publication) do |publication, marker|
    #  marker.lat publication.latitude
    #  marker.lng publication.longitude
    #end
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @publication.title = t("activerecord.attributes.publication.title")
    @publication.subtitle = t("activerecord.attributes.publication.subtitle")
    @publication.body = t("activerecord.attributes.publication.body")
    @publication.comment = t("activerecord.attributes.publication.comment")
    @publication.publication_status = 4
    @publication_attachment = @publication.publication_attachments.build
    @publication_attachment = @publication.service_datums.build
  end

  # GET /publications/1/edit
  def edit
    @publication_attachment = @publication.publication_attachments.build
    @publication_attachment = @publication.service_datums.build
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        params[:publication_attachments]['image'].each do |i|
          @publication_attachment = @publication.publication_attachments.create!(:image => i, :publication_id => @publication.id)
        end unless params[:publication_attachments].nil?
        params[:service_datums]['image'].each do |i|
          @service_datum = @publication.service_datums.create!(:image => i, :publication_id => @publication.id)
        end unless params[:service_datums].nil?
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render action: 'show', status: :created, location: @publication }
      else
        format.html { render action: 'new' }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        params[:publication_attachments]['image'].each do |i|
          @publication_attachment = @publication.publication_attachments.create!(:image => i, :publication_id => @publication.id)
        end unless params[:publication_attachments].nil?
        params[:service_datums]['image'].each do |i|
          @service_datum = @publication.service_datums.create!(:image => i, :publication_id => @publication.id)
        end unless params[:service_datums].nil?
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url }
      format.json { head :no_content }
    end
  end

  private

  def get_and_show
    @posts = Post.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def set_publication
    @publication = Publication.includes(:publication_attachments).find(params[:id])
  end

  def publication_params
    # params.require(:publication).permit(:scale, :region, :address, :latitude, :longitude, :date_start, :date_end, :author_id, :publication_status, :date_publish, :date_archive, :publisher_id, :publication_type, :category, :title, :subtitle, :body, publication_attachments_attributes: [:id, :publication_id, :image, :title])
    params.require(:publication).permit(:region, :address, :latitude, :longitude, :date_start, :time_start, :author_id, :publication_status, :date_publish, :date_archive, :publisher_id, :publication_type, :category, :title, :subtitle, :body, :comment, publication_attachments_attributes: [:id, :publication_id, :image, :title], service_datums_attributes: [:id, :publication_id, :image, :title])
  end
end
