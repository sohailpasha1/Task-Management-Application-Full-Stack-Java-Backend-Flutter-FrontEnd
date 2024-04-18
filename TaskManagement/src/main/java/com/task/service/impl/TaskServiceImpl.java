package com.task.service.impl;

import com.task.exception.DuplicateRecordException;
import com.task.exception.RecordNotFoundException;
import com.task.model.Task;
import com.task.repository.TaskRepository;
import com.task.service.TaskService;
import com.task.util.ResponseBean;
import com.task.util.ResponseUtil;
import com.task.util.TaskConstants;
import com.task.util.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import java.util.List;

@Service
@Slf4j
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskRepository taskRepository;

    @Override
    public ResponseEntity<ResponseBean> saveTask(TaskVO taskVO) throws DuplicateRecordException {
        log.info("TaskServiceImpl > saveTask() >> Initiated!!");
        Task checkRecordExist = taskRepository.findByTitle(taskVO.getTitle());
        if (!ObjectUtils.isEmpty(checkRecordExist)) {
            throw new DuplicateRecordException(TaskConstants.RECORD_NOT_FOUND);
        }
        try {
            Task task = Task.builder().title(taskVO.getTitle()).description(taskVO.getDescription()).status(taskVO.getStatus()).build();
            taskRepository.save(task);
            log.info("TaskServiceImpl > saveTask() >> Completed!!");
            return ResponseUtil.getSuccessResponse("Successfully saved Task");
        } catch (Exception e) {
            log.error("TaskServiceImpl > saveTask() >> Error while saving Task >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to Save Task");
    }

    @Override
    public ResponseEntity<ResponseBean> getAllTask() {
        log.info("TaskServiceImpl > getAllTask() >> Initiated!!");
        try {
            List<Task> taskList = taskRepository.findAll();
            log.info("TaskServiceImpl > getAllTask() >> Completed!!");
            return ResponseUtil.getSuccessResponse(taskList);
        } catch (Exception e) {
            log.error("TaskServiceImpl > getAllTask() >> Error while fetching the Task Data >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to Fetch Task Data");
    }

    @Override
    public ResponseEntity<ResponseBean> getTaskByTitle(String title) throws RecordNotFoundException {
        try {
            log.info("TaskServiceImpl > getTaskByTitle() >> Initiated!!");
            Task task = taskRepository.findByTitle(title);
            if (ObjectUtils.isEmpty(task)) {
                throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
            }
            log.info("TaskServiceImpl > getTaskByTitle() >> Initiated!!");
            return ResponseUtil.getSuccessResponse(task);
        } catch (Exception e) {
            log.error("TaskServiceImpl > getTaskByTitle() >> Error while fetching the Task Data >>> ", e);
            throw e;
        }
    }

    @Override
    public ResponseEntity<ResponseBean> getTaskByStatus(String status) throws RecordNotFoundException {
        log.info("TaskServiceImpl > getTaskByStatus() >> Initiated!!");
        try {
            List<Task> task = taskRepository.findAllByStatus(status);
            if (CollectionUtils.isEmpty(task)) {
                throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
            }
            log.info("TaskServiceImpl > getTaskByStatus() >> Initiated!!");
            return ResponseUtil.getSuccessResponse(task);
        } catch (Exception e) {
            log.error("TaskServiceImpl > getTaskByStatus() >> Error while fetching the Task Data >>> ", e);
            throw e;
        }
    }

    @Override
    public ResponseEntity<ResponseBean> updateTask(TaskVO taskVO) throws RecordNotFoundException {
        log.info("TaskServiceImpl > updateTask() >> Initiated!!");
        Task checkRecordExist = taskRepository.findByTitle(taskVO.getTitle());
        if (ObjectUtils.isEmpty(checkRecordExist)) {
            throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
        }
        try {
            checkRecordExist.setStatus(taskVO.getStatus());
            checkRecordExist.setDescription(taskVO.getDescription());
            taskRepository.save(checkRecordExist);
            log.info("TaskServiceImpl > updateTask() >> Completed!!");
            return ResponseUtil.getSuccessResponse("Task Updated Successfully");
        } catch (Exception e) {
            log.error("TaskServiceImpl > updateTask() >> Error while updating Task >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to updated Task");
    }

    @Override
    public ResponseEntity<ResponseBean> deleteTaskByTitle(String title) throws RecordNotFoundException {
        log.info("TaskServiceImpl > deleteTaskByTitle() >> Initiated!!");
        Task checkRecordExist = taskRepository.findByTitle(title);
        if (ObjectUtils.isEmpty(checkRecordExist)) {
            throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
        }
        try {
            taskRepository.delete(checkRecordExist);
            log.info("TaskServiceImpl > deleteTaskByTitle() >> Initiated!!");
            return ResponseUtil.getSuccessResponse("Deleted Successfully");
        } catch (Exception e) {
            log.error("TaskServiceImpl > deleteTaskByTitle() >> Error while Deleting the Task Data >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to delete Task Data");
    }
}
