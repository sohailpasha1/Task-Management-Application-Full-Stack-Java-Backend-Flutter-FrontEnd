package com.task.exception;

public class InvalidRequestPayloadException extends Exception {

    public InvalidRequestPayloadException() {

    }

    public InvalidRequestPayloadException(String message) {
        super(message);
    }
}
