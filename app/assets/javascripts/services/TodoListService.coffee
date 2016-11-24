angular.module('todoApp').factory 'TodoList', ($resource, $http) ->
  class TodoList
    constructor: (errorHandler) ->
      @service = $resource('/api/todo_list/:id',
        { id: '@id' },
        { update: { method: 'PUT' }})
      @errorHandler = errorHandler

    find: (id, successHandler) ->
      @service.get(id: id, ((list)->
        successHandler?(list)
        list),
        @errorHandler)
