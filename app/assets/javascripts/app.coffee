app = angular.module('todoApp', ['ui.bootstrap', 'ui.router', 'ngMessages'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->

  $urlRouterProvider.otherwise('/home')

  $stateProvider.state('home',
     url: '/home'
     templateUrl: '/templates/home.html'
    ).state('index',
     url: '/index'
     templateUrl: '/templates/index.html'
    ).state('help',
      url: '/help'
      templateUrl: '/templates/help.html'
    ).state('about',
      url: '/about'
      templateUrl: '/templates/about.html'
    ).state('index.dashboard',
     url: '/dashboard'
     templateUrl: '/templates/dashboard.html'
     controller: 'DashboardCtrl as ctrl'
    ).state('index.todolist',
     url: '/todo_lists/:list_id'
     templateUrl: '/templates/todo_list.html'
     controller: 'TodoListCtrl')
  $locationProvider.html5Mode(true)


$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
