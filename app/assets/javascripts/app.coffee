app = angular.module('todoApp', ['ui.bootstrap', 'ngResource', 'ui.router'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($stateProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $stateProvider.state('home',
     url: '/'
     templateUrl: '/templates/index.html'
    ).state('home.dashboard',
     url: '/dashboard'
     templateUrl: '/templates/dashboard.html'
     controller: 'DashboardCtrl'
    ).state('todolist',
     url: '/todo_lists/:list_id'
     templateUrl: '/templates/todo_list.html'
     controller: 'TodoListCtrl')

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
