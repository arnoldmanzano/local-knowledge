(function() {
  'use strict';

  angular
    .module('LocalKnowledgeApp')
    .controller('RequestController', ['LocationService', '$http', function(LocationService, $http) {

    var self = this;
    // var map = LocationService.map;

    self.master = {};

    self.update = function(request) {
      LocationService.centerMapOnAddress(request.location);
      LocationService.lookupCoords(request.location).then(function(coords) {
        request.lat = coords.lat;
        request.lng = coords.lng;
        self.master = angular.copy(request);
        self.postRequests(self.master);
      });
    };

    self.postRequests = function(data) {
      console.log(data);
      $http.post('/requests', data).success(function(data, status) {
        console.log('success');
      });
    };

  }]);

}());
