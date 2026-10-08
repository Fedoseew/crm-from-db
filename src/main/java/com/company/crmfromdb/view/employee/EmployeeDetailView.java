package com.company.crmfromdb.view.employee;

import com.company.crmfromdb.entity.Employee;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "employees/:id", layout = MainView.class)
@ViewController(id = "crm_Employee.detail")
@ViewDescriptor(path = "employee-detail-view.xml")
@EditedEntityContainer("employeeDc")
public class EmployeeDetailView extends StandardDetailView<Employee> {
}
