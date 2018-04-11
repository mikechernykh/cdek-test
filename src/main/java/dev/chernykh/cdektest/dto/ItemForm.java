package dev.chernykh.cdektest.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import dev.chernykh.cdektest.entities.Item;
import org.hibernate.validator.constraints.NotBlank;

@Data
@NoArgsConstructor
public class ItemForm {
    private long id;
    @NotBlank(message = "NotBlank.itemForm.name")
    private String name;
    
    public ItemForm(Item item) {
        this.id = item.getId();
        this.name = item.getName();
    }
}
