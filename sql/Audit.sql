--4a
BEGIN
    dbms_fga.ADD_POLICY (
        OBJECT_SCHEMA => 'NVQUANTRI',
        OBJECT_NAME => 'PHANCONG', --Bang Phan cong hoac View Phan cong
        POLICY_NAME => 'AUDIT_UPDATE_THOIGIAN_PHANCONG',
        AUDIT_COLUMN => 'THOIGIAN',
        STATEMENT_TYPES => 'UPDATE',
        ENABLE => TRUE);
END;

--4b
BEGIN
    dbms_fga.ADD_POLICY (
        OBJECT_SCHEMA => 'NVQUANTRI',
        OBJECT_NAME => 'NHANVIEN',
        POLICY_NAME => 'AUDIT_SELECT_LUONG_PHUCAP',
        AUDIT_COLUMN => 'LUONG, PHUCAP',
        AUDIT_CONDITION => 'USERNAME <> SYS_CONTEXT(''USERENV'',''SESSION_USER'')',
        STATEMENT_TYPES => 'SELECT',
        ENABLE => TRUE);
END;

--4c
BEGIN
    dbms_fga.ADD_POLICY (
        OBJECT_SCHEMA => 'NVQUANTRI',
        OBJECT_NAME => 'NHANVIEN',
        POLICY_NAME => 'AUDIT_UPDATE_LUONG_PHUCAP',
        AUDIT_COLUMN => 'LUONG, PHUCAP',
        AUDIT_CONDITION => 'VAITRO <> ''TAICHINH''',
        STATEMENT_TYPES => 'UPDATE',
        ENABLE => TRUE);
END;