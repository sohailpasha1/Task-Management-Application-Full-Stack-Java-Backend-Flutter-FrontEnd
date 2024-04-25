package com.task.exception;

import com.task.util.ErrorResponse;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.Date;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    protected @ResponseBody ErrorResponse
    resourceNotFoundExcepiton(
            MethodArgumentNotValidException resourceNotFoundExcepiton) {
        return new ErrorResponse(
                resourceNotFoundExcepiton.getMessage(),
                HttpStatus.BAD_REQUEST.name(), HttpStatus.BAD_REQUEST.value(), new Date());
    }

    @ExceptionHandler(value = DuplicateRecordException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    protected @ResponseBody ErrorResponse
    duplicateRecordException(
            DuplicateRecordException duplicateRecordException) {
        return new ErrorResponse(
                duplicateRecordException.getMessage(),
                HttpStatus.BAD_REQUEST.name(), HttpStatus.BAD_REQUEST.value(), new Date());
    }

    @ExceptionHandler(value = RecordNotFoundException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected @ResponseBody ErrorResponse
    recordNotFoundException(
            RecordNotFoundException recordNotFoundException) {
        return new ErrorResponse(
                recordNotFoundException.getMessage(),
                HttpStatus.INTERNAL_SERVER_ERROR.name(), HttpStatus.INTERNAL_SERVER_ERROR.value(), new Date());
    }
}