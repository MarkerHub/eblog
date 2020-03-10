package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.Comment;
import com.example.mapper.CommentMapper;
import com.example.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.vo.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 公众号：java思维导图
 * @since 2019-11-17
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    @Autowired
    CommentMapper commentMapper;

    @Override
    public IPage<CommentVo> paing(Page page, Long postId, Long userId, String order) {
        return commentMapper.selectComments(page, new QueryWrapper<Comment>()
                .eq(postId != null, "post_id", postId)
                .eq(userId != null, "user_id", userId)
                .orderByDesc(order != null, order)
        );
    }
}
