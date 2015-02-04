class PreviewGenerator

  attr_accessor :uri
  attr_accessor :type
  attr_accessor :code

  def initialize(uri)
    @uri = uri
  end

  def generate_preview()
    website = LinkThumbnailer.generate(uri)

    video = website.videos.find { |v| v.embedded_code.present? }
    if video then
      self.code = video.embedded_code
      self.type = :video
    else
      image = website.images.first
      if image then
        self.code = image.src
        self.type = :image
      else
        self.type = :none
      end
    end

  end

  def video?
    self.type == :video
  end

  def image?
    self.type == :image
  end

  def none?
    self.type == :none
  end

end
