App = angular.module("App")

App.controller "ProgramCtrl", ($scope, $rootScope, $location, $http) ->
  
  # available commands
  $scope.commands = [
    "up",
    "down",
    "left",
    "right"
  ]
  
  
  # the program the user creates
  $scope.program = []
  
  # counter to keep track of IDs to assign commands
  i = 0
  
  
  # add a command to the program
  $scope.addCommand = (commandName) ->
    $scope.program.push({command: commandName, id: i})
    i += 1
  
  
  # remove command from program
  $scope.removeCommand = (id) ->
    for command, index in $scope.program
      if command.id is id
        $scope.program.splice(index, 1)


  # reset
  $scope.reset = ->
    $scope.program = []
    
    
  # submit and go to simulation page
  $scope.submit = ->
    $rootScope.program = $scope.program
    $location.path('/simulate')
