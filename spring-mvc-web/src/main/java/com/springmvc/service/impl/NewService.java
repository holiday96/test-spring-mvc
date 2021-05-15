package com.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.dao.INewDAO;
import com.springmvc.model.NewModel;
import com.springmvc.service.INewService;

@Service
public class NewService implements INewService {
	
	@Autowired
	private INewDAO newDao;

	@Override
	public List<NewModel> findAll() {
		return newDao.findAll();
	}
}
