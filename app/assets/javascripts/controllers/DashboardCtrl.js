'use strict';

angular
  .module('todoApp')
  .controller('DashboardCtrl', ['$scope', 'TodoListService', function($scope, TodoListService){
    var self = this;
    self.list = { id: null, name: ''};
    self.lists = [];

    self.getAllTodoLists = function(){
      TodoListService.getAllTodoLists()
                     .then(function(data){
                       self.lists = data;
                     },
                     function(errorResponse){
                       console.error('Error while getting all lists');
                     });
    };

    self.createList = function(list){
      TodoListService.createTodoList(list)
                     .then(self.getAllTodoLists, function(errorResponse){
                       console.error('Error while creating list');
                     });
    };

    self.deleteList = function(id){
      TodoListService.deleteTodoList(id)
                     .then(self.getAllTodoLists, function(errorResponse){
                        console.error('Error while deleting list');
                     });
    };

    self.getAllTodoLists();

    self.submit = function(){
      self.createList(self.list);
      self.lists.push(self.list);
      self.reset();
    };

    self.remove = function(id){
      alert('Delete List?');
      if(self.list.id === id){
          self.reset();
        }
        self.deleteList(id);
    };

    self.reset = function(){
      self.list = { id: null, name: ''};
    };
  }]);
