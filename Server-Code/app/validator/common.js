import { LinValidator, Rule, config } from 'lin-mizar';

class PositiveIdValidator extends LinValidator {
  constructor () {
    super();
    this.id = new Rule('isInt', 'id必须为正整数', { min: 1 });
  }
}

class PaginateValidator extends LinValidator {
  constructor () {
    super();
    this.size = [
      new Rule('isOptional', ''),
      new Rule('isInt', 'size必须为正整数', { min: 1 })
    ];
    this.page = [
      new Rule('isOptional', ''),
      new Rule('isInt', 'page必须为正整数', { min: 1 })
    ];
    this.q = [
      new Rule('isOptional')
    ];
  }
}

export { PaginateValidator, PositiveIdValidator };
