angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope) {
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

.controller('FriendsCtrl', function($scope, Friends) {
  $scope.friends = Friends.all();
})

.controller('FriendDetailCtrl', function($scope, $stateParams, Friends) {
  $scope.friend = Friends.get($stateParams.friendId);
})

.controller('AccountCtrl', function($scope) {
});
