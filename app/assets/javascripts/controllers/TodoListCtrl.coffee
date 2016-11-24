angular.module('todoApp').controller "TodoListCtrl", ($scope) ->

  $scope.init = ->
    $scope.list = {
      'name': 'House Chores',
      'todos': [
        { 'description' : 'Wash dishes', 'done' : false },
        { 'description' : 'Go shopping', 'done' : false }
      ]
    }

  $scope.addTodo = (todoDescription) ->
    todo = { 'description' : todoDescription, 'done' : false }
    $scope.list.todos.push(todo)
    $scope.todoDescription = ""

  $scope.deleteTodo = (todo) ->
    $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1)
