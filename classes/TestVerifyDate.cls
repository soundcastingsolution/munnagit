@isTest
public class TestVerifyDate {
    static testMethod void VerifyDateTest() {
        Date d1 = Date.newInstance(1960, 2, 17);
        Date d2 = Date.newInstance(1960, 2, 28);
        VerifyDate.CheckDates(d1,d2);
    }
    static testMethod void VerifyDateTest1() {
        Date d1 = Date.newInstance(1960, 2, 17);
        Date d2 = Date.newInstance(1960, 3, 28);
        VerifyDate.CheckDates(d1,d2);
    }
}