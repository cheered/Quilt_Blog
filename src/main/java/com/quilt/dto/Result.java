package com.quilt.dto;

import com.quilt.exception.enums.QuiltEnums;

public class Result<T> {

    private int state ;

    private String stateInfo ;

    private T data;


    public Result(){

    }

    public Result(int state,String stateInfo){
        this.state = state ;
        this.stateInfo = stateInfo;
    }

    public Result(int state,String stateInfo,T data){
        this.state = state ;
        this.stateInfo = stateInfo;
        this.data = data;
    }

    public Result(QuiltEnums quiltEnums){
        this.state = quiltEnums.getState() ;
        this.stateInfo = quiltEnums.getstateInfo();
    }

    public Result(QuiltEnums quiltEnums,T data){
        this.state = quiltEnums.getState() ;
        this.stateInfo = quiltEnums.getstateInfo();
        this.data = data;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
