class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_action :set_static_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = StaticPage.all
  end

  def show
  end

  def new
    @page = StaticPage.new
  end

  def edit
  end

  def create
    @page = StaticPage.new(static_page_params)
    if @page.save
      redirect_to static_page_path(@page.slug), notice: 'Page was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @page.update(static_page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to static_pages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_page
      @page = StaticPage.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def static_page_params
      static_page = params[:static_page]
      {title: static_page[:title], slug: static_page[:slug], menu_rank: static_page[:menu_rank]}
    end

end
