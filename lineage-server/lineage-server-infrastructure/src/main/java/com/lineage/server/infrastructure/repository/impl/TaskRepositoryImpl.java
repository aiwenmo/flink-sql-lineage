package com.lineage.server.infrastructure.repository.impl;

import com.lineage.server.domain.entity.Task;
import com.lineage.server.domain.repository.TaskRepository;
import com.lineage.server.domain.types.TaskId;
import com.lineage.server.infrastructure.persistence.converter.TaskConverter;
import com.lineage.server.infrastructure.persistence.mapper.TaskMapper;
import com.lineage.server.infrastructure.persistence.model.TaskDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @description: TaskRepositoryImpl
 * @author: HamaWhite
 * @version: 1.0.0
 * @date: 2023/1/23 10:27 PM
 */
@Repository
public class TaskRepositoryImpl implements TaskRepository {
    @Autowired
    private TaskMapper taskMapper;

    @Autowired
    private TaskConverter taskConverter;

    @Override
    public Task find(TaskId taskId) {
        TaskDO taskDO = taskMapper.selectByPrimaryKey(taskId.getValue()).get();
        return taskConverter.toTask(taskDO);
    }

    @Override
    public Task save(Task task) {
        TaskDO taskDO = taskConverter.fromTask(task);
        if (taskDO.getTaskId() == null) {
            taskMapper.insert(taskDO);
        } else {
            taskMapper.updateByPrimaryKey(taskDO);
        }
        return task;
    }
}