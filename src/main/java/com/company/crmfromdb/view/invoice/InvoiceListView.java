package com.company.crmfromdb.view.invoice;

import com.company.crmfromdb.entity.Invoice;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.StandardListView;
import io.jmix.flowui.view.ViewController;
import io.jmix.flowui.view.ViewDescriptor;

@Route(value = "invoices", layout = MainView.class)
@ViewController(id = "crm_Invoice.list")
@ViewDescriptor(path = "invoice-list-view.xml")
public class InvoiceListView extends StandardListView<Invoice> {
}
