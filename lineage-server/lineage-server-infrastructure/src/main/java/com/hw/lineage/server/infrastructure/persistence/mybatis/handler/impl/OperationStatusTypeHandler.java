package com.hw.lineage.server.infrastructure.persistence.mybatis.handler.impl;

import com.hw.lineage.common.enums.audit.OperationStatus;
import com.hw.lineage.server.infrastructure.persistence.mybatis.handler.IntEnumTypeHandler;

/**
 * @description: OperationStatusTypeHandler
 * @author: HamaWhite
 * @version: 1.0.0
 */
public class OperationStatusTypeHandler extends IntEnumTypeHandler<OperationStatus> {
    public OperationStatusTypeHandler() {
        super(OperationStatus.class);
    }
}
