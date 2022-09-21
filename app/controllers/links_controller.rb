class LinksController < ApplicationController

  def index
    @links = Link.all
    render json: @links
  end

  def show
    @link = Link.find_by(slug: params[:slug])
    if @link
      @link.increment!( :count )
      redirect_to @link.url
    else
      render error: { error: 'Couldnt find that link'}, status:400
    end
  end

  def create
    @link = Link.find_by(url: params[:url])
    if @link

      render json: @link
    else

      @link = Link.new(link_params)

      if @link.save
        render json: @link
      else
        render error: { error: 'Something went wrong' }, status: 400
    end

    end
  end

  def healthy
    render status: 200
    render json: {
      error: "Healthy!",
      status: 200
    }, status: 200
  end

  private

  def link_params
    params.permit(:url)
  end
end
