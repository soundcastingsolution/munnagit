'use strict';
/**
 * @ngdoc directive
 * @name locationCardDirective
 * @restrict E
 * @description
 * display icon with text
 */
angular
.module('locationModule')
.directive('locationCard', [function(rootScope, $state) {
        return {
            restrict: 'AE',
            transclude: true,
            scope: false,
            templateUrl:'scripts/components/eDiary/location/templates/locationCardTemplate.html',
            controller: function($scope, $state) {   
               	/**
               		Not used yet
               	*/
                
            }
        }
    }
]);