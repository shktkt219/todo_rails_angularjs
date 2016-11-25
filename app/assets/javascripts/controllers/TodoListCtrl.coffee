angular.module('todoApp').controller "TodoListCtrl", ($scope, $stateParams, TodoList, Todo) ->

  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    @todoService     = new Todo($stateParams.list_id, serverErrorHandler)

    $scope.list = @todoListService.find($stateParams.list_id, (res)-> $scope.totalTodos = res.totalTodos)

  $scope.addTodo = (todoDescription) ->
    todo = @todoService.create(description: todoDescription, done: false)
    $scope.list.todos.push(todo)
    $scope.todoDescription = ""

  $scope.deleteTodo = (todo) ->
    @todoService.delete(todo)
    $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1)

  $scope.toggleTodo = (todo) ->
    @todoService.update(todo, done: todo.done)

  serverErrorHandler = ->
    alert("Server Error")
