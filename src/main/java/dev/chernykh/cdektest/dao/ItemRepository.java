package dev.chernykh.cdektest.dao;

import dev.chernykh.cdektest.entities.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends PagingAndSortingRepository<Item, Long> {
    Page<Item> findByNameLikeIgnoreCase(String name, Pageable pageable);
}
