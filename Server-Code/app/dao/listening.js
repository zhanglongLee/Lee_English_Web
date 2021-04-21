import { NotFound, Forbidden } from 'lin-mizar';
import { ListeningModel } from '../model/listening';
import { CategoryModel } from '../model/category'
import { Op } from 'sequelize'

class Listening {

  // 通过id查听力练习详情
  static async getListeningById(id){
    const res = await ListeningModel.findOne({
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
        code: 10259
      });
    }
    return res
  }

  // 查看热门听力练习列表
  static async getListeningHotList() {

    const res = await ListeningModel.findAll({
      where: { is_published: 1 },
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      include: [
        { // include关键字表示关联查询
          model: CategoryModel,
        }
      ],
    });
    return res;
  }

  // 前端查看听力练习列表
  static async getWebListeningList(page = 1, size = 5, q) {

    var whereObj = { is_published: 1 }
    if (q) {
      whereObj.title = {
        [Op.like]: `%${q}%`
      };
    }
    const res = await ListeningModel.findAndCountAll({
      where: whereObj,
      order: [['created_at', 'DESC']],
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [
        { // include关键字表示关联查询
          model: CategoryModel,
        }
      ],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }

  // 后端查看听力练习列表
  static async getListeningList(page = 1, size = 5, q) {

    var whereObj = {}
    if (q) {
      whereObj.title = {
        [Op.like]: `%${q}%`
      };
    }
    const res = await ListeningModel.findAndCountAll({
      where: whereObj,
      order: [['created_at', 'DESC']],
      attributes: {
        exclude: ['deleted_at', 'updated_at']
      },
      limit: Number(size),//长度
      offset: (Number(page) - 1) * Number(size),//当前列表开始值
      include: [
        { // include关键字表示关联查询
          model: CategoryModel,
        }
      ],
      // raw: true // 这个属性表示开启原生查询，原生查询支持的功能更多，自定义更强
    });
    return res;
  }

  // 新增听力练习
  static async createListening(v) {
    const listening = await ListeningModel.findOne({
      where: {
        title: v.title
      }
    });
    if (listening) {
      throw new Forbidden({
        code: 10255
      });
    }
    await ListeningModel.create(v);
  }

  // 修改听力练习
  static async editListening(id, v) {
    const listening = await ListeningModel.findByPk(id);
    if (!listening) {
      throw new NotFound();
    }

    return await listening.update({ ...v });
  }
  // 删除听力练习
  static async deleteListening(id) {
    return ListeningModel.destroy({
      where: { id }
    });
  }
};

export { Listening as ListeningDao };