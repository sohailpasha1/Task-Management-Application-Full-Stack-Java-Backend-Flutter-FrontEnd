package com.task.service.impl;

import com.task.exception.DuplicateRecordException;
import com.task.exception.InvalidRequestPayloadException;
import com.task.exception.RecordNotFoundException;
import com.task.model.Task;
import com.task.dao.TaskRepository;
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
import org.springframework.util.StringUtils;

import java.util.Comparator;
import java.util.List;

@Service
@Slf4j
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskRepository taskRepository;

    /**
     * Creating the new Task by Title, Description, Status
     *
     * @param taskVO
     * @return
     * @throws DuplicateRecordException
     * @throws InvalidRequestPayloadException
     */
    @Override
    public ResponseEntity<ResponseBean> saveTask(TaskVO taskVO) throws DuplicateRecordException, InvalidRequestPayloadException {
        log.info("TaskServiceImpl > saveTask() >> Initiated!!");
        //Title must not be null
        if (!StringUtils.hasText(taskVO.getTitle())) {
            throw new InvalidRequestPayloadException("Title can't be empty!!");
        }
        //Validate Status
        if (!validateStatus(taskVO.getStatus())) {
            throw new InvalidRequestPayloadException(TaskConstants.STATUS_SUPPORTED);
        }
        //validating to restrict for Duplicate entry.
        Task checkRecordExist = taskRepository.findByTitle(taskVO.getTitle());
        if (!ObjectUtils.isEmpty(checkRecordExist)) {
            throw new DuplicateRecordException(TaskConstants.DUPLICATE_RECORD);
        }
        try {
            Task task = Task.builder().title(taskVO.getTitle()).description(taskVO.getDescription()).status(taskVO.getStatus()).build();
            //Saving the Task to the DataBase
            taskRepository.save(task);
            log.info("TaskServiceImpl > saveTask() >> Completed!!");
            return ResponseUtil.getSuccessResponse("Successfully saved Task");
        } catch (Exception e) {
            log.error("TaskServiceImpl > saveTask() >> Error while saving Task >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to Save Task");
    }

    /**
     * Fetch all the available Tasks
     *
     * @return
     */
    @Override
    public ResponseEntity<ResponseBean> getAllTask() {
        log.info("TaskServiceImpl > getAllTask() >> Initiated!!");
        try {
            //fetching all the task from database
            List<Task> taskList = taskRepository.findAll();
            log.info("TaskServiceImpl > getAllTask() >> Completed!!");
            return ResponseUtil.getSuccessResponse(taskList);
        } catch (Exception e) {
            log.error("TaskServiceImpl > getAllTask() >> Error while fetching the Task Data >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to Fetch Task Data");
    }

    /**
     * Fetch Task by title
     *
     * @param title
     * @return
     * @throws RecordNotFoundException
     */
    @Override
    public ResponseEntity<ResponseBean> getTaskByTitle(String title) throws RecordNotFoundException {
        try {
            log.info("TaskServiceImpl > getTaskByTitle() >> Initiated!!");
            //fetching taskByTitle from database
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

    /**
     * Fetch Task by Status
     *
     * @param status
     * @return the list of tasks that matchs the status
     * @throws RecordNotFoundException
     */
    @Override
    public ResponseEntity<ResponseBean> getTaskByStatus(String status) throws RecordNotFoundException, InvalidRequestPayloadException {
        log.info("TaskServiceImpl > getTaskByStatus() >> Initiated!!");
        //Validating Status
        if (!validateStatus(status)) {
            throw new InvalidRequestPayloadException(TaskConstants.STATUS_SUPPORTED);
        }
        try {
             //fetching taskByStatus from database
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

    /**
     * update the Task
     * find the Task by Title, if found update by new Description and Status
     *
     * @param taskVO
     * @return
     * @throws RecordNotFoundException
     * @throws InvalidRequestPayloadException
     */
    @Override
    public ResponseEntity<ResponseBean> updateTask(TaskVO taskVO) throws RecordNotFoundException, InvalidRequestPayloadException {
        log.info("TaskServiceImpl > updateTask() >> Initiated!!");
        if (!validateStatus(taskVO.getStatus())) {
            throw new InvalidRequestPayloadException(TaskConstants.STATUS_SUPPORTED);
        }
        if (!StringUtils.hasText(taskVO.getTitle())) {
            throw new InvalidRequestPayloadException("Title can't be empty!!");
        }
         //fetching taskByTitle from database
        Task checkRecordExist = taskRepository.findByTitle(taskVO.getTitle());
        if (ObjectUtils.isEmpty(checkRecordExist)) {
            throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
        }
        try {
            checkRecordExist.setStatus(taskVO.getStatus());
            checkRecordExist.setDescription(taskVO.getDescription());
             //updating the task to database
            taskRepository.save(checkRecordExist);
            log.info("TaskServiceImpl > updateTask() >> Completed!!");
            return ResponseUtil.getSuccessResponse("Task Updated Successfully");
        } catch (Exception e) {
            log.error("TaskServiceImpl > updateTask() >> Error while updating Task >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to updated Task");
    }

    /**
     * Delete the Task by Title
     *
     * @param title
     * @return
     * @throws RecordNotFoundException
     */
    @Override
    public ResponseEntity<ResponseBean> deleteTaskByTitle(String title) throws RecordNotFoundException {
        log.info("TaskServiceImpl > deleteTaskByTitle() >> Initiated!!");
        Task checkRecordExist = taskRepository.findByTitle(title);
        if (ObjectUtils.isEmpty(checkRecordExist)) {
            throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
        }
        try {
             //deleting the taskByTitle from database
            taskRepository.delete(checkRecordExist);
            log.info("TaskServiceImpl > deleteTaskByTitle() >> Initiated!!");
            return ResponseUtil.getSuccessResponse("Deleted Successfully");
        } catch (Exception e) {
            log.error("TaskServiceImpl > deleteTaskByTitle() >> Error while Deleting the Task Data >>> ", e);
        }
        return ResponseUtil.getErrorResponse("Failed to delete Task Data");
    }

    /**
     * most efficient sorting Technique to Sort the Task list by Status
     *
     * @param status
     * @return
     * @throws RecordNotFoundException
     */
    @Override
    public ResponseEntity<ResponseBean> sortTaskByStatus(String status) throws RecordNotFoundException, InvalidRequestPayloadException {
        log.info("TaskServiceImpl > getTaskByStatus() >> Initiated!!");
        if (!validateStatus(status)) {
            throw new InvalidRequestPayloadException(TaskConstants.STATUS_SUPPORTED);
        }
        try {
            List<Task> tasks = taskRepository.findAll();
            if (CollectionUtils.isEmpty(tasks)) {
                throw new RecordNotFoundException(TaskConstants.RECORD_NOT_FOUND);
            }
            sortByStatus(tasks, status);
            log.info("TaskServiceImpl > getTaskByStatus() >> Initiated!!");
            return ResponseUtil.getSuccessResponse(tasks);
        } catch (Exception e) {
            log.error("TaskServiceImpl > getTaskByStatus() >> Error while fetching the Task Data >>> ", e);
            throw e;
        }
    }

    /**
     * This method is used for Sorting list of Tasks
     *
     * @param tasks
     * @param status
     */
    public static void sortByStatus(List<Task> tasks, String status) {
        Comparator<Task> comparator = (t1, t2) -> {
            if (t1.getStatus().equals(status) && !t2.getStatus().equals(status)) {
                return -1;
            } else if (!t1.getStatus().equals(status) && t2.getStatus().equals(status)) {
                return 1;
            } else {
                return 0;
            }
        };
        tasks.sort(comparator);
    }

    /**
     * Validate the Status
     *
     * @param status
     * @return
     */
    private static boolean validateStatus(String status) {
        return (TaskConstants.TODO.equals(status)
                || TaskConstants.IN_PROGRESS.equals(status)
                || TaskConstants.DONE.equals(status));
    }
}
