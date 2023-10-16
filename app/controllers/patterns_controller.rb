class PatternsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @patterns = Pattern.all
  end

  def new
    @pattern = Pattern.new
  end

  def create
    @pattern = Pattern.new(image_params)
    if @pattern.save
      render json: { status: 'success' }, status: :created
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end

  private
  def image_params
    picture_data = decode_image(params[:pattern][:picture])
    params.require(:pattern).permit(:title).merge(user_id: '1', picture: picture_data)
  end

  # コードをデコード
  def decode_image(data)
    #return nil if data.nil?

    filename = "#{params[:pattern][:title]}.png"
    in_content_type = "image/png"
    decoded_data = data.sub(/^data:(.*?)\;base64,/, '')
    io = StringIO.new(Base64.decode64(decoded_data))
    {
      io: io,
      filename: filename,
      content_type: in_content_type
    }
  end
end
