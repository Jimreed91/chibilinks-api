class Link < ApplicationRecord
  validates_format_of :url, with: URI::regexp(%w(http https))
  validates :url, presence: true, uniqueness: true
  validates :slug, uniqueness: true
  before_validation :create_slug


  def create_slug
    self.slug = SecureRandom.uuid[0...4] if slug.nil?
  end

  def to_param
    slug
  end

  # def format_link
  #   if self.link[0]
  # end
end
