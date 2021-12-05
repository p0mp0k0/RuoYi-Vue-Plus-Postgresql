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
 * OSS对象存储对象
 *
 * @author Lion Li
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_oss")
@KeySequence("sys_oss_oss_id_seq")
public class SysOss extends BaseEntity {

	/**
	 * 对象存储主键
	 */
	@TableId(value = "oss_id", type = IdType.AUTO)
	private Long ossId;

	/**
	 * 文件名
	 */
	private String fileName;

	/**
	 * 原名
	 */
	private String originalName;

	/**
	 * 文件后缀名
	 */
	private String fileSuffix;

	/**
	 * URL地址
	 */
	private String url;

	/**
	 * 服务商
	 */
	private String service;

}
