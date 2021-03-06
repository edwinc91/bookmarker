class Book < ActiveRecord::Base

  BOOK_TYPES = [
    'Paperback', 'Electronic Book', 'Webnovel'
  ]

  validates :reader, presence: true
  validates :name, presence: true
  validates :book_type, inclusion: { in: BOOK_TYPES }

  belongs_to :reader, class_name: "User", foreign_key: :user_id
end

# Book::BOOK_TYPES
