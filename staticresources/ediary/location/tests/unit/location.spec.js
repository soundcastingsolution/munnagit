/*
* <!--
*   ~ SHIRE CONFIDENTIAL - Highly Restricted: Do not distribute without prior approval
*   ~
*   ~ Copyright © 2017 Shire. All rights reserved.
*   ~
*   -->
*/
/**
 * @ngdoc overview
 * @name location
 * @description
 * This test is for location controller test.
 */
describe('Describe location controller', function() {

    beforeEach(module('onePathApp'));
    beforeEach(module('locationModule'));

    var $controller, scope, $rootScope, $state, state, homeService, ans, ionicGesture, $stateParams;

    beforeEach(inject(function(_$controller_, _$rootScope_, _$state_, _homeService_, _$ionicGesture_, _$stateParams_) {
        $controller = _$controller_;
        $rootScope = _$rootScope_;
        $state = _$state_;
        scope = $rootScope.$new();
        ionicGesture = _$ionicGesture_;
        $stateParams = _$stateParams_ 
        state = stateMocks();
        homeService = _homeService_;
         ans = {
            'locations':{
                        'front': {
                        'notes': {},
                        'ans': [],
                        'options': []
                    },
                'back': {
                    'notes': {},
                    'ans': [],
                    'options':[]
                },
                'options': ['abc','def']    
            }
        }
        $stateParams.eventObj = ans;
        spyOn(homeService, 'getViewData').and.returnValue(ans);
        spyOn(ionicGesture, 'on').and.returnValue('');
        scope.selected_part_tap_back = ['abc','defined'];
        scope.selected_part_tap_front = undefined;
        var controller = $controller('locationController', {
            $scope: scope,
            $rootScope: $rootScope,
            $state: state,
            homeService: homeService,
            $ionicGesture: ionicGesture,
            $stateParams: $stateParams
        });

    }));

    it("should have frontImageClicked defined",function(){
        
        scope.frontImageClicked();
        expect(scope.frontImageClicked).toBeDefined();
    })
    it("should have frontImageClicked with front false defined",function(){
       scope.front = false;
       scope.frontImageClicked();
        expect(scope.frontImageClicked).toBeDefined();
    })

    it("should have backImageClicked defined",function(){
        scope.backImageClicked();
        expect(scope.backImageClicked).toBeDefined();
    })
    
    it("should have saveLocation defined",function(){
        scope.saveLocation();
        expect(scope.saveLocation).toBeDefined();
    })

    it("should have backToEntryScreen defined",function(){
        scope.backToEntryScreen();
        expect(scope.backToEntryScreen).toBeDefined();
    })
});