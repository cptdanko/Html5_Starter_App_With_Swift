angular.module('starter.controllers', [])

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
