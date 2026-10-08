package com.company.crmfromdb.security;

import com.company.crmfromdb.entity.Client;
import com.company.crmfromdb.entity.Order;
import com.company.crmfromdb.entity.User;
import com.company.crmfromdb.test_support.AuthenticatedAsAdmin;
import io.jmix.core.AccessManager;
import io.jmix.core.DataManager;
import io.jmix.core.Id;
import io.jmix.core.Metadata;
import io.jmix.core.SaveContext;
import io.jmix.core.accesscontext.AccessContext;
import io.jmix.core.accesscontext.CrudEntityContext;
import io.jmix.core.accesscontext.EntityAttributeContext;
import io.jmix.core.security.SystemAuthenticator;
import io.jmix.data.PersistenceHints;
import io.jmix.flowui.accesscontext.UiShowViewContext;
import io.jmix.security.role.assignment.RoleAssignmentRoleType;
import io.jmix.securitydata.entity.RoleAssignmentEntity;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * A user with "Manager: Clients read-only" and "UI: minimal access" reads clients and nothing else.
 */
@SpringBootTest
@ExtendWith(AuthenticatedAsAdmin.class)
@ActiveProfiles("test")
public class ManagerClientsReadOnlyRoleTest {

    private static final String USERNAME = "test-manager-clients-ro";

    @Autowired
    DataManager dataManager;

    @Autowired
    Metadata metadata;

    @Autowired
    AccessManager accessManager;

    @Autowired
    SystemAuthenticator systemAuthenticator;

    private final List<Object> created = new ArrayList<>();

    @BeforeEach
    void setUp() {
        User user = dataManager.create(User.class);
        user.setUsername(USERNAME);
        created.add(dataManager.save(user));
        created.add(dataManager.save(resourceRoleAssignment(ManagerClientsReadOnlyRole.CODE)));
        created.add(dataManager.save(resourceRoleAssignment(UiMinimalRole.CODE)));
    }

    @Test
    void test_clientsReadOnly() {
        CrudEntityContext client = asManager(new CrudEntityContext(metadata.getClass(Client.class)));
        assertThat(client.isReadPermitted()).isTrue();
        assertThat(client.isCreatePermitted()).isFalse();
        assertThat(client.isUpdatePermitted()).isFalse();
        assertThat(client.isDeletePermitted()).isFalse();

        EntityAttributeContext rating = asManager(new EntityAttributeContext(metadata.getClass(Client.class), "rating"));
        assertThat(rating.canView()).isTrue();
        assertThat(rating.canModify()).isFalse();

        assertThat(asManager(new UiShowViewContext("crm_Client.list")).isPermitted()).isTrue();
        assertThat(asManager(new UiShowViewContext("crm_Client.detail")).isPermitted()).isTrue();
    }

    @Test
    void test_otherEntitiesAndViewsDenied() {
        assertThat(asManager(new CrudEntityContext(metadata.getClass(Order.class))).isReadPermitted()).isFalse();
        assertThat(asManager(new UiShowViewContext("crm_Order.list")).isPermitted()).isFalse();
    }

    private <C extends AccessContext> C asManager(C context) {
        return systemAuthenticator.withUser(USERNAME, () -> {
            accessManager.applyRegisteredConstraints(context);
            return context;
        });
    }

    private RoleAssignmentEntity resourceRoleAssignment(String roleCode) {
        RoleAssignmentEntity assignment = dataManager.create(RoleAssignmentEntity.class);
        assignment.setUsername(USERNAME);
        assignment.setRoleCode(roleCode);
        assignment.setRoleType(RoleAssignmentRoleType.RESOURCE);
        return assignment;
    }

    @AfterEach
    void tearDown() {
        // RoleAssignmentEntity is soft-deletable: a plain remove only stamps DELETED_DATE and the row stays in crm_test
        created.reversed().forEach(entity -> dataManager.load(Id.of(entity)).optional()
                .ifPresent(loaded -> dataManager.save(new SaveContext()
                        .setHint(PersistenceHints.SOFT_DELETION, false)
                        .removing(loaded))));
        created.clear();
    }
}
