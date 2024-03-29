package com.ruoyi.common.core.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.ruoyi.common.core.domain.TreeEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 部门表 sys_dept
 *
 * @author Lion Li
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dept")
@KeySequence("sys_dept_dept_id_seq")
@ApiModel("部门业务对象")
public class SysDept extends TreeEntity {
	private static final long serialVersionUID = 1L;

	/**
	 * 部门ID
	 */
	@ApiModelProperty(value = "部门id")
	@TableId(value = "dept_id", type = IdType.AUTO)
	private Long deptId;

	/**
	 * 部门名称
	 */
	@ApiModelProperty(value = "部门名称")
	@NotBlank(message = "部门名称不能为空")
	@Size(min = 0, max = 30, message = "部门名称长度不能超过30个字符")
	private String deptName;

	/**
	 * 显示顺序
	 */
	@ApiModelProperty(value = "显示顺序")
	@NotBlank(message = "显示顺序不能为空")
	private String orderNum;

	/**
	 * 负责人
	 */
	@ApiModelProperty(value = "负责人")
	private String leader;

	/**
	 * 联系电话
	 */
	@ApiModelProperty(value = "联系电话")
	@Size(min = 0, max = 11, message = "联系电话长度不能超过11个字符")
	private String phone;

	/**
	 * 邮箱
	 */
	@ApiModelProperty(value = "邮箱")
	@Email(message = "邮箱格式不正确")
	@Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
	private String email;

	/**
	 * 部门状态:0正常,1停用
	 */
	@ApiModelProperty(value = "部门状态:0正常,1停用")
	private String status;

	/**
	 * 删除标志（0代表存在 2代表删除）
	 */
	@ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
	@TableLogic
	private String delFlag;

	/**
	 * 祖级列表
	 */
	@ApiModelProperty(value = "祖级列表")
	private String ancestors;

}
