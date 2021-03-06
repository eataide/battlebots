"use strict"

App = angular.module('App', ['ngRoute', 'ui.utils']).config([
  "$routeProvider"
  "$locationProvider"

  # define routes for different views here
  ($routeProvider) ->
    $routeProvider.when("/",
      templateUrl: "/partials/home.html"
      controller:  "BodyCtrl"
    ).when("/program/",
      templateUrl: "/partials/program.html"
      controller:  "ProgramCtrl"
    ).when("/simulate/",
      templateUrl: "/partials/simulate.html"
      controller:  "SimulateCtrl"
    ).otherwise(redirectTo: "/")
])

App.controller "BodyCtrl", ($rootScope, $scope, $http, $window, $location) ->
  # this controller applies to entire body
  return

App.run ($rootScope, $window, $http, $location, $anchorScroll) ->
  # this runs once when page loads
  return
