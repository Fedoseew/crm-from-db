package com.company.crmfromdb.view.orderitem;

import com.company.crmfromdb.entity.OrderItem;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "order-items/:id", layout = MainView.class)
@ViewController(id = "crm_OrderItem.detail")
@ViewDescriptor(path = "order-item-detail-view.xml")
@EditedEntityContainer("orderItemDc")
public class OrderItemDetailView extends StandardDetailView<OrderItem> {
}
