package com.task.controller;

import com.task.exception.DuplicateRecordException;
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

    @PostMapping(value = "/save")
    public ResponseEntity<ResponseBean> saveTask(@RequestBody @Valid TaskVO task) throws DuplicateRecordException {
        return taskService.saveTask(task);
    }

    @GetMapping(value = "/get-all")
    public ResponseEntity<ResponseBean> getAllTask() {
        return taskService.getAllTask();
    }

    @GetMapping(value = "/get-by-title")
    public ResponseEntity<ResponseBean> getTaskByTitle(@RequestParam(value = "title") String title) throws RecordNotFoundException {
        return taskService.getTaskByTitle(title);
    }

    @GetMapping(value = "/get-by-status")
    public ResponseEntity<ResponseBean> getTaskByStatus(@RequestParam(value = "status") String status) throws RecordNotFoundException {
        return taskService.getTaskByStatus(status);
    }

    @PutMapping(value = "/update")
    public ResponseEntity<ResponseBean> updateTask(@RequestBody @Valid TaskVO task) throws RecordNotFoundException {
        return taskService.updateTask(task);
    }

    @GetMapping(value = "/delete-by-title")
    public ResponseEntity<ResponseBean> deleteTaskByTitle(@RequestParam(value = "title") String title) throws RecordNotFoundException {
        return taskService.deleteTaskByTitle(title);
    }
}
