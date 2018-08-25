class LinksController < ApplicationController
  before_action :set_link, only: [:show, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  def send_to_long_url
    @link = Link.find_by(short_url: params[:short_url])
    # make sure the link it in the db
    if @link
      # looks like it is so send user on his way
      redirect_to @link.main_url
    else
      # looks like there may be an issue
      respond_to do |format|
        format.html { redirect_to links_url, notice: 'That link was no good. Please check your info and try again.' }
        format.json { head :no_content }
      end
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    # lets go make that short url
    @link.gen_short_url

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:main_url, :short_url)
    end
end
