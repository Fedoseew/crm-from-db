package com.company.crmfromdb.view.client;

import com.company.crmfromdb.entity.Client;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "clients/:id", layout = MainView.class)
@ViewController(id = "crm_Client.detail")
@ViewDescriptor(path = "client-detail-view.xml")
@EditedEntityContainer("clientDc")
public class ClientDetailView extends StandardDetailView<Client> {
}
