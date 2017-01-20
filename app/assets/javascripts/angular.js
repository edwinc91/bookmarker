var app = angular.module('BookmarkerApp', []);

app.controller('HeaderController', ['$http', function($http){
  var controller = this;
  $http.get('/session').success(function(data){

    controller.current_user = data.current_user;
  })
}]);

app.controller('BooksController', ['$http', function($http){

  var authenticity_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  var controller = this;


  this.BOOK_TYPES = [ 'Paperback', 'E-Book', 'Webnovel' ];
  this.newBookBookType = 'Paperback';

  this.getBooks = function(){

    $http.get('/books').success(function(data){
      controller.current_user_books = data.books;
    });
  }

  this.getBooks();


  this.createBook = function(){


    console.log(controller)
    console.log($scope.$$nextSibling.bookCtrl)
    console.log($scope.$parent)
    controller.current_user_books.push({
      book_type: this.newBookBookType,


    });

}]);
