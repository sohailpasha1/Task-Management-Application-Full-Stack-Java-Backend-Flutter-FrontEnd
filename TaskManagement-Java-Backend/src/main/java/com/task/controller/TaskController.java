package com.task.controller;

import com.task.exception.DuplicateRecordException;
import com.task.exception.InvalidRequestPayloadException;
import com.task.exception.RecordNotFoundException;
import com.task.service.TaskService;
import com.task.util.ResponseBean;
import com.task.util.TaskVO;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private TaskService taskService;

    /**
     * This API is use to create a new Task
     * check application.properties for database used postgres
     *
     * @param task: this parameter Task is any object which have 3 fields Title, Description and Status
     * @return
     * @throws DuplicateRecordException
     */
    @PostMapping(value = "/save-new-task")
    public ResponseEntity<ResponseBean> saveNewTask(@RequestBody @Valid TaskVO task) throws DuplicateRecordException, InvalidRequestPayloadException {
        return taskService.saveTask(task);
    }

    /**
     * This API is use to get all the Task
     *
     * @return
     */
    @GetMapping(value = "/get-all")
    public ResponseEntity<ResponseBean> getAllTask() {
        return taskService.getAllTask();
    }

    /**
     * This API used to Get Task By Title
     *
     * @param title
     * @return
     * @throws RecordNotFoundException
     */
    @GetMapping(value = "/get-by-title")
    public ResponseEntity<ResponseBean> getTaskByTitle(@RequestParam(value = "title") String title) throws RecordNotFoundException {
        return taskService.getTaskByTitle(title);
    }

    /**
     * This API is used to Sort the Tasks by Status : To Do, In Progress, Done
     *
     * @param status
     * @return
     * @throws RecordNotFoundException
     */
    @GetMapping(value = "/sort-task-by-status")
    public ResponseEntity<ResponseBean> sortTaskByStatus(@RequestParam(value = "status") String status) throws RecordNotFoundException, InvalidRequestPayloadException {
        return taskService.sortTaskByStatus(status);
    }

    /**
     * This API used to Get Task By status
     *
     * @param status
     * @return
     * @throws RecordNotFoundException
     */
    @GetMapping(value = "/get-by-status")
    public ResponseEntity<ResponseBean> getTaskByStatus(@RequestParam(value = "status") String status) throws RecordNotFoundException, InvalidRequestPayloadException {
        return taskService.getTaskByStatus(status);
    }

    /**
     * This API used to update the Task by Title.
     *
     * @param task
     * @return
     * @throws RecordNotFoundException
     */
    @PutMapping(value = "/update-task")
    public ResponseEntity<ResponseBean> updateTask(@RequestBody @Valid TaskVO task) throws RecordNotFoundException, InvalidRequestPayloadException {
        return taskService.updateTask(task);
    }

    /**
     * This API is used to Delete the Task by Title
     *
     * @param title
     * @return
     * @throws RecordNotFoundException
     */
    @GetMapping(value = "/delete-by-title")
    public ResponseEntity<ResponseBean> deleteTaskByTitle(@RequestParam(value = "title") String title) throws RecordNotFoundException {
        return taskService.deleteTaskByTitle(title);
    }
}
