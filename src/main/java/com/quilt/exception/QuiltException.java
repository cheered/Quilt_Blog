package com.quilt.exception;

import com.quilt.exception.enums.QuiltEnums;

public class QuiltException extends  RuntimeException {

    private QuiltEnums quiltEnums;

    public QuiltException(QuiltEnums quiltEnums){
        super(quiltEnums.getstateInfo());
        this.quiltEnums = quiltEnums;
    }

    public  QuiltEnums getQuiltEnums(){
        return this.quiltEnums;
    }

    public QuiltException(String message, Throwable cause){
        super(message,cause);
    }
}
