package com.jeff.cars.service;

import com.jeff.cars.model.CarEntity;
import com.jeff.cars.repository.CarRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CarService {

    @Autowired
    private CarRepository repository;

    public List<CarEntity> findAll() {
        return repository.findAll();
    }

    public Optional<CarEntity> findById(Integer id) {
        return repository.findById(id);
    }

    public CarEntity save(CarEntity entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}

