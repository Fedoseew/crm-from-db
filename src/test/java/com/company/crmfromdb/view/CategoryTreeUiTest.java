package com.company.crmfromdb.view;

import com.company.crmfromdb.CrmFromDbApplication;
import com.company.crmfromdb.entity.Category;
import com.company.crmfromdb.test_support.AuthenticatedAsAdmin;
import com.company.crmfromdb.view.category.CategoryListView;
import io.jmix.core.DataManager;
import io.jmix.core.Id;
import io.jmix.core.SaveContext;
import io.jmix.data.PersistenceHints;
import io.jmix.flowui.ViewNavigators;
import io.jmix.flowui.component.grid.TreeDataGrid;
import io.jmix.flowui.data.grid.ContainerTreeDataGridItems;
import io.jmix.flowui.testassist.FlowuiTestAssistConfiguration;
import io.jmix.flowui.testassist.UiTest;
import io.jmix.flowui.testassist.UiTestUtils;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

/**
 * Categories list is a tree by Category.parent, and a category cannot become its own ancestor.
 */
@UiTest
@SpringBootTest(classes = {CrmFromDbApplication.class, FlowuiTestAssistConfiguration.class})
@ExtendWith(AuthenticatedAsAdmin.class)
@ActiveProfiles("test")
public class CategoryTreeUiTest {

    @Autowired
    ViewNavigators viewNavigators;

    @Autowired
    DataManager dataManager;

    Category root;
    Category child;

    @BeforeEach
    void setUp() {
        root = dataManager.save(newCategory(null));
        child = dataManager.save(newCategory(root));
    }

    @Test
    void test_childIsNestedUnderParent() {
        viewNavigators.view(UiTestUtils.getCurrentView(), CategoryListView.class).navigate();
        TreeDataGrid<Category> grid = UiTestUtils.getComponent(UiTestUtils.getCurrentView(), "categoriesDataGrid");
        ContainerTreeDataGridItems<Category> items = (ContainerTreeDataGridItems<Category>) grid.getItems();

        assertThat(items.getParent(child)).isEqualTo(root);
        assertThat(items.getChildren(root)).containsExactly(child);
    }

    @Test
    void test_categoryCannotBecomeItsOwnAncestor() {
        root.setParent(child);

        assertThatThrownBy(() -> dataManager.save(root))
                .hasStackTraceContaining("A category cannot be its own parent or ancestor");
        assertThat(dataManager.load(Category.class).id(root.getId()).fetchPlanProperties("parent").one().getParent())
                .isNull();
    }

    @AfterEach
    void tearDown() {
        // children first (FK PARENT_ID); hard delete, Category is soft-deletable
        for (Category category : new Category[]{child, root}) {
            if (category != null) {
                dataManager.load(Id.of(category)).optional().ifPresent(loaded -> dataManager.save(new SaveContext()
                        .setHint(PersistenceHints.SOFT_DELETION, false)
                        .removing(loaded)));
            }
        }
    }

    private Category newCategory(Category parent) {
        Category category = dataManager.create(Category.class);
        String unique = UUID.randomUUID().toString().substring(0, 8);
        category.setName("Tree test " + unique);
        category.setCode("T-" + unique);
        category.setParent(parent);
        return category;
    }
}
