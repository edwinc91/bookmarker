json.reader current_user.name

json.books(@books) do |book|
  json.id book.id
  json.name book.name
  json.book_type book.book_type
  json.website book.website
  json.volume book.volume
  json.chapter book.chapter
  json.page book.page
  json.description book.description
  json.authored_at time_ago_in_words(book.created_at) + " ago"
end
