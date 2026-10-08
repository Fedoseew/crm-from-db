package com.company.crmfromdb.entity;

import com.company.crmfromdb.test_support.AuthenticatedAsAdmin;
import io.jmix.core.DataManager;
import io.jmix.core.FetchPlan;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Entities mapped onto the existing CRM tables read the rows of db/crm.sql
 * (loaded into the crm_test database by db/docker-compose.yml).
 */
@SpringBootTest
@ExtendWith(AuthenticatedAsAdmin.class)
@ActiveProfiles("test")
public class MappedTablesTest {

    @Autowired
    DataManager dataManager;

    @Test
    void test_entitiesReadDumpRows() {
        assertThat(count("crm_Client")).isEqualTo(30);
        assertThat(count("crm_Contact")).isEqualTo(67);
        assertThat(count("crm_Category")).isEqualTo(10);
        assertThat(count("crm_CategoryItem")).isEqualTo(41);
        assertThat(count("crm_Order")).isEqualTo(187);
        assertThat(count("crm_OrderItem")).isEqualTo(1662);
        assertThat(count("crm_Invoice")).isEqualTo(142);
        assertThat(count("crm_Employee")).isEqualTo(5);
    }

    @Test
    void test_statusCodesMapToEnums() {
        assertThat(dataManager.load(Order.class).all().list())
                .allSatisfy(order -> assertThat(order.getStatus()).isNotNull());
        assertThat(dataManager.load(Invoice.class).all().list())
                .allSatisfy(invoice -> assertThat(invoice.getStatus()).isNotNull());
    }

    @Test
    void test_foreignKeysMapToManyToOne() {
        Client client = dataManager.load(Client.class)
                .query("e.accountManager is not null")
                .fetchPlan(fp -> fp.addFetchPlan(FetchPlan.BASE).add("accountManager", FetchPlan.BASE))
                .maxResults(1)
                .one();
        assertThat(client.getAccountManager().getUsername()).isNotBlank();
    }

    private long count(String entityName) {
        return dataManager.loadValue("select count(e) from " + entityName + " e", Long.class).one();
    }
}
