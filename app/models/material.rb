class Material < ActiveRecord::Base
  extend ApiHandling
  expose_api :id, :name, :url, :event_id, :user_id

  validates :name, :url, :event, presence: true

  belongs_to :user
  belongs_to :event

  scope :naked, -> { where("preview_type IS NULL AND preview_code is NULL") }

  default_scope -> { joins(:event).where("events.label" => Whitelabel[:label_id]).readonly(false) }

  def generate_preview
    generator = PreviewGenerator.new(self.url)
    generator.generate_preview
    self.preview_type = generator.type
    self.preview_code = generator.code
    save
  end

end
