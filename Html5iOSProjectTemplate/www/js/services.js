angular.module('starter.services', [])

/**
 * A simple example service that returns some data.
 */
.factory('TestData', function() {
  var chartTestData = {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
      series: [
        [4, 2, 2.5, 0.5,3]
      ]
  };

  return {
    forCharts: function() {
      return chartTestData;
    },
  }
});
