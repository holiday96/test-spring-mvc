package com.springmvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springmvc.entity.NewEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long>{

}
