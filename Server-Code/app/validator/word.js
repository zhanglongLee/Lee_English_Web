import { LinValidator, Rule } from 'lin-mizar';


class CreateWordValidator extends LinValidator {
  constructor () {
    super();
    this.word_name = new Rule('isNotEmpty', '必须传入单词名称');
    this.translate = new Rule('isNotEmpty', '必须传入单词解释');
    this.pronunciation = new Rule('isNotEmpty', '必须传入单词音标');
    this.mp3_link = new Rule('isOptional');
    this.categoryId = [
      new Rule('isNotEmpty', '分类ID不能为空'),
      new Rule('isInt', '分类ID必须是数字')
    ];
  }
}

class UpdateWordValidator extends CreateWordValidator {
  constructor () {
    super();
    this.word_id = [
      new Rule('isNotEmpty', '单词ID不能为空'),
      new Rule('isInt', '单词ID必须是数字')
    ];
  }
}
class DeleteWordValidator extends LinValidator {
  constructor () {
    super();
    this.id = [
      new Rule('isNotEmpty', '单词ID不能为空'),
      new Rule('isInt', '单词ID必须是数字')
    ];
  }
}

export { CreateWordValidator,UpdateWordValidator,DeleteWordValidator };
