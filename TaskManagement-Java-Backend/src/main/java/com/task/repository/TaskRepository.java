package com.task.repository;

import com.task.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Integer> {
    Task findByTitle(String title);

    @Query(nativeQuery = true, value = "Delete from task t where t.title=?1")
    void deleteByTitle(String title);

    List<Task> findAllByStatus(String status);
}
