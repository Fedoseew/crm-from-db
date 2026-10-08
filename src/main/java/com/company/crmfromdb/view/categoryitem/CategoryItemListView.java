package com.company.crmfromdb.view.categoryitem;

import com.company.crmfromdb.entity.CategoryItem;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "category-items", layout = MainView.class)
@ViewController(id = "crm_CategoryItem.list")
@ViewDescriptor(path = "category-item-list-view.xml")
@LookupComponent("categoryItemsDataGrid")
@DialogMode(width = "64em")
public class CategoryItemListView extends StandardListView<CategoryItem> {
}
