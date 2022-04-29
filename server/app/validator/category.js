import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class AddCategoryValidator extends LinValidator {
  constructor() {
    super();
    this.category_name = [
      new Rule('isNotEmpty','分类名称不能为空')
    ];
  }
};



class EditCategoryValidator extends AddCategoryValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ]
  }
}

class DeleteCategoryValidator extends LinValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}
module.exports = { AddCategoryValidator, EditCategoryValidator, DeleteCategoryValidator };