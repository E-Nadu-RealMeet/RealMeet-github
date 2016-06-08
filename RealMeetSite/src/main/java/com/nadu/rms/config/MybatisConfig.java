package com.nadu.rms.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.transaction.TransactionConfiguration;

@Configuration
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=true)
@MapperScan()
public class MybatisConfig {

}
