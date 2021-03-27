import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class AddListeningValidator extends LinValidator {
  constructor() {
    super();
    this.image = [
      new Rule('isOptional')
    ];
    this.title = [
      new Rule('isNotEmpty', '听力练习标题不能为空')
    ];
    // this.questions_analysis = [
    //   new Rule('isNotEmpty', '听力练习答案解析不能为空'),
    // ];
    this.questions = [
      new Rule('isNotEmpty', '听力练习问题，及对应答案不能为空'),
    ];
    // this.source = [
    //   new Rule('isNotEmpty', '听力mp3的url不能为空'),
    // ];
    this.is_published = [
      new Rule('isNotEmpty', '发布状态不能为空'),
    ];
    this.categoryId = [
      new Rule('isNotEmpty', '分类ID不能为空'),
      new Rule('isInt', '分类ID必须是数字')
    ];
  }
};

class ListeningSearchValidator extends LinValidator {
  constructor () {
    super();
    this.q = new Rule('isNotEmpty', '必须传入搜索关键字');
  }
}

class EditListeningValidator extends AddListeningValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ]
  }
}

class DeleteListeningValidator extends LinValidator {
  constructor() {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}
module.exports = { AddListeningValidator, EditListeningValidator, DeleteListeningValidator,ListeningSearchValidator };