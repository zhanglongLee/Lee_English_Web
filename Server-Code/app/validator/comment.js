import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class AddCommentValidator extends LinValidator {
  constructor() {
    super();
    this.image = [
      new Rule('isNotEmpty', '用户头像不能为空')
    ];
    this.web_user_id = [
      new Rule('isNotEmpty', '用户ID不能为空'),
      new Rule('isInt', '用户ID必须是数字')
    ];
    this.content = [
      new Rule('isNotEmpty', '评论不能为空')
    ];
    this.is_published = [
      new Rule('isOptional', '发布状态不能为空'),
    ];
    this.article_id = [
      new Rule('isNotEmpty', '文章ID不能为空'),
      new Rule('isInt', '文章ID必须是数字')
    ];
    this.parent_comment_id = [
      new Rule('isNotEmpty', '父评论id不能为空'),
      new Rule('isInt', '父评论id必须是数字')
    ];
  }
};

class CommentSearchValidator extends LinValidator {
  constructor () {
    super();
    this.q = new Rule('isNotEmpty', '必须传入搜索关键字');
  }
}

class EditCommentValidator extends AddCommentValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ]
  }
}

class DeleteCommentValidator extends LinValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}
module.exports = { AddCommentValidator, EditCommentValidator, DeleteCommentValidator,CommentSearchValidator };