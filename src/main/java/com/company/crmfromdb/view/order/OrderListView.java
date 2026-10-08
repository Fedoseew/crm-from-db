package com.company.crmfromdb.view.order;

import com.company.crmfromdb.entity.Order;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "orders", layout = MainView.class)
@ViewController(id = "crm_Order.list")
@ViewDescriptor(path = "order-list-view.xml")
@LookupComponent("ordersDataGrid")
@DialogMode(width = "64em")
public class OrderListView extends StandardListView<Order> {
}
