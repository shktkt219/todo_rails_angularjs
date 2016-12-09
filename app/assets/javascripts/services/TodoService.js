'use strict';

angular
   .module('todoApp')
   .factory('TodoService', ['$http', '$q', function($http, $q){

     return {

       createTodo: function(todo){
         return $http.post('http://localhost:3000/api/todo_lists/', todo)
                     .then(function(response){
                       return response.data;
                     },
                     function(errorResponse){
                       console.error('Error while creating todo');
                       return $q.reject(errorResponse);
                     });
       },

       updateTodo: function(todo, id){
         return $http.put('http://localhost:3000/api/todo_lists/'+id, todo)
                     .then(function(response){
                       return response.data;
                     },
                     function(errorResponse){
                       console.error('Error while updating todo');
                       return $q.reject(errorResponse);
                     });
       },

       deleteTodo: function(id){
         return $http.delete('http://localhost:3000/api/todo_lists/'+id)
                     .then(function(response){
                       return response.data;
                     },
                     function(errorResponse){
                       console.error('Error while deleting todo');
                       return $q.reject(errorResponse);
                     });
       }
     }
}]);
