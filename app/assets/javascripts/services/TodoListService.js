'use strict';

// $q : A service that helps you run functions asynchronously,
// and use their return values (or exceptions) when they are done processing.

angular
  .module('todoApp')
  .factory('TodoListService', ['$http', '$q', function($http, $q){

    return {

      getAllTodoLists: function(){
        return $http.get('/api/todo_lists/')
                    .then(function(response){
                      return response.data;
                    },
                    function(errorResponse){
                      console.error('Error while getting lists');
                      return $q.reject(errorResponse);
                    });
      },

      findTodoList: function(id){
        return $http.get('/api/todo_lists/'+id)
                    .then(function(response){
                      return response.data;
                    },
                    function(errorResponse){
                      console.error('Error while finding list');
                      return $q.reject(errorResponse);
                    });
      },

      createTodoList: function(list){
        return $http.post('/api/todo_lists/', list)
                    .then(function(response){
                      return response.data;
                    },
                    function(errorResponse){
                      console.error('Error while creating list');
                      return $q.reject(errorResponse);
                    });
      },

      deleteTodoList: function(id){
        return $http.delete('/api/todo_lists/'+id)
                    .then(function(response){
                      return response.data;
                    },
                    function(errorResponse){
                      console.error('Error while deleting list');
                      return $q.reject(errorResponse);
                    });
      }
    };
  }]);
