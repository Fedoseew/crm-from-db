package com.company.crmfromdb.view.category;

import com.company.crmfromdb.entity.Category;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "categories", layout = MainView.class)
@ViewController(id = "crm_Category.list")
@ViewDescriptor(path = "category-list-view.xml")
@LookupComponent("categoriesDataGrid")
@DialogMode(width = "64em")
public class CategoryListView extends StandardListView<Category> {
}
