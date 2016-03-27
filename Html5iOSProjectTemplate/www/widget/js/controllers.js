angular.module('todayExtension.controllers', [])

.controller('ChartsCtrl', function($scope,TestData){
	//http://gionkunz.github.io/chartist-js/
	var data = TestData.forCharts();
	var options = {
	  width: 300,
	  height: 180
	};
	new Chartist.Bar('.ct-chart', data, options);
});
