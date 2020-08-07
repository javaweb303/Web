package org.pub.service;

import org.pub.dao.ManagerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO managerDAO;
}
