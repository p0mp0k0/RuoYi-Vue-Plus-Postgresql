package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 对象存储配置对象 sys_oss_config
 *
 * @author Lion Li
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_oss_config")
@KeySequence("sys_oss_config_oss_config_id_seq")
public class SysOssConfig extends BaseEntity {

    /**
     * 主建
     */
    @TableId(value = "oss_config_id", type = IdType.AUTO)
    private Integer ossConfigId;

    /**
     * 配置key
     */
    private String configKey;

    /**
     * accessKey
     */
    private String accessKey;

    /**
     * 秘钥
     */
    private String secretKey;

    /**
     * 桶名称
     */
    private String bucketName;

    /**
     * 前缀
     */
    private String prefix;

    /**
     * 访问站点
     */
    private String endpoint;

    /**
     * 是否https（0否 1是）
     */
    private String isHttps;

    /**
     * 域
     */
    private String region;

    /**
     * 状态(0正常 1停用)
     */
    private String status;

    /**
     * 扩展字段
     */
    private String ext1;

    /**
     * 备注
     */
    private String remark;

}
