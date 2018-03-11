class Resource < ApplicationRecord
  validates_presence_of :name, :url
  validates :name, uniqueness: true
  validates :url, uniqueness: true

  belongs_to :category

  def self.by_recent
    order('created_at DESC')
  end
end
