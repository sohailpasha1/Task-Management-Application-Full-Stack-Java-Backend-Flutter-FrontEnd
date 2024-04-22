package com.task.exception;

public class DuplicateRecordException extends Exception {

    public DuplicateRecordException() {

    }

    public DuplicateRecordException(String message) {
        super(message);
    }
}
