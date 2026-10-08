package com.company.crmfromdb.view;

import com.company.crmfromdb.CrmFromDbApplication;
import com.company.crmfromdb.entity.Invoice;
import com.company.crmfromdb.view.invoice.InvoiceListView;
import io.jmix.flowui.ViewNavigators;
import io.jmix.flowui.component.grid.DataGrid;
import io.jmix.flowui.testassist.FlowuiTestAssistConfiguration;
import io.jmix.flowui.testassist.UiTest;
import io.jmix.flowui.testassist.UiTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * The Invoice list view opens and shows invoices with their client and status.
 */
@UiTest
@SpringBootTest(classes = {CrmFromDbApplication.class, FlowuiTestAssistConfiguration.class})
@ActiveProfiles("test")
public class InvoiceListViewUiTest {

    @Autowired
    ViewNavigators viewNavigators;

    @Test
    void test_invoiceListShowsInvoices() {
        viewNavigators.view(UiTestUtils.getCurrentView(), InvoiceListView.class).navigate();

        InvoiceListView view = UiTestUtils.getCurrentView();
        DataGrid<Invoice> grid = UiTestUtils.getComponent(view, "invoicesDataGrid");

        assertThat(grid.getItems().getItems())
                .isNotEmpty()
                .allSatisfy(invoice -> {
                    assertThat(invoice.getClient()).isNotNull();
                    assertThat(invoice.getStatus()).isNotNull();
                });
    }
}
