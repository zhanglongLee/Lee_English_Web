import { LinValidator } from 'lin-mizar';
import { Rule } from 'lin-mizar/lin'

class AddVideoCourseHistoryValidator extends LinValidator {
  constructor() {
    super();
    this.video_course_id = [
      new Rule('isNotEmpty', '文章ID不能为空'),
      new Rule('isInt', '文章ID必须是数字')
    ];
  }
};

class DeleteVideoCourseHistoryValidator extends AddVideoCourseHistoryValidator {
  constructor() {
    super();
  }
}

module.exports = { AddVideoCourseHistoryValidator, DeleteVideoCourseHistoryValidator };