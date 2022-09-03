class Link < ApplicationRecord
  validates_format_of :url, with: URI::regexp(%w(http https))
  validates :url, presence: true, uniqueness: true

  # before_action :method
end
