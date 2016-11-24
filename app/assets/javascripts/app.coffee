app = angular.module('todoApp', ['ui.bootstrap', 'ngResource', 'ngRoute'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/',                    redirectTo: '/dashboard'
  $routeProvider.when '/dashboard',           templateUrl: '/templates/dashboard.html', controller: 'DashboardCtrl'
  $routeProvider.when '/todo_lists/:list_id', templateUrl: '/templates/todo_list.html', controller: 'TodoListCtrl'

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
