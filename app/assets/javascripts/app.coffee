app = angular.module('todoApp', ['ui.bootstrap', 'ngResource', 'ui.router'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state('home',
     url: '/'
     redirectTo:  'dashboard'
    ).state('home.dashboard',
     url: 'dashboard'
     templateUrl: '/templates/dashboard.html'
     controller: 'DashboardCtrl'
    ).state('home.help',
      url: 'help'
      templateUrl: '/templates/help.html'
    ).state('home.settings',
      url: 'settings'
      templateUrl: '/templates/settings.html'
    ).state('todolist',
     url: '/todo_lists/:list_id'
     templateUrl: '/templates/todo_list.html'
     controller: 'TodoListCtrl')
  $urlRouterProvider.otherwise '/'

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
