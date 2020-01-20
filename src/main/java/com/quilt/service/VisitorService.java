package com.quilt.service;

import com.quilt.entity.Visitor;

import java.util.List;

public interface VisitorService {

    int addVisitorRecord(Visitor visitor);

    int deleteVisitorRecord(Integer id);

    List<Visitor> getAllVisitorRecord();
}
