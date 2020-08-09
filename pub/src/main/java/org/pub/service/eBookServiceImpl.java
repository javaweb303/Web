package org.pub.service;

import org.pub.dao.eBookDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class eBookServiceImpl implements eBookService {
	@Autowired
	private eBookDAO eBookDAO;
}
