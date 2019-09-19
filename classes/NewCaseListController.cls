public class NewCaseListController {

    public List<Case> getNewCases() {
        list<Case> ne = new List<Case>();
        ne = [select id,CaseNumber from Case where status =:'New'];
        return ne;
    }

}