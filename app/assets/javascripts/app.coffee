app = angular.module('todoApp', ['ui.bootstrap', 'ngResource', 'ui.router'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state('home',
     url: '/'
     templateUrl: 'views/templates/index.html'
    ).state('home.dashboard',
     url: 'dashboard'
     templateUrl: 'views/templates/dashboard.html'
     controller: 'DashboardCtrl'
    ).state('home.help',
      url: 'help'
      templateUrl: 'views/templates/help.html'
    ).state('home.settings',
      url: 'settings'
      templateUrl: 'views/templates/settings.html'
    ).state('todolist',
     url: '/todo_lists/:list_id'
     templateUrl: '/templates/todo_list.html'
     controller: 'TodoListCtrl')
  $urlRouterProvider.otherwise '/'

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
