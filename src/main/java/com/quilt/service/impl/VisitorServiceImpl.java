package com.quilt.service.impl;

import com.quilt.dao.VisitorDAO;
import com.quilt.entity.Visitor;
import com.quilt.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VisitorServiceImpl implements VisitorService {

    @Autowired
    VisitorDAO visitorDAO;

    @Override
    public int addVisitorRecord(Visitor visitor) {
        return visitorDAO.insertSelective(visitor);
    }

    @Override
    public int deleteVisitorRecord(Integer id) {
        return visitorDAO.deleteByPrimaryKey(id);
    }

    @Override
    public List<Visitor> getAllVisitorRecord() {
        return visitorDAO.getAllVisitorRecord();
    }
}
