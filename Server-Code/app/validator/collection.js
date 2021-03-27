import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class DeleteCollectionValidator extends LinValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
    this.type = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}
class AddCollectionValidator extends DeleteCollectionValidator {
  constructor() {
    super();
    this.web_user_id = [
      new Rule('isNotEmpty', '用户id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
};
module.exports = { AddCollectionValidator, DeleteCollectionValidator };