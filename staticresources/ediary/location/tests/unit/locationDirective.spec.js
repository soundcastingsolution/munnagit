describe('Describe location Directive', function() {
  var compile, scope, directiveElem;

  beforeEach(function(){
    module('locationModule');
  
    inject(function($compile, $rootScope,$httpBackend){
      compile = $compile;
      scope = $rootScope.$new();
      $httpBackend.when('GET', 'scripts/components/eDiary/location/templates/locationCardTemplate.html').respond('');
    });
  
    directiveElem = getCompiledElement();
  });

  function getCompiledElement(){
    var element = angular.element('<location-card></location-card>');
    var compiledElement = compile(element)(scope);
    scope.$digest();
    return compiledElement;
  }
  
  it('should applied template', function () {
    expect(directiveElem.html()).toEqual('');
  });
});