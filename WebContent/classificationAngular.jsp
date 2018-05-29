<%@page import="com.ssn.worldcup.utils.JsonDataHolder"%>
<%@page import="java.io.FileWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ssn.core.ApplicationFactory"%>
<%@page import="com.ssn.core.utils.*"%>
<%@ page import="com.ssn.worldcup.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fasterxml.jackson.core.*"%>

<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<body>

<div ng-app="myApp" ng-controller="customersCtrl"> 

<table>
  <tr>
    <th ng-click="orderByMe('id')">Name</th>
    <th ng-click="orderByMe('name')">Country</th>
  </tr>
  <tr ng-repeat="x in data | orderBy:myOrderBy">
    <td>{{ x.id }}</td>
    <td>{{ x.name }}</td>
  </tr>
</table>

</div>

<script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
    $http.get("classificationJson.jsp")
    .then(function (response) {$scope.data = response.data.data;});
    
$scope.orderByMe = function(x) {
    $scope.myOrderBy = x;
  }
});
</script>

</body>
</html>