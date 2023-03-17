-- copy it from the mysql script, remember to replace all 'lineage.' with an empty string

INSERT INTO  bas_user (user_id, username, password, locked, create_time, modify_time, invalid) VALUES (1, 'demo', 'demo', 0, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_user (user_id, username, password, locked, create_time, modify_time, invalid) VALUES (2, 'admin', 'admin', 0, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_user (user_id, username, password, locked, create_time, modify_time, invalid) VALUES (3, 'HamaWhite', '123456', 0, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_user (user_id, username, password, locked, create_time, modify_time, invalid) VALUES (4, 'Asteria', '123456', 0, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_user (user_id, username, password, locked, create_time, modify_time, invalid) VALUES (5, 'Cattleya', '123456', 0, 1674565178000, 1674565178000, 0);

INSERT INTO  bas_role (role_id, role_name, create_time, modify_time, invalid) VALUES (1, 'USER', 1674565178000, 1674565178000, 0);
INSERT INTO  bas_role (role_id, role_name, create_time, modify_time, invalid) VALUES (2, 'ADMIN', 1674565178000, 1674565178000, 0);

INSERT INTO  rel_role_user (rid, role_id, user_id, invalid) VALUES (1, 1, 1, 0);
INSERT INTO  rel_role_user (rid, role_id, user_id, invalid) VALUES (2, 2, 2, 0);
INSERT INTO  rel_role_user (rid, role_id, user_id, invalid) VALUES (3, 1, 3, 0);
INSERT INTO  rel_role_user (rid, role_id, user_id, invalid) VALUES (4, 1, 4, 0);
INSERT INTO  rel_role_user (rid, role_id, user_id, invalid) VALUES (5, 1, 5, 0);

INSERT INTO  bas_permission (permission_id, permission_group, permission_name, permission_code, create_time, modify_time, invalid) VALUES (1, 'plugins', 'add plugin', 'system:plugin:add', 1674565178000, 1674565178000, 0);
INSERT INTO  bas_permission (permission_id, permission_group, permission_name, permission_code, create_time, modify_time, invalid) VALUES (2, 'plugins', 'edit plugin', 'system:plugin:edit', 1674565178000, 1674565178000, 0);
INSERT INTO  bas_permission (permission_id, permission_group, permission_name, permission_code, create_time, modify_time, invalid) VALUES (3, 'plugins', 'delete plugin', 'system:plugin:delete', 1674565178000, 1674565178000, 0);
INSERT INTO  bas_permission (permission_id, permission_group, permission_name, permission_code, create_time, modify_time, invalid) VALUES (4, 'plugins', 'disable plugin', 'system:plugin:disable', 1674565178000, 1674565178000, 0);
INSERT INTO  bas_permission (permission_id, permission_group, permission_name, permission_code, create_time, modify_time, invalid) VALUES (5, 'plugins', 'list plugin', 'system:plugin:list', 1674565178000, 1674565178000, 0);

INSERT INTO  rel_role_permission (rid, role_id, permission_id, invalid) VALUES (1, 1, 5, 0);
INSERT INTO  rel_role_permission (rid, role_id, permission_id, invalid) VALUES (2, 2, 1, 0);
INSERT INTO  rel_role_permission (rid, role_id, permission_id, invalid) VALUES (3, 2, 2, 0);
INSERT INTO  rel_role_permission (rid, role_id, permission_id, invalid) VALUES (4, 2, 3, 0);
INSERT INTO  rel_role_permission (rid, role_id, permission_id, invalid) VALUES (5, 2, 4, 0);
INSERT INTO  rel_role_permission (rid, role_id, permission_id, invalid) VALUES (6, 2, 5, 0);

INSERT INTO  bas_plugin (plugin_id, plugin_name, plugin_code, descr, default_plugin, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (1, 'Flink1.16', 'flink1.16.x', 'Field lineage plugin for flink1.16', 1, 2, 2, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_plugin (plugin_id, plugin_name, plugin_code, descr, default_plugin, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (2, 'Flink1.14', 'flink1.14.x', 'Field lineage plugin for flink1.14', 0, 2, 2, 1674565178000, 1674565178000, 0);

INSERT INTO  bas_catalog (catalog_id, plugin_id, catalog_name, catalog_type, default_database, descr, catalog_properties, default_catalog, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (1, 1, 'Flink1_16_Memory', 'generic_in_memory', 'default', 'The MemoryCatalog is an in-memory implementation of a catalog. All objects will be available only for the lifetime of the session.', null, 1, 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_catalog (catalog_id, plugin_id, catalog_name, catalog_type, default_database, descr, catalog_properties, default_catalog, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (2, 1, 'Flink1_16_Jdbc', 'jdbc', 'default', 'The JdbcCatalog enables users to connect Flink to relational databases over JDBC protocol. Postgres Catalog and MySQL Catalog are the only two implementations of JDBC Catalog at the moment.', null, 0, 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_catalog (catalog_id, plugin_id, catalog_name, catalog_type, default_database, descr, catalog_properties, default_catalog, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (3, 1, 'Flink1_16_Hive', 'hive', 'default', 'The HiveCatalog serves two purposes; as persistent storage for pure Flink metadata, and as an interface for reading and writing existing Hive metadata.', null, 0, 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_catalog (catalog_id, plugin_id, catalog_name, catalog_type, default_database, descr, catalog_properties, default_catalog, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (4, 2, 'Flink1_14_Memory', 'generic_in_memory', 'default', 'The MemoryCatalog is an in-memory implementation of a catalog. All objects will be available only for the lifetime of the session.', null, 0, 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_catalog (catalog_id, plugin_id, catalog_name, catalog_type, default_database, descr, catalog_properties, default_catalog, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (5, 2, 'Flink1_14_Jdbc', 'jdbc', 'default', 'The JdbcCatalog enables users to connect Flink to relational databases over JDBC protocol. Postgres Catalog and MySQL Catalog are the only two implementations of JDBC Catalog at the moment.', null, 0, 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_catalog (catalog_id, plugin_id, catalog_name, catalog_type, default_database, descr, catalog_properties, default_catalog, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (6, 2, 'Flink1_14_Hive', 'hive', 'default', 'The HiveCatalog serves two purposes; as persistent storage for pure Flink metadata, and as an interface for reading and writing existing Hive metadata.', null, 0, 1, 1, 1674565178000, 1674565178000, 0);

INSERT INTO  bas_task (task_id, catalog_id, task_name, descr, `database`, task_source, task_status, task_log, table_graph, column_graph, lineage_time, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (1, 1, 'first_demo', 'first demo task', 'default', 'RFJPUCBUQUJMRSBJRiBFWElTVFMgb2RzX215c3FsX3VzZXJzOwpDUkVBVEUgVEFCTEUgSUYgTk9UIEVYSVNUUyBvZHNfbXlzcWxfdXNlcnMgKAogICAgaWQgQklHSU5UIFBSSU1BUlkgS0VZIE5PVCBFTkZPUkNFRCwKICAgIG5hbWUgU1RSSU5HLAogICAgYmlydGhkYXkgVElNRVNUQU1QKDMpLAogICAgdHMgVElNRVNUQU1QKDMpLAogICAgcHJvY190aW1lIGFzIHByb2N0aW1lICgpCiAgKQpXSVRICiAgKAogICAgJ2Nvbm5lY3Rvcic9J215c3FsLWNkYycsCiAgICAnaG9zdG5hbWUnPScxMjcuMC4wLjEnLAogICAgJ3BvcnQnPSczMzA2JywKICAgICd1c2VybmFtZSc9J3Jvb3QnLAogICAgJ3Bhc3N3b3JkJz0neHh4JywKICAgICdzZXJ2ZXItdGltZS16b25lJz0nQXNpYS9TaGFuZ2hhaScsCiAgICAnZGF0YWJhc2UtbmFtZSc9J2RlbW8nLAogICAgJ3RhYmxlLW5hbWUnPSd1c2VycycKICApOwoKCkRST1AgVEFCTEUgSUYgRVhJU1RTIGR3ZF9odWRpX3VzZXJzOwpDUkVBVEUgVEFCTEUgSUYgTk9UIEVYSVNUUwogIGR3ZF9odWRpX3VzZXJzICgKICAgIGlkIEJJR0lOVCBQUklNQVJZIEtFWSBOT1QgRU5GT1JDRUQsCiAgICBuYW1lIFNUUklORywKICAgIGNvbXBhbnlfbmFtZSBTVFJJTkcsCiAgICBiaXJ0aGRheSBUSU1FU1RBTVAoMyksCiAgICB0cyBUSU1FU1RBTVAoMyksCiAgICBgcGFydGl0aW9uYCBWQVJDSEFSKDIwKQogICkgUEFSVElUSU9ORUQgQlkgKGBwYXJ0aXRpb25gKQpXSVRICiAgKAogICAgJ2Nvbm5lY3Rvcic9J2h1ZGknLAogICAgJ3RhYmxlLnR5cGUnPSdDT1BZX09OX1dSSVRFJywKICAgICdyZWFkLnN0cmVhbWluZy5lbmFibGVkJz0ndHJ1ZScsCiAgICAncmVhZC5zdHJlYW1pbmcuY2hlY2staW50ZXJ2YWwnPScxJwogICk7CgoKSU5TRVJUIElOVE8KICBkd2RfaHVkaV91c2VycwpTRUxFQ1QKICBpZCwKICBuYW1lLAogIG5hbWUgYXMgY29tcGFueV9uYW1lLAogIGJpcnRoZGF5LAogIHRzLAogIERBVEVfRk9STUFUKGJpcnRoZGF5LCAneXl5eU1NZGQnKQpGUk9NCiAgb2RzX215c3FsX3VzZXJzOw==', null, null, null, null, null, 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO  bas_task (task_id, catalog_id, task_name, descr, `database`, task_source, task_status, task_log, table_graph, column_graph, lineage_time, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (2, 4, 'second_demo', 'second demo task', 'default', 'RFJPUCBUQUJMRSBJRiBFWElTVFMgb2RzX215c3FsX3VzZXJzOwpDUkVBVEUgVEFCTEUgSUYgTk9UIEVYSVNUUyBvZHNfbXlzcWxfdXNlcnMgKAogICAgaWQgQklHSU5UIFBSSU1BUlkgS0VZIE5PVCBFTkZPUkNFRCwKICAgIG5hbWUgU1RSSU5HLAogICAgYmlydGhkYXkgVElNRVNUQU1QKDMpLAogICAgdHMgVElNRVNUQU1QKDMpLAogICAgcHJvY190aW1lIGFzIHByb2N0aW1lICgpCiAgKQpXSVRICiAgKAogICAgJ2Nvbm5lY3Rvcic9J215c3FsLWNkYycsCiAgICAnaG9zdG5hbWUnPScxMjcuMC4wLjEnLAogICAgJ3BvcnQnPSczMzA2JywKICAgICd1c2VybmFtZSc9J3Jvb3QnLAogICAgJ3Bhc3N3b3JkJz0neHh4JywKICAgICdzZXJ2ZXItdGltZS16b25lJz0nQXNpYS9TaGFuZ2hhaScsCiAgICAnZGF0YWJhc2UtbmFtZSc9J2RlbW8nLAogICAgJ3RhYmxlLW5hbWUnPSd1c2VycycKICApOwoKCkRST1AgVEFCTEUgSUYgRVhJU1RTIGR3ZF9odWRpX3VzZXJzOwpDUkVBVEUgVEFCTEUgSUYgTk9UIEVYSVNUUwogIGR3ZF9odWRpX3VzZXJzICgKICAgIGlkIEJJR0lOVCBQUklNQVJZIEtFWSBOT1QgRU5GT1JDRUQsCiAgICBuYW1lIFNUUklORywKICAgIGNvbXBhbnlfbmFtZSBTVFJJTkcsCiAgICBiaXJ0aGRheSBUSU1FU1RBTVAoMyksCiAgICB0cyBUSU1FU1RBTVAoMyksCiAgICBgcGFydGl0aW9uYCBWQVJDSEFSKDIwKQogICkgUEFSVElUSU9ORUQgQlkgKGBwYXJ0aXRpb25gKQpXSVRICiAgKAogICAgJ2Nvbm5lY3Rvcic9J2h1ZGknLAogICAgJ3RhYmxlLnR5cGUnPSdDT1BZX09OX1dSSVRFJywKICAgICdyZWFkLnN0cmVhbWluZy5lbmFibGVkJz0ndHJ1ZScsCiAgICAncmVhZC5zdHJlYW1pbmcuY2hlY2staW50ZXJ2YWwnPScxJwogICk7CgoKSU5TRVJUIElOVE8KICBkd2RfaHVkaV91c2VycwpTRUxFQ1QKICBpZCwKICBuYW1lLAogIG5hbWUgYXMgY29tcGFueV9uYW1lLAogIGJpcnRoZGF5LAogIHRzLAogIERBVEVfRk9STUFUKGJpcnRoZGF5LCAneXl5eU1NZGQnKQpGUk9NCiAgb2RzX215c3FsX3VzZXJzOw==', null, null, null, null, null, 1, 1, 1674565178000, 1674565178000, 0);

INSERT INTO bas_function (function_id, catalog_id, function_name, `database`, invocation, function_path, class_name, descr, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (1, 1, 'flink_suffix_udf', 'default', 'flink_suffix_udf(String1)', 'functions/function-a/function-a.jar', 'com.hw.lineage.flink.table.udf.functiona.FlinkSuffixFunction', 'return String', 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO bas_function (function_id, catalog_id, function_name, `database`, invocation, function_path, class_name, descr, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (2, 1, 'flink_prefix_udf', 'default', 'flink_prefix_udf(String1,Integer2)', 'functions/function-b/function-b.jar', 'com.hw.lineage.flink.table.udf.functionb.FlinkPrefixFunction', 'return String', 1, 1, 1674565178000, 1674565178000, 0);
INSERT INTO bas_function (function_id, catalog_id, function_name, `database`, invocation, function_path, class_name, descr, create_user_id, modify_user_id, create_time, modify_time, invalid) VALUES (3, 1, 'flink_split_udtf', 'default', 'flink_split_udtf(String1)', 'functions/function-b/function-b.jar', 'com.hw.lineage.flink.table.udf.functionb.FlinkSplitFunction', 'return ROW<word STRING, length INT>', 1, 1, 1674565178000, 1674565178000, 0);
