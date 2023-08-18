package com.jeff.cars.model;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "car_table")

public class CarEntity {

    @Id
    private Integer id;
    private String name;
    public void setId(Integer id2) {
        this.id = id2;
    }
    public Integer getId() {
        return this.id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
}

