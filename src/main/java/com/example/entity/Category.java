package com.example.entity;

import com.example.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 公众号：java思维导图
 * @since 2019-11-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Category extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 标题
     */
    private String name;

    /**
     * 内容描述
     */
    private String content;

    private String summary;

    /**
     * 图标
     */
    private String icon;

    /**
     * 该分类的内容数量
     */
    private Integer postCount;

    /**
     * 排序编码
     */
    private Integer orderNum;

    /**
     * 父级分类的ID
     */
    private Long parentId;

    /**
     * SEO关键字
     */
    private String metaKeywords;

    /**
     * SEO描述内容
     */
    private String metaDescription;


}
