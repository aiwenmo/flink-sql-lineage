package com.lineage.server.infrastructure.repository.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.page.PageMethod;
import com.hw.lineage.common.exception.LineageException;
import com.hw.lineage.common.util.PageUtils;
import com.lineage.server.domain.entity.Plugin;
import com.lineage.server.domain.query.plugin.PluginQuery;
import com.lineage.server.domain.repository.PluginRepository;
import com.lineage.server.domain.vo.PluginId;
import com.lineage.server.infrastructure.persistence.converter.DataConverter;
import com.lineage.server.infrastructure.persistence.dos.PluginDO;
import com.lineage.server.infrastructure.persistence.mapper.PluginMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

import static com.lineage.server.infrastructure.persistence.mapper.PluginDynamicSqlSupport.pluginName;
import static org.mybatis.dynamic.sql.SqlBuilder.isEqualTo;
import static org.mybatis.dynamic.sql.SqlBuilder.isLike;

/**
 * @description: PluginRepositoryImpl
 * @author: HamaWhite
 * @version: 1.0.0
 * @date: 2023/2/5 12:20 PM
 */
@Repository
public class PluginRepositoryImpl extends AbstractBasicRepository implements PluginRepository {

    @Resource
    private PluginMapper pluginMapper;

    @Resource
    private DataConverter converter;

    @Override
    public Plugin find(PluginId pluginId) {
        PluginDO pluginDO = pluginMapper.selectByPrimaryKey(pluginId.getValue())
                .orElseThrow(() -> new LineageException(String.format("pluginId [%s] is not existed", pluginId.getValue())));
        return converter.toPlugin(pluginDO);
    }

    @Override
    public boolean find(String name) {
        return !pluginMapper.select(completer -> completer.where(pluginName, isEqualTo(name))).isEmpty();
    }

    @Override
    public Plugin save(Plugin plugin) {
        PluginDO pluginDO = converter.fromPlugin(plugin);
        if (pluginDO.getPluginId() == null) {
            pluginMapper.insertSelective(pluginDO);
        } else {
            pluginMapper.updateByPrimaryKeySelective(pluginDO);
        }
        return converter.toPlugin(pluginDO);
    }

    @Override
    public void remove(PluginId pluginId) {
        pluginMapper.deleteByPrimaryKey(pluginId.getValue());
    }

    @Override
    public PageInfo<Plugin> findAll(PluginQuery pluginQuery) {
        try (Page<PluginDO> page = PageMethod.startPage(pluginQuery.getPageNum(), pluginQuery.getPageSize())) {
            PageInfo<PluginDO> pageInfo = page.doSelectPageInfo(() ->
                    pluginMapper.select(completer ->
                            completer.where(pluginName, isLike(buildLikeValue(pluginQuery.getPluginName())))
                                    .orderBy(buildSortSpecification(pluginQuery))
                    )
            );
            return PageUtils.convertPage(pageInfo, converter::toPlugin);
        }
    }
}