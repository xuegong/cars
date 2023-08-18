package com.jeff.cars.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.jeff.cars.model.CarEntity;
import com.jeff.cars.repository.CarRepository;
import com.jeff.cars.service.CarService;

import java.util.List;

@RestController
@RequestMapping("/api/cars")
public class CarController {

    @Autowired
    private CarService service;

    @GetMapping
    public List<CarEntity> getAllCars() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<CarEntity> getSampleById(@PathVariable Integer id) {
        return service.findById(id)
                .map(sample -> ResponseEntity.ok().body(sample))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public CarEntity createSample(@RequestBody CarEntity sample) {
        return service.save(sample);
    }

    @PutMapping("/{id}")
    public ResponseEntity<CarEntity> updateCar(@PathVariable Integer id, @RequestBody CarEntity sample) {
        if (!service.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        sample.setId(id);
        return ResponseEntity.ok().body(service.save(sample));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSample(@PathVariable Integer id) {
        if (!service.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        service.deleteById(id);
        return ResponseEntity.ok().build();
    }
}
