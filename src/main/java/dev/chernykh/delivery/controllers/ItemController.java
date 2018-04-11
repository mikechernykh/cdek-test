package dev.chernykh.delivery.controllers;

import dev.chernykh.delivery.dao.ItemRepository;
import dev.chernykh.delivery.dto.ItemForm;
import dev.chernykh.delivery.entities.Item;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;

/**
 * Controller to manage rows of a table.
 */
@AllArgsConstructor
@Controller
@RequestMapping("/items")
public class ItemController {
    private final ItemRepository repository;
    
    /**
     * Displaying all rows of a table.
     *
     * @param pageable number of pages and pageable size
     * @param model    page of items to display on the view
     * @return model and view name
     */
    @GetMapping
    public ModelAndView getItems(Pageable pageable, ModelMap model) {
        model.addAttribute("pages", repository.findAll(pageable));
        return new ModelAndView("items", model);
    }
    
    /**
     * To display a creation form of an item.
     *
     * @param modelMap item dto
     * @return model and view name
     */
    @GetMapping("create")
    public ModelAndView createItem(ModelMap modelMap) {
        modelMap.addAttribute("itemForm", new ItemForm());
        return new ModelAndView("create", modelMap);
    }
    
    /**
     * Save a new valid item.
     *
     * @param itemForm item dto
     * @param result   validation errors if exists
     * @return a view name according to validation success
     */
    @PostMapping("create")
    public ModelAndView saveNewItem(@Valid @ModelAttribute("itemForm") ItemForm itemForm, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("create");
        }
        Item item = new Item();
        item.setName(itemForm.getName());
        repository.save(item);
        return new ModelAndView("redirect:/items");
    }
    
    /**
     * Displaying an item with specified id.
     *
     * @param item an item with given id
     * @return model and view name
     * @throws EntityNotFoundException if item doesn't exist
     */
    @GetMapping("{item:\\d+}")
    public ModelAndView viewOne(@PathVariable Item item) throws EntityNotFoundException {
        if (item == null) {
            throw new EntityNotFoundException("VIEW: Item not found");
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("item", item);
        return new ModelAndView("viewOne", modelMap);
    }
    
    /**
     * Displaying form to edit an item.
     *
     * @param item an item with given id
     * @return editable item and view name
     * @throws EntityNotFoundException if item doesn't exist
     */
    @GetMapping("{item:\\d+}/edit")
    public ModelAndView editItem(@PathVariable Item item) throws EntityNotFoundException {
        if (item == null) {
            throw new EntityNotFoundException("EDIT: item not found");
        }
        ItemForm itemForm = new ItemForm(item);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("itemForm", itemForm);
        return new ModelAndView("edit", modelMap);
    }
    
    /**
     * Save changed item.
     *
     * @param itemForm a changed item dto
     * @param result   validation errors
     * @param item     existing item
     * @return view name according to validation result
     * @throws EntityNotFoundException if item doesn't exist
     */
    @PostMapping("{item:\\d+}/edit")
    public ModelAndView saveItem(@Valid @ModelAttribute("itemForm") ItemForm itemForm,
                                 BindingResult result,
                                 @PathVariable Item item) throws EntityNotFoundException {
        if (item == null) {
            throw new EntityNotFoundException("EDIT-SAVE: item not found");
        }
        
        if (result.hasErrors()) {
            ModelMap modelMap = new ModelMap();
            modelMap.addAttribute("itemForm", new ItemForm(item));
            return new ModelAndView("edit", modelMap);
        }
        item.setName(itemForm.getName());
        repository.save(item);
        return new ModelAndView("redirect:/items/" + item.getId());
    }
    
    /**
     * Delete an item with given id.
     *
     * @param item item to be deleted
     * @return redirect view name
     * @throws EntityNotFoundException if item doesn't exist
     */
    @GetMapping("{item:\\d+}/delete")
    public RedirectView deleteOrder(@PathVariable Item item) throws EntityNotFoundException {
        if (item == null) {
            throw new EntityNotFoundException("DELETE: Item not found");
        }
        repository.delete(item);
        return new RedirectView("/items");
    }
    
    /**
     * Searching item by name or part of the name.
     *
     * @param name     name or part of the item name
     * @param pageable page of found items to display on the view
     * @return model and view name
     */
    @GetMapping(value = "search", params = {"searchName"})
    public ModelAndView search(@RequestParam("searchName") String name, Pageable pageable) {
        Page<Item> pages = repository.findByNameLikeIgnoreCase("%" + name + "%", pageable);
        ModelMap modelMap = new ModelMap();
        modelMap.put("pages", pages);
        modelMap.put("searchName", name);
        return new ModelAndView("search", modelMap);
    }
}
