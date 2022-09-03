class LinksController < ApplicationController

  def index
    @links = Link.all
    render json: @links
  end

  def show
    @link = Link.find_by(slug: params[:slug])
    @link.increment!( :count )
    redirect_to @link.url
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link
    else
      render error: { error: 'Something went wrong' }, status: 400
    end
  end

  private

  def link_params
    params.permit(:url)
  end
end
