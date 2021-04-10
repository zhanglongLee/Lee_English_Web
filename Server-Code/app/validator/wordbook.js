import { LinValidator, Rule } from 'lin-mizar';


class CreateWordBookValidator extends LinValidator {
  constructor () {
    super();
    this.web_user_id = [
      new Rule('isNotEmpty', '用户ID不能为空'),
      new Rule('isInt', '用户ID必须是数字')
    ];
  }
}

class DeleteWordBookValidator extends CreateWordBookValidator {
  constructor () {
    super();
    this.word_id = [
      new Rule('isNotEmpty', '单词ID不能为空'),
      new Rule('isInt', '单词ID必须是数字')
    ];
  }
}

export { CreateWordBookValidator,DeleteWordBookValidator };
