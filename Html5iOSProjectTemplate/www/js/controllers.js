angular.module('starter.controllers', [])

.controller('NotificationsCtrl', function($scope) {
	$scope.scheduleNotifications = function() {
   		window.location="setNotifications";
  	}
  	$scope.cancelAllNotifications = function() {
  		window.location="cancelAllNotifications";
  	}
  	$scope.printNotifications = function() {
  		window.location="printNotificationsToConsole";
  	}
})
.controller('ChartsCtrl', function($scope,TestData){
	//http://gionkunz.github.io/chartist-js/
	var data = TestData.forCharts();
	var options = {
	  width: 300,
	  height: 200
	};
	new Chartist.Bar('.ct-chart', data, options);
})
.controller('HtmlContentCtrl', function($scope) {
    $scope.share = function() {
        window.location = "shareContent";
    }
});
