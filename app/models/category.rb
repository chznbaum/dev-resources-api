class Category < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :resources, dependent: :nullify

  def self.by_name
    order('name ASC')
  end
end
