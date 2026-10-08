package com.company.crmfromdb.view.orderitem;

import com.company.crmfromdb.entity.OrderItem;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "order-items", layout = MainView.class)
@ViewController(id = "crm_OrderItem.list")
@ViewDescriptor(path = "order-item-list-view.xml")
@LookupComponent("orderItemsDataGrid")
@DialogMode(width = "64em")
public class OrderItemListView extends StandardListView<OrderItem> {
}
