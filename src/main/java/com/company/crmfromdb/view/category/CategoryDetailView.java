package com.company.crmfromdb.view.category;

import com.company.crmfromdb.entity.Category;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "categories/:id", layout = MainView.class)
@ViewController(id = "crm_Category.detail")
@ViewDescriptor(path = "category-detail-view.xml")
@EditedEntityContainer("categoryDc")
public class CategoryDetailView extends StandardDetailView<Category> {
}
