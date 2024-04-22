package com.task.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class ResponseUtil {

    public static ResponseEntity<ResponseBean> getSuccessResponse(Object data) {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setData(data);
        responseBean.setStatus(TaskConstants.SUCCESS);
        responseBean.setStatusCode(TaskConstants.SUCCESS_CODE);
        return new ResponseEntity<>(responseBean, HttpStatus.OK);
    }

    public static ResponseEntity<ResponseBean> getErrorResponse(Object data) {
        ResponseBean responseBean = new ResponseBean();
        responseBean.setData(data);
        responseBean.setStatus(TaskConstants.INTERNAL_SERVER_ERROR);
        responseBean.setStatusCode(TaskConstants.INTERNAL_SERVER_ERROR_CODE);
        return new ResponseEntity<>(responseBean, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
