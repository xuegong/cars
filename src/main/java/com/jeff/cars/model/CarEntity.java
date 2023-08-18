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
    }

    // Standard getters, setters, constructors, equals, and hashCode
}

