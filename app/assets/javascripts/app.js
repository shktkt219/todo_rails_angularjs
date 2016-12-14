app = angular.module('todoApp', [
  'ui.bootstrap',
  'ui.router',
  'ngMessages']);

// CSRF(Cross-site Request Forgery)token
app.config(function($httpProvider){
  var authToken;
  authToken = $("meta[name=\"csrf-token\"]")
  .attr("content");
  return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});


app.config(function($stateProvider, $urlRouterProvider, $locationProvider){
  $urlRouterProvider.otherwise('/home');

  $stateProvider

    .state('home',{
      url: '/home',
      templateUrl: '/templates/home.html'
    })

    .state('index', {
      url: '/index',
      templateUrl: '/templates/index.html'
    })

    .state('help', {
      url: '/help',
      templateUrl: '/templates/help.html'
    })

    .state('about', {
      url: '/about',
      templateUrl: '/templates/about.html'
    })

    .state('index.dashboard', {
      url: '/dashboard',
      templateUrl: '/templates/dashboard.html',
      controller: 'DashboardCtrl as ctrl'
    })

    .state('index.todolist', {
      url: '/todo_lists/:list_id',
      templateUrl: '/templates/todo_list.html',
      controller: 'TodoListCtrl as vm'
    })

   $locationProvider.html5Mode(true);
})


// AngularJS can work with turbolinks
$(document).on('page:load', function(){
  return $('[ng-app]').each(function(){
    var module;
    module = $(this).attr('ng-app');
    return angular.bootstrap(this, [module]);
  });
});
