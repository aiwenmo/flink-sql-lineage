package com.lineage.server.domain.service;

import com.lineage.server.domain.entity.Task;

/**
 * @description: TaskDomainService
 * @author: HamaWhite
 * @version: 1.0.0
 * @date: 2023/1/23 4:50 PM
 */
public interface TaskDomainService {

    void buildTaskSql(Task task);
}