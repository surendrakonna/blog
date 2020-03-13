class Article < ApplicationRecord
  enum state: [ :draft, :active, :archived ]

  belongs_to :author, class_name: 'User'

  validates :title, :description, presence: true
end
