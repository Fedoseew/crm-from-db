package com.company.crmfromdb.security;

import com.company.crmfromdb.entity.Client;
import io.jmix.security.model.EntityAttributePolicyAction;
import io.jmix.security.model.EntityPolicyAction;
import io.jmix.security.model.SecurityScope;
import io.jmix.security.role.annotation.EntityAttributePolicy;
import io.jmix.security.role.annotation.EntityPolicy;
import io.jmix.security.role.annotation.ResourceRole;
import io.jmix.securityflowui.role.annotation.MenuPolicy;
import io.jmix.securityflowui.role.annotation.ViewPolicy;

@ResourceRole(name = "Manager: Clients read-only", code = ManagerClientsReadOnlyRole.CODE, scope = SecurityScope.UI)
public interface ManagerClientsReadOnlyRole {

    String CODE = "manager-clients-ro";

    @EntityAttributePolicy(entityClass = Client.class, attributes = "*", action = EntityAttributePolicyAction.VIEW)
    @EntityPolicy(entityClass = Client.class, actions = EntityPolicyAction.READ)
    void client();

    @ViewPolicy(viewIds = {"crm_Client.list", "crm_Client.detail"})
    @MenuPolicy(menuIds = "crm_Client.list")
    void screens();
}
