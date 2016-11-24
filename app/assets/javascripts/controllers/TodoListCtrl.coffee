angular.module('todoApp').controller "TodoListCtrl", ($scope, TodoList, Todo) ->

  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    @todoService = new Todo(1, serverErrorHandler)

    $scope.list = @todoListService.find(1)

  $scope.addTodo = (todoDescription) ->
    todo = { 'description' : todoDescription, 'done' : false }
    $scope.list.todos.push(todo)
    $scope.todoDescription = ""

  $scope.deleteTodo = (todo) ->
    $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1)

  serverErrorHandler = ->
    alert("Server Error")
