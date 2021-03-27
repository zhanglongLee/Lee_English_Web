import { LinValidator, Rule } from 'lin-mizar';

// 新增做题记录
class SubmitLearningValidator extends LinValidator {
  constructor () {
    super();
    this.listeningId = [new Rule('isNotEmpty','请输入英语练习id'),new Rule('isInt', '分类ID必须是数字')]
    this.history_answer = [new Rule('isNotEmpty','请输入答题记录')]
  }
}

// 删除做题记录
class DeleteLearningValidator extends LinValidator {
  constructor () {
    super();
    this.listeningId = [new Rule('isNotEmpty','请输入英语练习id'),new Rule('isInt', '分类ID必须是数字')]
  }
}

export {
  SubmitLearningValidator,
  DeleteLearningValidator
};
