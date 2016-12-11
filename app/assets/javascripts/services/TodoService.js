'use strict';

angular
   .module('todoApp')
   .factory('TodoService', ['$http', '$q', function($http, $q){

     return {

       createTodo: function(listId, todo){
         return $http.post('/api/todo_lists/'+ listId + '/todos/', todo)
                     .then(function(response){
                       return response.data;
                     },
                     function(errorResponse){
                       console.error('Error while creating todo');
                       return $q.reject(errorResponse);
                     });
       },

       updateTodo: function(listId, todo, id){
         return $http.put('/api/todo_lists/'+ listId + '/todos/'+id, todo)
                     .then(function(response){
                       return response.data;
                     },
                     function(errorResponse){
                       console.error('Error while updating todo');
                       return $q.reject(errorResponse);
                     });
       },

       deleteTodo: function(listId, id){
         return $http.delete('/api/todo_lists/'+listId + '/todos/'+id)
                     .then(function(response){
                       return response.data;
                     },
                     function(errorResponse){
                       console.error('Error while deleting todo');
                       return $q.reject(errorResponse);
                     });
       }
     };
}]);
