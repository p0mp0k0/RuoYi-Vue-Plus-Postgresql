package com.ruoyi.common.core.domain.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.convert.ExcelDictConvert;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 字典类型表 sys_dict_type
 *
 * @author Lion Li
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dict_type")
@ExcelIgnoreUnannotated
@ApiModel("字典类型业务对象")
@KeySequence("sys_dict_type_dict_id_seq")
public class SysDictType extends BaseEntity {

	/**
	 * 字典主键
	 */
	@ApiModelProperty(value = "字典主键")
	@ExcelProperty(value = "字典主键")
	@TableId(value = "dict_id", type = IdType.AUTO)
	private Long dictId;

	/**
	 * 字典名称
	 */
	@ApiModelProperty(value = "字典名称")
	@ExcelProperty(value = "字典名称")
	@NotBlank(message = "字典名称不能为空")
	@Size(min = 0, max = 100, message = "字典类型名称长度不能超过100个字符")
	private String dictName;

	/**
	 * 字典类型
	 */
	@ApiModelProperty(value = "字典类型")
	@ExcelProperty(value = "字典类型")
	@NotBlank(message = "字典类型不能为空")
	@Size(min = 0, max = 100, message = "字典类型类型长度不能超过100个字符")
	private String dictType;

	/**
	 * 状态（0正常 1停用）
	 */
	@ApiModelProperty(value = "状态（0正常 1停用）")
	@ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
	@ExcelDictFormat(dictType = "sys_normal_disable")
	private String status;

	/**
	 * 备注
	 */
	@ApiModelProperty(value = "备注")
	private String remark;

}
