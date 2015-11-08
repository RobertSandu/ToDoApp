// toDoApp.js
'use strict';



var toDoApp = angular.module('toDoApp',['ui.router']);

toDoApp.config(['$stateProvider','$urlRouterProvider',function($stateProvider, $urlRouterProvider){
	'use strict';
	
	$urlRouterProvider.otherwise('/task_aplicaties');

	$stateProvider.state('task_aplicaties',
		{
			resolve: {
				dateHomePage: function($http){
					return $http({method: 'GET', url: '/task_aplicaties.json'})
						.then(function(data){
							console.log(data);
							return data;
						});

				}
			},
			url: '/task_aplicaties',
			templateUrl: '/show.html',
			//controller: 'taskController'
			//template: "<h1>Functioneazaaaaaa!!!!</h1>",
			controller: "homePageCtrl"
		})
		.state('task_aplicaties.details',
		{
			url: '/details/:taskID',
			templateUrl: "/details.html",
			controller: "detailsPageCtrl"
		})
		.state('task_aplicaties.edit',
		{
			url: '/edit/:taskID',
			templateUrl: "/edit.html",
			controller: "editPageCtrl"
		})
		.state('about',
		{
			url: '/about'
		});

}]);
toDoApp.controller("homePageCtrl",["$scope","dateHomePage","$http",function($scope,dateHomePage,$http){
	
	$scope.taskuri = dateHomePage.data;
	console.log("in controller: " + typeof $scope.taskuri["0"]);
	$scope.taskNou = {

		title: "",
		description: "",
		completed: false,
		startDate: new Date(),
		endDate:  new Date()

	};
	$scope.taskNou.endDate.setDate($scope.taskNou.endDate.getDate() + 1);

	$scope.submitFormHome = function(){
		console.log("in functia de submit");
		var urlPOST = '/task_aplicaties.json';
		console.log(urlPOST);
		$http.defaults.headers.post["Content-Type"] = "application/json";
		var date = { task_aplicatie : $scope.taskNou };
		console.log(JSON.stringify(date));
		$http.post(urlPOST, JSON.stringify(date))
			.success(function(data){
				console.log("succes: "+data);
				$scope.taskuri.push(JSON.parse(JSON.stringify($scope.taskNou)));
				$scope.taskNou = {

					title: "",
					description: "",
					completed: false,
					startDate: new Date(),
					endDate:  new Date()

				};

			})
			.error(function(data){
				console.log("failure: "+data);
			});
	};


	$scope.taskDoneUndone = function(taskID){
		console.log("in task done undone: " + taskID);
		$scope.taskDone = _.find($scope.taskuri, function(elem){return elem.id == taskID;});
		$scope.taskDone.completed = ! $scope.taskDone.completed;


		var urlPOST = '/task_aplicaties/'+taskID+'.json';
		console.log(urlPOST);
		$http.defaults.headers.patch["Content-Type"] = "application/json";
		var date = { task_aplicatie : $scope.taskDone };
		console.log(JSON.stringify(date));
		$http.patch(urlPOST, JSON.stringify(date))
			.success(function(data){
				console.log("succes: "+data);
			})
			.error(function(data){
				console.log("failure: "+data);
			});

	}
}]);
toDoApp.controller("detailsPageCtrl",["$scope","dateHomePage","$stateParams",function($scope,dateHomePage,$stateParams){
	console.log($stateParams.taskID);
	

	$scope.TaskID = $stateParams.taskID;

	$scope.taskCurent = _.find($scope.taskuri, function(elem){return elem.id == $scope.TaskID;});
	
}]);

toDoApp.controller("editPageCtrl",["$scope","dateHomePage","$stateParams","$http",function($scope,dateHomePage,$stateParams,$http){
	console.log($stateParams.taskID);
	

	$scope.TaskID = $stateParams.taskID;


	var tsk = _.find($scope.taskuri, function(elem){return elem.id == $scope.TaskID;});
	
	if((typeof tsk.startDate)!="object"){
		tsk.startDate = tsk.startDate.substring(0,tsk.startDate.length-1);
		tsk.startDate = new Date(tsk.startDate);
	}

	if((typeof tsk.endDate)!="object"){
		tsk.endDate = tsk.endDate.substring(0,tsk.endDate.length-1);
		tsk.endDate = new Date(tsk.endDate);
	}
	
	$scope.taskCurent = tsk;

	$scope.submitFormEdit = function(){
		console.log("in functia de submit");
		var urlPOST = '/task_aplicaties/'+$scope.TaskID+'.json';
		console.log(urlPOST);
		$http.defaults.headers.patch["Content-Type"] = "application/json";
		var date = { task_aplicatie : $scope.taskCurent };
		console.log(JSON.stringify(date));
		$http.patch(urlPOST, JSON.stringify(date))
			.success(function(data){
				console.log("succes: "+data);
			})
			.error(function(data){
				console.log("failure: "+data);
			});
	};

	
}]);