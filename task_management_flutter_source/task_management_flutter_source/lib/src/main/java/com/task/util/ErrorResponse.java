package com.task.util;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class ErrorResponse {
    private String errorCause;
    private String errorStatus;
    private int errorCode;
    private Date errorTimeStamp;

    private ErrorResponse() {

    }

    public ErrorResponse(String errorCause, String errorStatus, int errorCode, Date errorTimeStamp) {
        super();
        this.errorCause = errorCause;
        this.errorStatus = errorStatus;
        this.errorCode = errorCode;
        this.errorTimeStamp = errorTimeStamp;
    }

    public String getErrorCause() {
        return errorCause;
    }

    public void setErrorCause(String errorCause) {
        this.errorCause = errorCause;
    }

    public String getErrorStatus() {
        return errorStatus;
    }

    public void setErrorStatus(String errorStatus) {
        this.errorStatus = errorStatus;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public Date getErrorTimeStamp() {
        return errorTimeStamp;
    }

    public void setErrorTimeStamp(Date errorTimeStamp) {
        this.errorTimeStamp = errorTimeStamp;
    }

}
