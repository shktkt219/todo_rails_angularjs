'use strict';

angular
  .module('todoApp')
  .controller('TodoListCtrl', ['$scope', '$stateParams', 'TodoListService', 'TodoService', function($scope, $stateParams, TodoListService, TodoService){

    var self = this;
    var myListId = $stateParams.list_id;
    self.todo = { id: null, todo_list_id: myListId, description: '', done: false };

    self.getAllTodos = function(myListId){
      TodoListService.findTodoList(myListId)
                     .then(function(data){
                       self.list = data;
                     },
                     function(errorResponse){
                       console.error('Error while gatting todos');
                     });
    };

    self.createTodo = function(myListId, todo){
      TodoService.createTodo(myListId, todo)
                 .then(self.getAllTodos(myListId), function(errorResponse){
                   console.error('Error while creating todo');
                 });
    };

    self.updateTodo = function(myListId, todo, id){
      TodoService.updateTodo(myListId, todo, id)
                 .then(self.getAllTodos(myListId), function(errorResponse){
                   console.error('Error while updating todo');
                 });
    }

    self.deleteTodo = function(myListId, id){
      TodoService.deleteTodo(myListId, id)
                 .then(self.getAllTodos(myListId), function(errorResponse){
                   console.error('Error while deleting todo');
                 });
    }

    self.list = self.getAllTodos(myListId);

    self.addTodo = function(){
      self.createTodo(myListId, self.todo);
      self.reset();
    };

    self.reset = function(){
      self.todo = { id: null, todo_list_id: myListId, description: '', done: false };
    };

    self.removeTodo = function(id){
      self.deleteTodo(myListId, id);
    };

    self.toggleTodo = function(todo, id){
      self.updateTodo(myListId, self.todo.done = {
        done: todo.done
      }, id);
    };

    self.filter = {
      done: { done: true },
      remaining: { done: false }
    };

    self.changeFilter = function(filter){
      self.currentFilter = filter;
    };

  }]);
