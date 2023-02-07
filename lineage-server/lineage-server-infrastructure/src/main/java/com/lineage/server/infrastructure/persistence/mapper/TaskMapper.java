package com.lineage.server.infrastructure.persistence.mapper;

import static com.lineage.server.infrastructure.persistence.mapper.TaskDynamicSqlSupport.*;
import static org.mybatis.dynamic.sql.SqlBuilder.isEqualTo;

import com.lineage.server.infrastructure.persistence.model.TaskDO;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.dynamic.sql.BasicColumn;
import org.mybatis.dynamic.sql.delete.DeleteDSLCompleter;
import org.mybatis.dynamic.sql.select.CountDSLCompleter;
import org.mybatis.dynamic.sql.select.SelectDSLCompleter;
import org.mybatis.dynamic.sql.select.render.SelectStatementProvider;
import org.mybatis.dynamic.sql.update.UpdateDSL;
import org.mybatis.dynamic.sql.update.UpdateDSLCompleter;
import org.mybatis.dynamic.sql.update.UpdateModel;
import org.mybatis.dynamic.sql.util.SqlProviderAdapter;
import org.mybatis.dynamic.sql.util.mybatis3.CommonCountMapper;
import org.mybatis.dynamic.sql.util.mybatis3.CommonDeleteMapper;
import org.mybatis.dynamic.sql.util.mybatis3.CommonInsertMapper;
import org.mybatis.dynamic.sql.util.mybatis3.CommonUpdateMapper;
import org.mybatis.dynamic.sql.util.mybatis3.MyBatis3Utils;

@Mapper
public interface TaskMapper extends CommonCountMapper, CommonDeleteMapper, CommonInsertMapper<TaskDO>, CommonUpdateMapper {
    BasicColumn[] selectList = BasicColumn.columnList(taskId, taskName, descr, pluginId, catalogId, createUserId, modifyUserId, ctime, mtime, invalid, source);

    @SelectProvider(type=SqlProviderAdapter.class, method="select")
    @Results(id="TaskDOResult", value = {
        @Result(column="task_id", property="taskId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="task_name", property="taskName", jdbcType=JdbcType.VARCHAR),
        @Result(column="descr", property="descr", jdbcType=JdbcType.VARCHAR),
        @Result(column="plugin_id", property="pluginId", jdbcType=JdbcType.BIGINT),
        @Result(column="catalog_id", property="catalogId", jdbcType=JdbcType.BIGINT),
        @Result(column="create_user_id", property="createUserId", jdbcType=JdbcType.BIGINT),
        @Result(column="modify_user_id", property="modifyUserId", jdbcType=JdbcType.BIGINT),
        @Result(column="ctime", property="ctime", jdbcType=JdbcType.BIGINT),
        @Result(column="mtime", property="mtime", jdbcType=JdbcType.BIGINT),
        @Result(column="invalid", property="invalid", jdbcType=JdbcType.INTEGER),
        @Result(column="source", property="source", jdbcType=JdbcType.LONGVARCHAR)
    })
    List<TaskDO> selectMany(SelectStatementProvider selectStatement);

    @SelectProvider(type=SqlProviderAdapter.class, method="select")
    @ResultMap("TaskDOResult")
    Optional<TaskDO> selectOne(SelectStatementProvider selectStatement);

    default long count(CountDSLCompleter completer) {
        return MyBatis3Utils.countFrom(this::count, task, completer);
    }

    default int delete(DeleteDSLCompleter completer) {
        return MyBatis3Utils.deleteFrom(this::delete, task, completer);
    }

    default int deleteByPrimaryKey(Long taskId_) {
        return delete(c -> 
            c.where(taskId, isEqualTo(taskId_))
        );
    }

    default int insert(TaskDO row) {
        return MyBatis3Utils.insert(this::insert, row, task, c ->
            c.map(taskId).toProperty("taskId")
            .map(taskName).toProperty("taskName")
            .map(descr).toProperty("descr")
            .map(pluginId).toProperty("pluginId")
            .map(catalogId).toProperty("catalogId")
            .map(createUserId).toProperty("createUserId")
            .map(modifyUserId).toProperty("modifyUserId")
            .map(ctime).toProperty("ctime")
            .map(mtime).toProperty("mtime")
            .map(invalid).toProperty("invalid")
            .map(source).toProperty("source")
        );
    }

    default int insertMultiple(Collection<TaskDO> records) {
        return MyBatis3Utils.insertMultiple(this::insertMultiple, records, task, c ->
            c.map(taskId).toProperty("taskId")
            .map(taskName).toProperty("taskName")
            .map(descr).toProperty("descr")
            .map(pluginId).toProperty("pluginId")
            .map(catalogId).toProperty("catalogId")
            .map(createUserId).toProperty("createUserId")
            .map(modifyUserId).toProperty("modifyUserId")
            .map(ctime).toProperty("ctime")
            .map(mtime).toProperty("mtime")
            .map(invalid).toProperty("invalid")
            .map(source).toProperty("source")
        );
    }

    default int insertSelective(TaskDO row) {
        return MyBatis3Utils.insert(this::insert, row, task, c ->
            c.map(taskId).toPropertyWhenPresent("taskId", row::getTaskId)
            .map(taskName).toPropertyWhenPresent("taskName", row::getTaskName)
            .map(descr).toPropertyWhenPresent("descr", row::getDescr)
            .map(pluginId).toPropertyWhenPresent("pluginId", row::getPluginId)
            .map(catalogId).toPropertyWhenPresent("catalogId", row::getCatalogId)
            .map(createUserId).toPropertyWhenPresent("createUserId", row::getCreateUserId)
            .map(modifyUserId).toPropertyWhenPresent("modifyUserId", row::getModifyUserId)
            .map(ctime).toPropertyWhenPresent("ctime", row::getCtime)
            .map(mtime).toPropertyWhenPresent("mtime", row::getMtime)
            .map(invalid).toPropertyWhenPresent("invalid", row::getInvalid)
            .map(source).toPropertyWhenPresent("source", row::getSource)
        );
    }

    default Optional<TaskDO> selectOne(SelectDSLCompleter completer) {
        return MyBatis3Utils.selectOne(this::selectOne, selectList, task, completer);
    }

    default List<TaskDO> select(SelectDSLCompleter completer) {
        return MyBatis3Utils.selectList(this::selectMany, selectList, task, completer);
    }

    default List<TaskDO> selectDistinct(SelectDSLCompleter completer) {
        return MyBatis3Utils.selectDistinct(this::selectMany, selectList, task, completer);
    }

    default Optional<TaskDO> selectByPrimaryKey(Long taskId_) {
        return selectOne(c ->
            c.where(taskId, isEqualTo(taskId_))
        );
    }

    default int update(UpdateDSLCompleter completer) {
        return MyBatis3Utils.update(this::update, task, completer);
    }

    static UpdateDSL<UpdateModel> updateAllColumns(TaskDO row, UpdateDSL<UpdateModel> dsl) {
        return dsl.set(taskId).equalTo(row::getTaskId)
                .set(taskName).equalTo(row::getTaskName)
                .set(descr).equalTo(row::getDescr)
                .set(pluginId).equalTo(row::getPluginId)
                .set(catalogId).equalTo(row::getCatalogId)
                .set(createUserId).equalTo(row::getCreateUserId)
                .set(modifyUserId).equalTo(row::getModifyUserId)
                .set(ctime).equalTo(row::getCtime)
                .set(mtime).equalTo(row::getMtime)
                .set(invalid).equalTo(row::getInvalid)
                .set(source).equalTo(row::getSource);
    }

    static UpdateDSL<UpdateModel> updateSelectiveColumns(TaskDO row, UpdateDSL<UpdateModel> dsl) {
        return dsl.set(taskId).equalToWhenPresent(row::getTaskId)
                .set(taskName).equalToWhenPresent(row::getTaskName)
                .set(descr).equalToWhenPresent(row::getDescr)
                .set(pluginId).equalToWhenPresent(row::getPluginId)
                .set(catalogId).equalToWhenPresent(row::getCatalogId)
                .set(createUserId).equalToWhenPresent(row::getCreateUserId)
                .set(modifyUserId).equalToWhenPresent(row::getModifyUserId)
                .set(ctime).equalToWhenPresent(row::getCtime)
                .set(mtime).equalToWhenPresent(row::getMtime)
                .set(invalid).equalToWhenPresent(row::getInvalid)
                .set(source).equalToWhenPresent(row::getSource);
    }

    default int updateByPrimaryKey(TaskDO row) {
        return update(c ->
            c.set(taskName).equalTo(row::getTaskName)
            .set(descr).equalTo(row::getDescr)
            .set(pluginId).equalTo(row::getPluginId)
            .set(catalogId).equalTo(row::getCatalogId)
            .set(createUserId).equalTo(row::getCreateUserId)
            .set(modifyUserId).equalTo(row::getModifyUserId)
            .set(ctime).equalTo(row::getCtime)
            .set(mtime).equalTo(row::getMtime)
            .set(invalid).equalTo(row::getInvalid)
            .set(source).equalTo(row::getSource)
            .where(taskId, isEqualTo(row::getTaskId))
        );
    }

    default int updateByPrimaryKeySelective(TaskDO row) {
        return update(c ->
            c.set(taskName).equalToWhenPresent(row::getTaskName)
            .set(descr).equalToWhenPresent(row::getDescr)
            .set(pluginId).equalToWhenPresent(row::getPluginId)
            .set(catalogId).equalToWhenPresent(row::getCatalogId)
            .set(createUserId).equalToWhenPresent(row::getCreateUserId)
            .set(modifyUserId).equalToWhenPresent(row::getModifyUserId)
            .set(ctime).equalToWhenPresent(row::getCtime)
            .set(mtime).equalToWhenPresent(row::getMtime)
            .set(invalid).equalToWhenPresent(row::getInvalid)
            .set(source).equalToWhenPresent(row::getSource)
            .where(taskId, isEqualTo(row::getTaskId))
        );
    }
}