class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_api

  api_accessible :ios_v1 do |template|
    template.add :id
    template.add :name
    template.add :description
    template.add :date
    template.add :location_id
    template.add :user_id
    template.add :participants
    template.add :topics
    template.add :materials
  end

  belongs_to :location
  belongs_to :user

  has_many :participants
  has_many :users, through: :participants
  has_many :topics
  has_many :materials

  validates :location, :user, :name, :description, :date, presence: true
  validates :name, uniqueness: {scope: :label}

  accepts_nested_attributes_for :materials
  accepts_nested_attributes_for :topics

  default_scope -> { where(label: Whitelabel[:label_id]) }

  scope :with_topics, -> { joins(:topics).uniq }
  scope :current, -> { where(date: Date.today.to_time..(Time.now + 8.weeks)).limit(1).order('date ASC') }
  scope :latest, -> { where('date < ?', Date.today.to_time).order('date DESC') }
  scope :unpublished, -> { where(published: nil) }
  scope :ordered, -> { order("date DESC") }

  def end_date
    date + 2.hours
  end

  def publish_mailinglist(event_url)
    if Rails.env.production?
      UsergroupMailer.invitation_mail(self).deliver!
    else
      logger.warn "publishing in test-modus with url #{event_url}"
    end
    self.published = true
    self.save!
  end

  class << self
    def duplicate!
      latest  = Event.last
      date    = Whitelabel[:next_event_date]
      Event.new.tap do |it|
        it.name         = "#{I18n.tw('name')} - #{I18n.l date, locale: :de, format: :month}"
        it.date         = date
        it.user         = latest.user
        it.location     = latest.location
        it.description  = latest.description
        it.save!
      end
    end
  end
end
