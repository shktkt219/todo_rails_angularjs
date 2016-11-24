angular.module('todoApp').controller "TodoListCtrl", ($scope) ->

  $scope.init = ->
    $scope.list = {
      'name': 'House Chores',
      'todos': [
        { 'description' : 'Wash dishes' },
        { 'description' : 'Go shopping' }
      ]
    }
