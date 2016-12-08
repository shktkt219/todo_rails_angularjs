angular
   .module('todoApp')
   .factory('Todo', ['$http', '$q', function($http, $q){

     var STATE_URI = 'http://localhost:3000/api/todo_lists/:todo_list_id/todos/';

     var factory = {
       getAllTodos: getAllTodos,
       createTodo: createTodo,
       updateTodo: updateTodo,
       deleteTodos: deleteTodos
     };

     return factory

     function getAllTodos(todoListId){
       var deferred = $q.defer();
       var todo_list_id = todoListId
       $http.get(STATE_URI)
            .then(function(response){
              deferred.resolve(response.data);
            },
          function(errorResponse){
            console.error('Error while getting todos');
            deferred.reject(errorResponse);
          });
          return deferred.promise;
     }

     function createTodo(todo){
       var deferred = $q.defer();
       $http.post(STATE_URI, todo)
            .then(function(response){
              deferred.resolve(response.data);
            },
          function(errorResponse){
            console.error('Error while creating todo');
            deferred.reject(errorResponse);
          });
          return deferred.promise;
     }

     function updateTodo(todo, id){
       var deferred = $q.defer();
       $http.put(STATE_URI + id, todo)
            .then(function(response){
              deferred.response(response.data);
            },
            function(errorResponse){
              console.error('Error while updating todo');
              deferred.reject(errorResponse);
            });
            return deferred.promise;
     }

     function deleteTodos(id){
       var deferred = $q.defer();
       $http.delete(STATE_URI + id)
            .then(function(response){
              deferred.resolve(response.data);
            },
            function(errorResponse){
              console.error('Error while deleting todo');
            });
            return deferred.promise;
     }
}]);
