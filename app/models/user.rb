class User < ApplicationRecord

  has_many :searches
  has_many :genres, through: :searches
  has_many :events
  # validates_with EventsValidator
  # is there a way to limit events?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def all_genres
    self.genres.pluck(:genre).uniq
  end

  # why this no work, deleting stuff that it is not supposed to be deleting
  def delete_expired_events(genre)
    self.events.where(genre: genre).each do |event|
      self.sanitize_time(event)
      event.delete if event.expired?
    end
  end

  # change event.start time to 7pm or else it will get deleted because it will be considered 00:00 of the same day
  def sanitize_time(event)
    event.start = event.start.change({ hour: 22}) if event.start.hour == 0 && event.start.min == 0
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
    return user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end


end
