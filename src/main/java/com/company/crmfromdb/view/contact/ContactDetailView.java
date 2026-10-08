package com.company.crmfromdb.view.contact;

import com.company.crmfromdb.entity.Contact;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "contacts/:id", layout = MainView.class)
@ViewController(id = "crm_Contact.detail")
@ViewDescriptor(path = "contact-detail-view.xml")
@EditedEntityContainer("contactDc")
public class ContactDetailView extends StandardDetailView<Contact> {
}
