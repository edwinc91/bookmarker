var app = angular.module('BookmarkerApp', []);

app.controller('HeaderController', ['$http', function ($http) {
  var controller = this;
  this.editFormStatus = null;
  $http.get('/session').success(function (data) {
    //setting current user to data.current user because
    //data comes back like {current_user:{name:'test'}}
    controller.current_user = data.current_user;
  })
}]);

app.controller('BooksController', ['$http', function ($http) {
  var authenticity_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  var controller = this;
  console.log(this)
  console.log(controller)
  this.BOOK_TYPES = [ 'Paperback', 'E-Book', 'Webnovel' ];
  this.newBookBookType = 'Paperback';
  this.getBooks = function () {
    // get books for current User
    $http.get('/books').success(function (data) {
      controller.current_user_books = data.books;
    });
  }
  this.getBooks();

  // create a book
  this.createBook = function () {
    controller.current_user_books.push({
      name: this.newBookName,
      book_type: this.newBookBookType,
      website: this.newBookWebsite,
      volume: this.newBookVolume,
      chapter: this.newBookChapter,
      page: this.newBookPage,
      description: this.newBookDescription
    });

    //make a post to /books
    $http.post('/books', {
      authenticity_token: authenticity_token,
      book: {
        name: this.newBookName,
        book_type: this.newBookBookType,
        website: this.newBookWebsite,
        volume: this.newBookVolume,
        chapter: this.newBookChapter,
        page: this.newBookPage,
        description: this.newBookDescription
      }
    }).success(function (data) {
      controller.current_user_books.pop();
      controller.current_user_books.push(data.book);
      controller.getBooks();
    });
  }

  // edit a book
  this.showEditForm = function(bookId){
    this.editFormStatus = bookId;
  };

  this.editBook = function (book) {
  	for (var i=0; i < this.current_user_books.length; i ++) {
  		if (this.current_user_books[i].id === book.id) {
  			this.current_user_books[i].name = book.name;
        this.current_user_books[i].book_type = book.book_type;
        this.current_user_books[i].website = book.website;
        this.current_user_books[i].volume = book.volume;
        this.current_user_books[i].chapter = book.chapter;
        this.current_user_books[i].page = book.page;
        this.current_user_books[i].description = book.description;
  		}
  	}

  	$http.patch('/books/' + book.id, {
  		authenticity_token: authenticity_token,
      book: {
        name: book.name,
        book_type: book.book_type,
        website: book.website,
        volume: book.volume,
        chapter: book.chapter,
        page: book.page,
        description: book.description
      }
  	}).success(function(data){
  		console.log('book successfully edited');
  		this.showEditForm(null);
  	});
  };
}]);
