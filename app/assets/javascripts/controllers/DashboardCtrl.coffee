angular.module('todoApp').controller "DashboardCtrl", ($scope, TodoList) ->

  $scope.init = ->
    @listsService = new TodoList(serverErrorHandler)
    $scope.lists = @listsService.all()

  $scope.createList = (listName) ->
    list = @listsService.create(name: listName)
    $scope.lists.push(list)
    $scope.listName = ""

  $scope.deleteList = (list, index) ->
    if confirm "Delete the List?"
      @listsService.delete(list)
      $scope.lists.splice(index, 1)

  serverErrorHandler = ->
    alert("Server Error")
