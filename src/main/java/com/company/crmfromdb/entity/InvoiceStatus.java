package com.company.crmfromdb.entity;

import io.jmix.core.metamodel.datatype.EnumClass;
import org.jspecify.annotations.Nullable;

public enum InvoiceStatus implements EnumClass<Integer> {

    NEW(10),
    PENDING(20),
    OVERDUE(30),
    PAID(40);

    private final Integer id;

    InvoiceStatus(Integer id) {
        this.id = id;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Nullable
    public static InvoiceStatus fromId(Integer id) {
        for (InvoiceStatus at : InvoiceStatus.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}
