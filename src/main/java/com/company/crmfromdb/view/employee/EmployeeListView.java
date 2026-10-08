package com.company.crmfromdb.view.employee;

import com.company.crmfromdb.entity.Employee;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "employees", layout = MainView.class)
@ViewController(id = "crm_Employee.list")
@ViewDescriptor(path = "employee-list-view.xml")
@LookupComponent("employeesDataGrid")
@DialogMode(width = "64em")
public class EmployeeListView extends StandardListView<Employee> {
}
