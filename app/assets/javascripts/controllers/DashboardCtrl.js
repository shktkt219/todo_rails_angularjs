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

    self.lists = self.getAllTodoLists();

    self.createList = function(list){
      TodoListService.createTodoList(list)
                     .then(function(resp){
                       var list = resp;
                       self.lists.push({
                         name: list.name,
                         todos: []
                       });
                       self.list.name = "";
                     }, function(errorResponse){
                       console.error('Error while creating list');
                     });
    };

    self.deleteList = function(id){
      TodoListService.deleteTodoList(id)
                     .then(function(resp) {
                       for(var i = 0; i < self.lists.length; i++ ){
                         if(self.lists[i].id === id)
                         self.lists.splice(i,1);
                       }
                      //  console.log("testing");
                     }, function(errorResponse){
                        console.error('Error while deleting list');
                     });
    };

    // self.submit = function(){
    //   self.createList(self.list);
    //   self.reset();
    // };

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
