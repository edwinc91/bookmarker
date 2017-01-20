class Book < ActiveRecord::Base
  belongs_to :user

  TYPES = [
    'Paperback', 'E-book', 'Webnovel'
  ]

  validates :user, presence: true
  validates :name, presence: true
  validates :book_type, inclusion: { in: TYPES }
end

# Book::TYPES
