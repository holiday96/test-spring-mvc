package com.springmvc.dao;

import java.util.List;

import com.springmvc.model.NewModel;

public interface INewDAO extends GenericDAO<NewModel> {
	List<NewModel> findAll();
}	
