package com.company.crmfromdb.listener;

import com.company.crmfromdb.entity.Category;
import io.jmix.core.UnconstrainedDataManager;
import io.jmix.core.event.EntityChangedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/**
 * Forbids cycles in Category.parent: the Categories tree never shows a category that is its own ancestor.
 */
@Component
public class CategoryEventListener {

    private final UnconstrainedDataManager dataManager;

    public CategoryEventListener(UnconstrainedDataManager dataManager) {
        this.dataManager = dataManager;
    }

    @EventListener
    public void onCategoryChanged(EntityChangedEvent<Category> event) {
        if (event.getType() == EntityChangedEvent.Type.DELETED || !event.getChanges().isChanged("parent")) {
            return;
        }
        UUID id = (UUID) event.getEntityId().getValue();
        Set<UUID> visited = new HashSet<>();
        for (UUID ancestor = parentIdOf(id); ancestor != null && visited.add(ancestor); ancestor = parentIdOf(ancestor)) {
            if (ancestor.equals(id)) {
                throw new IllegalStateException("A category cannot be its own parent or ancestor");
            }
        }
    }

    private UUID parentIdOf(UUID categoryId) {
        // runs after the flush, in the same transaction: sees the parent being saved
        return dataManager.load(Category.class)
                .id(categoryId)
                .fetchPlanProperties("parent")
                .optional()
                .map(Category::getParent)
                .map(Category::getId)
                .orElse(null);
    }
}
