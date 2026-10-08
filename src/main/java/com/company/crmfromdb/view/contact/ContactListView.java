package com.company.crmfromdb.view.contact;

import com.company.crmfromdb.entity.Contact;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "contacts", layout = MainView.class)
@ViewController(id = "crm_Contact.list")
@ViewDescriptor(path = "contact-list-view.xml")
@LookupComponent("contactsDataGrid")
@DialogMode(width = "64em")
public class ContactListView extends StandardListView<Contact> {
}
