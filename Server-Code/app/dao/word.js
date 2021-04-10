import { NotFound,Forbidden } from 'lin-mizar';
import { WordModel } from '../model/word';
import { CategoryModel } from '../model/category'
import { Op } from 'sequelize'

class Word {

  // 通过id查文章
  static async getWordById(id){
    const res = await WordModel.findOne({
      where:{
        id
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [{
        model: CategoryModel,
      }],
    });
    if(!res){
      throw new Forbidden({
        code: 10022
      });
    }
    return res
  }

  // 前端获取文章列表
  static async getWebWordList(page = 1, size = 5) {

    const res = await WordModel.findAndCountAll({
      where: {
        is_published:1
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [{ // include关键字表示关联查询
        model: CategoryModel,
      }],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }

  // 管理后台文章列表
  static async getWordList(page = 1, size = 5,q) {
    if(q){
      var whereObj = {
        title: {
          [Op.like]: `%${q}%`
        }
      };
    }
    const res = await WordModel.findAndCountAll({
      where: whereObj,
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [{ // include关键字表示关联查询
        model: CategoryModel,
        // attributes: [['category_name', 'name']],
      }],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }

  // 新增单词
  static async createWord(v) {
    const word = await WordModel.findOne({
      where: {
        word_name: v.word_name
      }
    });
    if (word) {
      // 如果单词存在则更新单词信息
      word.update({ ...v })
    }else{
      await WordModel.create(v);
    }
  }

  // 修改单词
  static async editWord(word_id, v) {
    const word = await WordModel.findByPk(word_id);
    if (!word) {
      throw new NotFound();
    }

    return await word.update({ ...v });
  }

  // 删除单词
  static async deleteWord(word_id) {
    return WordModel.destroy({
      where: { word_id }
    });
  }

};

export { Word as WordDao };