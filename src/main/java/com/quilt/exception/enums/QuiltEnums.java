package com.quilt.exception.enums;

public enum  QuiltEnums {

    FAILED(0,"失败"),
    SUCCESS(1,"成功"),
    PASSWORDERROR(300,"密码错误");


    private int state;
    private String stateInfo;

    QuiltEnums(int state,String stateInfo) {
        this.state = state ;
        this.stateInfo = stateInfo ;
    }

    public int getState(){
        return state;
    }

    public  String getstateInfo(){
        return stateInfo;
    }
}

