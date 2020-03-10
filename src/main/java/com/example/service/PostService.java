package com.example.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.Post;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.vo.PostVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 公众号：java思维导图
 * @since 2019-11-17
 */
public interface PostService extends IService<Post> {

    IPage paging(Page page, Long categoryId, Long userId, Integer level, Boolean recommend, String order);

    PostVo selectOnePost(QueryWrapper<Post> wrapper);

    void initWeekRank();

    void incrCommentCountAndUnionForWeekRank(long postId, boolean isIncr);

    void putViewCount(PostVo vo);
}
