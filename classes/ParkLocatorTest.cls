@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        
        String country = 'India';
        String[] result = ParkLocator.Country(country);
        
        
        // Verify that a fake result is returned
        System.assertEquals(new List<String>{'Jurassic park part 1', 'Jurassic park part 2', 'Jurassic park part 3 the lost world'}, result); 
    }
}