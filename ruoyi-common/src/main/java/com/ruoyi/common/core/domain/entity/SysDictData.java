package com.ruoyi.common.core.domain.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.constant.UserConstants;
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
 * 字典数据表 sys_dict_data
 *
 * @author Lion Li
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dict_data")
@KeySequence("sys_dict_data_dict_code_seq")
@ExcelIgnoreUnannotated
@ApiModel("字典数据业务对象")
public class SysDictData extends BaseEntity {

	/**
	 * 字典编码
	 */
	@ApiModelProperty(value = "字典编码")
	@ExcelProperty(value = "字典编码")
	@TableId(value = "dict_code", type = IdType.AUTO)
	private Long dictCode;

	/**
	 * 字典排序
	 */
	@ApiModelProperty(value = "字典排序")
	@ExcelProperty(value = "字典排序")
	private Long dictSort;

	/**
	 * 字典标签
	 */
	@ApiModelProperty(value = "字典标签")
	@ExcelProperty(value = "字典标签")
	@NotBlank(message = "字典标签不能为空")
	@Size(min = 0, max = 100, message = "字典标签长度不能超过100个字符")
	private String dictLabel;

	/**
	 * 字典键值
	 */
	@ApiModelProperty(value = "字典键值")
	@ExcelProperty(value = "字典键值")
	@NotBlank(message = "字典键值不能为空")
	@Size(min = 0, max = 100, message = "字典键值长度不能超过100个字符")
	private String dictValue;

	/**
	 * 字典类型
	 */
	@ApiModelProperty(value = "字典类型")
	@ExcelProperty(value = "字典类型")
	@NotBlank(message = "字典类型不能为空")
	@Size(min = 0, max = 100, message = "字典类型长度不能超过100个字符")
	private String dictType;

	/**
	 * 样式属性（其他样式扩展）
	 */
	@ApiModelProperty(value = "样式属性（其他样式扩展）")
	@Size(min = 0, max = 100, message = "样式属性长度不能超过100个字符")
	private String cssClass;

	/**
	 * 表格字典样式
	 */
	@ApiModelProperty(value = "表格字典样式")
	private String listClass;

	/**
	 * 是否默认（Y是 N否）
	 */
	@ApiModelProperty(value = "是否默认（Y是 N否）")
	@ExcelProperty(value = "是否默认", converter = ExcelDictConvert.class)
	@ExcelDictFormat(dictType = "sys_yes_no")
	private String isDefault;

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

	public boolean getDefault() {
		return UserConstants.YES.equals(this.isDefault);
	}

}
