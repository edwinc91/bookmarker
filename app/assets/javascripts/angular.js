var app = angular.module('BookmarkerApp', []);

app.controller('HeaderController', ['$http', function($http){
  var controller = this;
  $http.get('/session').success(function(data){
    //setting current user to data.current user because
    //data comes back like {current_user:{name:'test'}}
    controller.current_user = data.current_user;
  })
}]);

app.controller('BooksController', ['$http', function($http){
  var authenticity_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  var controller = this;
  this.BOOK_TYPES = [ 'Paperback', 'E-Book', 'Webnovel' ];
  this.newBookBookType = 'Paperback';
  this.getBooks = function(){
    // get books for current User
    $http.get('/books').success(function(data){
      controller.current_user_books = data.books;
    });
  }
  this.getBooks();

  // create a book
  this.createBook = function(){
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
    }).success(function(data){
      controller.current_user_books.pop();
      controller.current_user_books.push(data.book);
      controller.getBooks();
    });
  }
}]);
