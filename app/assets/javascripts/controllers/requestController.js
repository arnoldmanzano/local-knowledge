(function() {
  'use strict';

  angular
    .module('LocalKnowledgeApp')
    .controller('RequestController', ['LocationService', 'MarkersService',
    '$http', '$scope', '$filter', function(LocationService, MarkersService, $http, $scope, $filter) {

    var self = this;
    var isInfoOpen = false;
    var isMoreOptions = false;
    var clickedRequest = {};
    var requestUser = {};
    var endTime;
    var timeLimiter;
    var isMoreTimeOptions = false;

    self.master = {};

    self.update = function(request) {
      console.log(request);
      LocationService.centerMapOnAddress(request.location);
      LocationService.lookupCoords(request.location).then(function(coords) {
        request.lat = coords.lat;
        request.lng = coords.lng;
        self.master = angular.copy(request);
        self.postRequest(self.master);
        modal.modal('hide');
        MarkersService.placeCurrentRequestMarker(request);
      });
    };

    self.postRequest = function(data) {
      $http.post('/requests', data).success(function(data, status) {
        self.success = true;
      });
    };

    self.openClickedRequestInfo = function(requestData){
      self.isInfoOpen = true;
      self.clickedRequest = requestData.data.request;
      self.requestUser = requestData.data.user;
      $scope.$digest();
      LocationService.centerMapOnAddress(self.clickedRequest.location);
    };

    self.closeClickedRequestInfo = function(){
      self.isInfoOpen = false;
    };

    self.toggleUserInfo = function(){
      self.isUserInfoOpen = !self.isUserInfoOpen;
    };

    $scope.$on("requestMarkerClicked", function(event, data){
      self.openClickedRequestInfo(data);
    });

    self.calculateEndTime = function(requestDuration, requestStartTime){
      console.log(requestDuration);
      var endHours = requestStartTime.getHours() + requestDuration;
      var startMinutes = console.log(requestStartTime.getMinutes());
      var stringTime = String(endHours) + ":" + String(startMinutes);
      self.timeLimiter = 24 - requestStartTime.getHours();
      self.endTime = new Date(stringTime);
    };

    self.toggleMoreOptions = function(){
      self.isMoreOptions = !self.isMoreOptions;
    };

    self.toggleMoreTimeOptions = function(){
      self.isMoreTimeOptions = !self.isMoreTimeOptions;
    };

    self.outputUpdate = function(hours){
	     document.querySelector('#request_duration').value = hours;
     };

  }]);

}());
