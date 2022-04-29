import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class AddHistoryValidator extends LinValidator {
  constructor() {
    super();
    this.articleId = [
      new Rule('isNotEmpty', '文章ID不能为空'),
      new Rule('isInt', '文章ID必须是数字')
    ];
  }
};

class DeleteHistoryValidator extends AddHistoryValidator {
  constructor() {
    super();
  }
}

module.exports = { AddHistoryValidator, DeleteHistoryValidator };