app = angular.module('todoApp', ['ui.bootstrap', 'ngResource', 'ui.router', 'ngMessages'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise('/home')

  $stateProvider.state('home',
     url: '/home'
     templateUrl: '/templates/home.html'
    ).state('index',
     url: '/'
     templateUrl: '/templates/index.html'
    ).state('index.dashboard',
     url: 'dashboard'
     templateUrl: '/templates/dashboard.html'
     controller: 'DashboardCtrl'
    ).state('index.help',
      url: 'help'
      templateUrl: '/templates/help.html'
    ).state('index.about',
      url: 'about'
      templateUrl: '/templates/about.html'
    ).state('index.todolist',
     url: 'todo_lists/:list_id'
     templateUrl: '/templates/todo_list.html'
     controller: 'TodoListCtrl')


$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
