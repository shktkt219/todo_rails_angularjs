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
