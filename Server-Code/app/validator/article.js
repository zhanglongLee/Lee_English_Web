import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class AddArticleValidator extends LinValidator {
  constructor() {
    super();
    this.image = [
      new Rule('isOptional')
    ];
    this.title = [
      new Rule('isNotEmpty', '文章标题不能为空')
    ];
    this.description = [
      new Rule('isNotEmpty', '文章描述不能为空')
    ];
    this.content = [
      new Rule('isNotEmpty', '文章内容不能为空')
    ];
    this.author = [
      new Rule('isNotEmpty', '文章作者不能为空')
    ];
    this.published_time = [
      new Rule('isNotEmpty', '发布日期不能为空'),
    ];
    this.is_published = [
      new Rule('isNotEmpty', '发布状态不能为空'),
    ];
    this.is_comment_enabled = [
      new Rule('isNotEmpty', '评论区开关状态不能为空'),
    ];
    this.is_top = [
      new Rule('isNotEmpty', '置顶状态不能为空'),
    ];
    this.categoryId = [
      new Rule('isNotEmpty', '分类ID不能为空'),
      new Rule('isInt', '分类ID必须是数字')
    ];
  }
};

class ArticleSearchValidator extends LinValidator {
  constructor () {
    super();
    this.q = new Rule('isNotEmpty', '必须传入搜索关键字');
  }
}

class EditArticleValidator extends AddArticleValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ]
  }
}

class DeleteArticleValidator extends LinValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}
module.exports = { AddArticleValidator, EditArticleValidator, DeleteArticleValidator,ArticleSearchValidator };