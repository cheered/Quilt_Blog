package com.quilt.dao;

import com.quilt.entity.Visitor;

import java.util.List;

public interface VisitorDAO {
    /**
     * 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 
     */
    int insert(Visitor record);

    /**
     * 
     */
    int insertSelective(Visitor record);

    /**
     * 
     */
    Visitor selectByPrimaryKey(Integer id);

    /**
     * 
     */
    int updateByPrimaryKeySelective(Visitor record);

    /**
     * 
     */
    int updateByPrimaryKey(Visitor record);

    List<Visitor> getAllVisitorRecord();
}