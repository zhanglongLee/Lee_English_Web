import { LinValidator, Rule } from 'lin-mizar';
import { PaginateValidator } from './common'

class SearchRelationValidator extends PaginateValidator {
  constructor () {
    super();
    this.rel_type = [
      new Rule('isOptional', ''),
      new Rule('isInt', '操作类型必须为正整数', { min: 1 })
    ];
  }
}

class CreateOrUpdateRelationValidator extends LinValidator {
  constructor () {
    super();
    // this.from_user_id = [
    //   new Rule('isNotEmpty', '必须传入当前操作用户id'),
    //   new Rule('isInt', '当前操作用户id必须为正整数', { min: 1 })
    // ];
    this.to_user_id = [
      new Rule('isNotEmpty', '必须传入被操作用户id'),
      new Rule('isInt', '被操作用户id必须为正整数', { min: 1 })
    ];
    this.rel_type = [
      new Rule('isNotEmpty', '必须传入操作类型！'),
      new Rule('isInt', '操作类型必须为正整数', { min: 1 })
    ];
  }
}

class IsFocusRelationValidator extends LinValidator {
  constructor () {
    super();
    this.to_user_id = [
      new Rule('isNotEmpty', '必须传入被操作用户id'),
      new Rule('isInt', '被操作用户id必须为正整数', { min: 1 })
    ];
  }
}

export { SearchRelationValidator, CreateOrUpdateRelationValidator, IsFocusRelationValidator };
