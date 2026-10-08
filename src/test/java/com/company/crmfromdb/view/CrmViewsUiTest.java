package com.company.crmfromdb.view;

import com.company.crmfromdb.CrmFromDbApplication;
import com.company.crmfromdb.entity.Order;
import com.company.crmfromdb.view.category.CategoryListView;
import com.company.crmfromdb.view.categoryitem.CategoryItemListView;
import com.company.crmfromdb.view.client.ClientListView;
import com.company.crmfromdb.view.contact.ContactListView;
import com.company.crmfromdb.view.employee.EmployeeListView;
import com.company.crmfromdb.view.order.OrderDetailView;
import com.company.crmfromdb.view.order.OrderListView;
import com.company.crmfromdb.view.orderitem.OrderItemListView;
import io.jmix.flowui.ViewNavigators;
import io.jmix.flowui.component.ListDataComponent;
import io.jmix.flowui.component.grid.DataGrid;
import io.jmix.flowui.component.textfield.TypedTextField;
import io.jmix.flowui.data.grid.DataGridItems;
import io.jmix.flowui.kit.component.button.JmixButton;
import io.jmix.flowui.testassist.FlowuiTestAssistConfiguration;
import io.jmix.flowui.testassist.UiTest;
import io.jmix.flowui.testassist.UiTestUtils;
import io.jmix.flowui.view.View;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * List views over the mapped CRM tables open with rows from the dump; a detail view opens from its list.
 */
@UiTest
@SpringBootTest(classes = {CrmFromDbApplication.class, FlowuiTestAssistConfiguration.class})
@ActiveProfiles("test")
public class CrmViewsUiTest {

    @Autowired
    ViewNavigators viewNavigators;

    @Test
    void test_listViewsShowDumpRows() {
        assertGridHasRows(ClientListView.class, "clientsDataGrid");
        assertGridHasRows(ContactListView.class, "contactsDataGrid");
        assertGridHasRows(CategoryListView.class, "categoriesDataGrid");
        assertGridHasRows(CategoryItemListView.class, "categoryItemsDataGrid");
        assertGridHasRows(OrderListView.class, "ordersDataGrid");
        assertGridHasRows(OrderItemListView.class, "orderItemsDataGrid");
        assertGridHasRows(EmployeeListView.class, "employeesDataGrid");
    }

    @Test
    void test_orderDetailOpensFromList() {
        viewNavigators.view(UiTestUtils.getCurrentView(), OrderListView.class).navigate();
        OrderListView listView = UiTestUtils.getCurrentView();
        DataGrid<Order> grid = UiTestUtils.getComponent(listView, "ordersDataGrid");
        Order order = grid.getItems().getItems().iterator().next();
        grid.select(order);

        JmixButton editButton = UiTestUtils.getComponent(listView, "editButton");
        editButton.click();

        OrderDetailView detailView = UiTestUtils.getCurrentView();
        TypedTextField<String> numberField = UiTestUtils.getComponent(detailView, "numberField");
        assertThat(numberField.getValue()).isEqualTo(order.getNumber());
    }

    private void assertGridHasRows(Class<? extends View<?>> viewClass, String gridId) {
        viewNavigators.view(UiTestUtils.getCurrentView(), viewClass).navigate();
        View<?> view = UiTestUtils.getCurrentView();
        ListDataComponent<?> grid = UiTestUtils.getComponent(view, gridId); // dataGrid or treeDataGrid
        assertThat(((DataGridItems<?>) grid.getItems()).getItems()).as(gridId).isNotEmpty();
    }
}
