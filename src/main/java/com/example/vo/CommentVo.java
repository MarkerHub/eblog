package com.example.vo;

import com.example.entity.Comment;
import lombok.Data;

@Data
public class CommentVo extends Comment {

    private Long authorId;
    private String authorName;
    private String authorAvatar;

}
