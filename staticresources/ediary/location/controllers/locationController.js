/*
 * <!--
 *   ~ SHIRE CONFIDENTIAL - Highly Restricted: Do not distribute without prior approval
 *   ~
 *   ~ Copyright � 2017 Shire. All rights reserved.
 *   ~
 *   -->
 */
/**
 * @ngdoc controller
 * @name location.controller : locationController
 * @requires $scope
 * @description
 * locationController handles the tapping and saving the location on body image
 */
angular.module('locationModule')
    .controller('locationController', locationController);
locationController.$inject = ['$scope', '$state', 'locationConst', '$ionicGesture', '$document', 'toastr', 'dialogService', '$stateParams'];

function locationController($scope, $state, locationConst, $ionicGesture, $document, toastr, dialogService, $stateParams) {
    $scope.front = true;
    $scope.back = false;
    $scope.comments_front = "";
    $scope.comments_back = "";
    $scope.dirtyFlag = false;
    $scope.locationConst = locationConst;
    $scope.locationsObj = {};
    $scope.selected_part_front = [];
    $scope.selected_part_tap_front = [];
    $scope.selected_part_front.id = "test";
    $scope.selected_part_back = [];
    $scope.selected_part_tap_back = [];
    $scope.selected_part_back.id = "test";
    var flag_front = true;
    var flag_back = true;
    var index_back = 0;
    var index_front = 0;
    /**
     * @ngdoc function
     * @name frontImageClicked
     * @methodOf location.controller : locationController
     * @description
     * to mark the front image parts clicked by user
     */
    $scope.frontImageClicked = function() {
        if ($scope.front == false) {
            $scope.front = true;
            $scope.back = false;
        }
        if ($scope.selected_part_tap_front.length == 0) {
            $scope.comments_front = "";
        }
        if ($scope.selected_part_tap_back.length == 0) {
            $scope.comments_back = "";
        }

        if ($scope.selected_part_tap_back.length > 0) {
            for (var i = 0; i < $scope.selected_part_tap_back.length; i++) {
                angular.element(document.querySelector('#' + $scope.selected_part_tap_back[i].toString())).removeClass('fill-blue');
                angular.element(document.querySelector('#' + $scope.selected_part_tap_back[i].toString())).addClass('st1');
            }

        }

        if ($scope.selected_part_tap_front.length > 0) {
            for (var j = 0; j < $scope.selected_part_tap_front.length; j++) {

                angular.element(document.querySelector('#' + $scope.selected_part_tap_front[j].toString())).removeClass('st1');
                angular.element(document.querySelector('#' + $scope.selected_part_tap_front[j].toString())).addClass('fill-blue');

            }
        }

    }
    /**
     * @ngdoc function
     * @name backImageClicked
     * @methodOf location.controller : locationController
     * @description
     * to mark the back image parts clicked by user
     */
    $scope.backImageClicked = function() {

        if ($scope.back == false) {
            $scope.back = true;
            $scope.front = false;
        }
        if ($scope.selected_part_tap_front.length == 0) {
            $scope.comments_front = "";
        }
        if ($scope.selected_part_tap_back.length == 0) {
            $scope.comments_back = "";
        }

        if ($scope.selected_part_tap_front.length > 0) {
            for (var k = 0; k < $scope.selected_part_tap_front.length; k++) {

                angular.element(document.querySelector('#' + $scope.selected_part_tap_front[k].toString())).removeClass('fill-blue');
                angular.element(document.querySelector('#' + $scope.selected_part_tap_front[k].toString())).addClass('st1');

            }
        }
        if ($scope.selected_part_tap_back.length > 0) {
            for (var l = 0; l < $scope.selected_part_tap_back.length; l++) {

                angular.element(document.querySelector('#' + $scope.selected_part_tap_back[l].toString())).removeClass('st1');
                angular.element(document.querySelector('#' + $scope.selected_part_tap_back[l].toString())).addClass('fill-blue');


            }
        }

    }

    $scope.front = true;
    $scope.back = false;
    $scope.eventData = $stateParams.eventObj;;
    $scope.locationsObj = $scope.eventData.locations;
    $scope.comments_front = $scope.locationsObj.front.notes;
    $scope.comments_back = $scope.locationsObj.back.notes;
    if ($scope.selected_part_tap_front == undefined) {
        $scope.selected_part_tap_front = [];
    }
    if ($scope.selected_part_tap_back == undefined) {
        $scope.selected_part_tap_back = [];
    }
    for (var m = 0; m < $scope.locationsObj.front.ans.length; m++) {
        if ($scope.locationsObj.front.ans[m] === true) {
            $scope.selected_part_tap_front.push($scope.locationsObj.front.options[m].toString());
        }
    }
    if ($scope.selected_part_tap_front == undefined) {
        $scope.selected_part_tap_front = [];
    }
    for (var n = 0; n < $scope.locationsObj.back.ans.length; n++) {
        if ($scope.locationsObj.back.ans[n] === true) {
            $scope.selected_part_tap_back.push($scope.locationsObj.back.options[n].toString());
        }
    }
    if ($scope.selected_part_tap_back == undefined) {
        $scope.selected_part_tap_back = [];
    }
    $scope.frontImageClicked();

    var _partSelected = angular.element(document.querySelector('#Layer_1'));
    if ($scope.front) {
        if ($scope.selected_part_tap_front.length > 0) {
            for (var o = 0; o < $scope.selected_part_tap_front.length; o++) {
                angular.element(document.querySelector('#' + $scope.selected_part_tap_front[o].toString())).removeClass('st1');
                angular.element(document.querySelector('#' + $scope.selected_part_tap_front[o].toString())).addClass('fill-blue');
            }
        }

    }
    if ($scope.back) {
        if ($scope.selected_part_tap_back.length > 0) {
            for (var p = 0; p < $scope.selected_part_tap_back.length; p++) {
                angular.element(document.querySelector('#' + $scope.selected_part_tap_back[p].toString())).removeClass('st1');
                angular.element(document.querySelector('#' + $scope.selected_part_tap_back[p].toString())).addClass('fill-blue');
            }
        }

    }
    angular.copy($scope.selected_part_tap_front, $scope.ini_selected_part_tap_front);
    angular.copy($scope.selected_part_tap_back, $scope.ini_selected_part_tap_back);
    $ionicGesture.on('tap', function(e) {
        $scope.$apply(function() {
            $scope.dataChanged();
            if ($scope.selected_part_tap_front == undefined) {
                $scope.selected_part_tap_front = [];
            }
            if ($scope.selected_part_tap_back == undefined) {
                $scope.selected_part_tap_back = [];
            }
            if ($scope.front) {
                $scope.selected_part_front = e.target;
                for (var q = 0; q < $scope.selected_part_tap_front.length; q++) {
                    if ($scope.selected_part_tap_front[q] === $scope.selected_part_front.id) {
                        flag_front = false;
                        index_front = q;
                    }

                }

                if (flag_front == true) {

                    angular.element(document.querySelector('#' + $scope.selected_part_front.id.toString())).removeClass('st1');
                    angular.element(document.querySelector('#' + $scope.selected_part_front.id.toString())).addClass('fill-blue');
                    if ($scope.selected_part_front.id !== "Layer_1" && $scope.selected_part_front.id !== "right-leg1" && $scope.selected_part_front.id !== "body") {
                        $scope.selected_part_tap_front.push($scope.selected_part_front.id);
                    }


                } else {
                    angular.element(document.querySelector('#' + $scope.selected_part_front.id.toString())).removeClass('fill-blue');
                    angular.element(document.querySelector('#' + $scope.selected_part_front.id.toString())).addClass('st1');
                    $scope.selected_part_tap_front.splice(index_front, 1);
                    flag_front = true;
                }
                if ($scope.selected_part_tap_front.length == 0) {
                    $scope.comments_front = "";
                }
                if ($scope.selected_part_tap_back.length == 0) {
                    $scope.comments_back = "";
                }
            }
            if ($scope.back) {
                $scope.selected_part_back = e.target;
                for (var r = 0; r < $scope.selected_part_tap_back.length; r++) {
                    if ($scope.selected_part_tap_back[r] === $scope.selected_part_back.id) {
                        flag_back = false;
                        index_back = r;
                    }

                }

                if (flag_back == true) {

                    angular.element(document.querySelector('#' + $scope.selected_part_back.id.toString())).removeClass('st1');
                    angular.element(document.querySelector('#' + $scope.selected_part_back.id.toString())).addClass('fill-blue');
                    if ($scope.selected_part_back.id !== "Layer_1" && $scope.selected_part_back.id !== "right-leg1" && $scope.selected_part_back.id !== "body") {
                        $scope.selected_part_tap_back.push($scope.selected_part_back.id);
                    }


                } else {
                    angular.element(document.querySelector('#' + $scope.selected_part_back.id.toString())).removeClass('fill-blue');
                    angular.element(document.querySelector('#' + $scope.selected_part_back.id.toString())).addClass('st1');
                    $scope.selected_part_tap_back.splice(index_back, 1);
                    flag_back = true;
                }
                if ($scope.selected_part_tap_front.length == 0) {
                    $scope.comments_front = "";
                }
                if ($scope.selected_part_tap_back.length == 0) {
                    $scope.comments_back = "";
                }
            }
        })
    }, _partSelected);
    /**
     * @ngdoc function
     * @name saveLocation
     * @methodOf location.controller : locationController
     * @description
     * to save image parts clicked by user
     */
    $scope.saveLocation = function() {
        for (var s = 0; s < $scope.locationsObj.front.options.length; s++) {
            $scope.locationsObj.front.ans[s] = false;
        }
        for (var t = 0; t < $scope.locationsObj.back.options.length; t++) {
            $scope.locationsObj.back.ans[t] = false;
        }
        for (var u = 0; u < $scope.selected_part_tap_front.length; u++) {
            for (var v = 0; v < $scope.locationsObj.front.options.length; v++) {

                if ($scope.selected_part_tap_front[u] === $scope.locationsObj.front.options[v]) {
                    $scope.locationsObj.front.ans[v] = true;
                    break;
                }
            }

        }
        for (var w = 0; w < $scope.selected_part_tap_back.length; w++) {
            for (var x = 0; x < $scope.locationsObj.back.options.length; x++) {

                if ($scope.selected_part_tap_back[w] === $scope.locationsObj.back.options[x]) {
                    $scope.locationsObj.back.ans[x] = true;
                    break;
                }
            }

        }

        $scope.locationsObj.front.notes = $scope.comments_front;
        $scope.locationsObj.back.notes = $scope.comments_back;
        $scope.eventData.locations = $scope.locationsObj;
        toastr.success('<div><i class = "ion-checkmark-round"></i><span> SAVED!</span> ', {
            closeButton: false,
            iconClass: 'save-toast',
            allowHtml: true
        });
        $state.go("eDiaryLogNewEntry", {
            previousScreen: $stateParams.previousScreen,
            eventData: $scope.eventData,
            eventModifiedFlag: true,
            dateValue: $stateParams.dateValue,
            timeValue: $stateParams.timeValue
        });
    };
    /**
     * @ngdoc function
     * @name backToEntryScreen
     * @methodOf location.controller : locationController
     * @description
     * to naviate to ediary home
     */
    $scope.backToEntryScreen = function() {
       
        if ($scope.dirtyFlag) {
            var modalOptions = {
                type: 'dirtyCheck'

            };
            dialogService.init(modalOptions, $scope, function(button) {
                if (button == 'Cancel') {
                    $state.go("eDiaryLogNewEntry", {
                        previousScreen: $stateParams.previousScreen,
                        eventData: $scope.eventData,
                        eventModifiedFlag: $stateParams.eventModifiedFlag,
                        dateValue: $stateParams.dateValue,
                        timeValue: $stateParams.timeValue
                    });
                }
            });
        } else {
            $state.go("eDiaryLogNewEntry", {
                previousScreen: $stateParams.previousScreen,
                eventData: $scope.eventData,
                eventModifiedFlag: $stateParams.eventModifiedFlag,
                dateValue: $stateParams.dateValue,
                timeValue: $stateParams.timeValue
            });
        }



    }
    /**
     * @ngdoc function
     * @name dataChanged
     * @methodOf location.controller : locationController
     * @description
     * to check if data changed on this screen
     */
    $scope.dataChanged = function() {
        $scope.dirtyFlag = true;
     
    }
};
