package com.task.service;

import com.task.exception.DuplicateRecordException;
import com.task.exception.InvalidRequestPayloadException;
import com.task.exception.RecordNotFoundException;
import com.task.util.ResponseBean;
import com.task.util.TaskVO;
import org.springframework.http.ResponseEntity;

public interface TaskService {

    ResponseEntity<ResponseBean> saveTask(TaskVO task) throws DuplicateRecordException, InvalidRequestPayloadException;

    ResponseEntity<ResponseBean> getAllTask();

    ResponseEntity<ResponseBean> getTaskByTitle(String title) throws RecordNotFoundException;

    ResponseEntity<ResponseBean> getTaskByStatus(String status) throws RecordNotFoundException, InvalidRequestPayloadException;

    ResponseEntity<ResponseBean> updateTask(TaskVO task) throws RecordNotFoundException, InvalidRequestPayloadException;

    ResponseEntity<ResponseBean> deleteTaskByTitle(String title) throws RecordNotFoundException;

    ResponseEntity<ResponseBean> sortTaskByStatus(String status) throws RecordNotFoundException, InvalidRequestPayloadException;
}
