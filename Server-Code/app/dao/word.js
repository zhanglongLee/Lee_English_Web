import { NotFound, Forbidden } from 'lin-mizar';
import { WordModel } from '../model/word';
import { CategoryModel } from '../model/category'
import { Op } from 'sequelize'
import sequelize from '../lib/db';

class Word {

  // 通过id查单词
  static async getWordById(id) {
    const res = await WordModel.findOne({
      where: {
        id
      },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [{
        model: CategoryModel,
      }],
    });
    if (!res) {
      throw new Forbidden({
        code: 10022
      });
    }
    return res
  }

  // 管理后台单词列表
  static async getWordList(page = 1, size = 5, q) {
    if (q) {
      var whereObj = {
        word_name: {
          [Op.like]: `%${q}%`
        }
      };
    }
    const res = await WordModel.findAndCountAll({
      where: whereObj,
      order: [['word_name', 'ASC']],
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
    } else {
      await WordModel.create(v);
    }
  }
  // 批量新增单词
  static async createWordArr(v) {
    v.forEach(item=>{
      this.createWord(item)
    })
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

  // 获取单词类型列表
  static async getTypeList() {
    // 查询单词分类id及对应数量
    const res = await sequelize.query(
      `SELECT word.categoryId, category.category_name, count( word.word_name ) AS word_num FROM word LEFT JOIN category ON word.categoryId = category.id WHERE word.deleted_at IS NULL GROUP BY word.categoryId`
    );
    return res[0]
  }

  // 根据分类查询单词列表
  static async getWordListByType(page = 1, size = 5, type) {
    const res = await WordModel.findAndCountAll({
      where: {
        categoryId: type
      },
      order: [['word_name', 'ASC']],
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

};

export { Word as WordDao };