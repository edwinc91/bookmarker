class Book < ActiveRecord::Base

  BOOK_TYPES = [
    'Paperback', 'E-book', 'Webnovel'
  ]

  validates :user, presence: true
  validates :name, presence: true
  validates :book_type, inclusion: { in: BOOK_TYPES }

  belongs_to :reader, class_name: "User", foreign_key: :user_id
end

# Book::BOOK_TYPES
