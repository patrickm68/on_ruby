class Wish < ActiveRecord::Base

  has_friendly_id :name, :use_slug => true

  validates :name, :description, :user, :presence => true

  belongs_to :user

  has_many :votes, :dependent => :destroy

  scope :latest, limit(5).order('done, id DESC')

  def stars
    return 0.0 if votes.empty?
    (votes.sum(:count) / votes.count.to_f).round(1)
  end

  def already_voted?(user)
    votes.any?{|vote| vote.user == user}
  end

  def publish(wish_url)
    return true unless Rails.env.production?
    url = Bitly.new.shorten(wish_url).short_url
    Twitter.update(twitter_message(url))
  end

  def twitter_message(url)
    "Neuer Wunsch von @#{user.nickname} '#{name.truncate(50)}' #{url}"
  end

end
