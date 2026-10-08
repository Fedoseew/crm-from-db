package com.company.crmfromdb.view.order;

import com.company.crmfromdb.entity.Order;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "orders/:id", layout = MainView.class)
@ViewController(id = "crm_Order.detail")
@ViewDescriptor(path = "order-detail-view.xml")
@EditedEntityContainer("orderDc")
public class OrderDetailView extends StandardDetailView<Order> {
}
