angular
  .module('todoApp')
  .controller('TodoListCtrl', function($scope, $stateParams, TodoList, Todo){

    // getAllTodoLists();
    // getAllTodos();

    function getAllTodos(){
      Todo.getAllTodos()
              .then(function(data){
                $scope.lists = data;
              },
              function(errorResponse){
                console.error('Error while getting todos');
              });
    }

    return $scope.list = TodoList.find($stateParams.list_id, function(res){
      return $scope.totalTodos = res.totalTodos;
    });

    function addTodo(todoDescription){
      var todo;
      todo = Todo.createTodo({
        description: todoDescription,
        done: false
      });
      $scope.list.todos.push(todo);
      return $scope.todoDescription = "";
    };

    function deleteTodo(todo){
      Todo.deleteTodos(todo);
      return $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1);
    };

    function toggleTodo(todo){
      return Todo.updateTodo(todo, {
        done: todo.done
      });
    };

    $scope.filter = {
      done: { done: true },
      remaining: { done: false }
    };

    $scope.changeFilter = function(filter){
      return $scope.currentFilter = filter;
    };
  });
