package com.company.crmfromdb.view.categoryitem;

import com.company.crmfromdb.entity.CategoryItem;
import com.company.crmfromdb.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.*;

@Route(value = "category-items/:id", layout = MainView.class)
@ViewController(id = "crm_CategoryItem.detail")
@ViewDescriptor(path = "category-item-detail-view.xml")
@EditedEntityContainer("categoryItemDc")
public class CategoryItemDetailView extends StandardDetailView<CategoryItem> {
}
