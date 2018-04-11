package dev.chernykh.cdektest.entities;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Item {
    @Id
    @GeneratedValue
    private long id;
    private String name;
}
