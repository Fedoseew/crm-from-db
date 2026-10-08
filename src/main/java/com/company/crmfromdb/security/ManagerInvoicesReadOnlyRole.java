package com.company.crmfromdb.security;

import com.company.crmfromdb.entity.Invoice;
import io.jmix.security.model.EntityAttributePolicyAction;
import io.jmix.security.model.EntityPolicyAction;
import io.jmix.security.model.SecurityScope;
import io.jmix.security.role.annotation.EntityAttributePolicy;
import io.jmix.security.role.annotation.EntityPolicy;
import io.jmix.security.role.annotation.ResourceRole;
import io.jmix.securityflowui.role.annotation.MenuPolicy;
import io.jmix.securityflowui.role.annotation.ViewPolicy;

@ResourceRole(name = "Manager: Invoices read-only", code = ManagerInvoicesReadOnlyRole.CODE, scope = SecurityScope.UI)
public interface ManagerInvoicesReadOnlyRole {

    String CODE = "manager-invoices-ro";

    @EntityAttributePolicy(entityClass = Invoice.class, attributes = "*", action = EntityAttributePolicyAction.VIEW)
    @EntityPolicy(entityClass = Invoice.class, actions = EntityPolicyAction.READ)
    void invoice();

    @ViewPolicy(viewIds = "crm_Invoice.list")
    @MenuPolicy(menuIds = "crm_Invoice.list")
    void screens();
}
