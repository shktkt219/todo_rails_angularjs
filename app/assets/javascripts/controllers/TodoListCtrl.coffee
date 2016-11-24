angular.module('todoApp').controller "TodoListCtrl", ($scope) ->

  $scope.init = ->
    $scope.list = {
      'name': 'House Chores',
      'todos': [
        { 'description' : 'Wash dishes' },
        { 'description' : 'Go shopping' }
      ]
    }

  $scope.addTodo = (todoDescription) ->
    todo = { 'description' : todoDescription }
    $scope.list.todos.push(todo)
    $scope.todoDescription = ""

  $scope.deleteTodo = (todo) ->
    $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1)
