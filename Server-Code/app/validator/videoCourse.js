import { LinValidator, Rule } from 'lin-mizar';
;

class AddVideoCourseValidator extends LinValidator {
  constructor () {
    super();
    this.image = [
      new Rule('isOptional')
    ];
    this.video_url = [
      new Rule('isNotEmpty', '视频课程必须上传')
    ];
    this.title = [
      new Rule('isNotEmpty', '视频课程标题不能为空')
    ];
    this.description = [
      new Rule('isNotEmpty', '视频课程描述不能为空')
    ];
    this.uid = [
      new Rule('isNotEmpty', '用户ID不能为空'),
      new Rule('isInt', '用户ID必须是数字')
    ];
    this.published_time = [
      new Rule('isNotEmpty', '发布日期不能为空')
    ];
    this.is_published = [
      new Rule('isNotEmpty', '发布状态不能为空')
    ];
    this.is_comment_enabled = [
      new Rule('isNotEmpty', '评论区开关状态不能为空')
    ];
    this.is_top = [
      new Rule('isNotEmpty', '置顶状态不能为空')
    ];
    this.categoryId = [
      new Rule('isNotEmpty', '分类ID不能为空'),
      new Rule('isInt', '分类ID必须是数字')
    ];
  }
};

class VideoCourseSearchValidator extends LinValidator {
  constructor () {
    super();
    this.q = new Rule('isNotEmpty', '必须传入搜索关键字');
  }
}

class EditVideoCourseValidator extends AddVideoCourseValidator {
  constructor () {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}

class DeleteVideoCourseValidator extends LinValidator {
  constructor () {
    super();
    this.id = [
      new Rule('isNotEmpty', 'id不能为空'),
      new Rule('isInt', 'id必须是数字且大于0', { min: 1 })
    ];
  }
}
class VideoCourseIsCollectValidator extends LinValidator {
  constructor () {
    super();
    this.video_course_id = [
      new Rule('isNotEmpty', '视频课程id不能为空'),
      new Rule('isInt', '视频课程id必须是数字且大于0', { min: 1 })
    ];
    this.web_user_id = [
      new Rule('isNotEmpty', '用户id不能为空'),
      new Rule('isInt', '用户id必须是数字且大于0', { min: 1 })
    ];
  }
}
class LikeVideoCourseValidator extends LinValidator {
  constructor () {
    super();
    this.video_course_id = [
      new Rule('isNotEmpty', '视频课程id不能为空'),
      new Rule('isInt', '视频课程id必须是数字且大于0', { min: 1 })
    ];
  }
}

module.exports = { AddVideoCourseValidator, EditVideoCourseValidator, DeleteVideoCourseValidator, VideoCourseSearchValidator, VideoCourseIsCollectValidator, LikeVideoCourseValidator };