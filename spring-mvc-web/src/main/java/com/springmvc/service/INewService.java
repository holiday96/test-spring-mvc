package com.springmvc.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.springmvc.dto.NewDTO;

public interface INewService {
	List<NewDTO> findAll(Pageable pageable);
	int getTotalItem();
	NewDTO findById(long id);
	NewDTO save(NewDTO dto);
	void delete(long[] ids);
}
