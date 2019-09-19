@isTest
private class DomTest {

    @isTest
    static void test() {

        String xml = ''
                + '<?xml version="1.0" encoding="UTF-8"?>'
                + '<BookTitle>'
                + '<Book Title="1st Book"> Book1</Book >'
                + '<Book Title="2nd Book"> Book2</Book >'
                + '</BookTitle>'
                ;

        // Parses XML
        Dom.Document doc = new DOM.Document();
        doc.load(xml);

        // Remove an element
        for (Dom.XmlNode child : doc.getRootElement().getChildren()) {
            if (child.getAttribute('Title', null) == '2nd Book') {
                child.getParent().removeChild(child);
            }
        }

        // Add an element
        Dom.XmlNode addition = doc.getRootElement().addChildElement('Book', null, null);
        addition.setAttribute('Title', '3rd Book');
        addition.addTextNode('3rd Book');

        System.assertEquals(
                '<?xml version="1.0" encoding="UTF-8"?><BookTitle><Book Title="1st Book"> Book1</Book><Book Title="3rd Book">3rd Book</Book></BookTitle>',
                doc.toXmlString()
                );
    }
}