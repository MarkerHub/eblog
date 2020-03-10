package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.UserMessage;
import com.example.mapper.UserMessageMapper;
import com.example.service.UserMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 公众号：java思维导图
 * @since 2019-11-17
 */
@Service
public class UserMessageServiceImpl extends ServiceImpl<UserMessageMapper, UserMessage> implements UserMessageService {

    @Autowired
    UserMessageMapper messageMapper;

    @Override
    public IPage paging(Page page, QueryWrapper<UserMessage> wrapper) {
        return messageMapper.selectMessages(page, wrapper);
    }

    @Override
    public void updateToReaded(List<Long> ids) {
        if(ids.isEmpty()) return;

        messageMapper.updateToReaded(new QueryWrapper<UserMessage>()
            .in("id", ids)
        );

    }
}
