package com.task.service;

import com.task.exception.DuplicateRecordException;
import com.task.exception.RecordNotFoundException;
import com.task.util.ResponseBean;
import com.task.util.TaskVO;
import org.springframework.http.ResponseEntity;

public interface TaskService {

    ResponseEntity<ResponseBean> saveTask(TaskVO task) throws DuplicateRecordException;

    ResponseEntity<ResponseBean> getAllTask();

    ResponseEntity<ResponseBean> getTaskByTitle(String title) throws RecordNotFoundException;

    ResponseEntity<ResponseBean> getTaskByStatus(String status) throws RecordNotFoundException;

    ResponseEntity<ResponseBean> updateTask(TaskVO task) throws RecordNotFoundException;

    ResponseEntity<ResponseBean> deleteTaskByTitle(String title) throws RecordNotFoundException;
}
