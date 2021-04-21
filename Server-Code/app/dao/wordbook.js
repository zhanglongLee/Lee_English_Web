import { NotFound } from 'lin-mizar';
import { WordModel } from '../model/word';
import { CategoryModel } from '../model/category';
import { WordBookModel } from '../model/word-book'
import { unique } from '../lib/util'

class WordBook {

  // 获取生词列表
  static async getWordBook(ctx) {
    // 记录查询到的用户信息
    const user = ctx.currentUser;
    if (!user) {
      throw new NotFound({
        code: 10021
      });
    }

    let web_user_id = user.id
    const wordBook = await WordBookModel.findOne({
      where: {
        web_user_id
      }
    })
    let wordBookList = []
    if(wordBook){
      let content = JSON.parse(wordBook.content)
      wordBookList = await WordModel.findAll({
        where:{
          word_id:content
        },
        include:[
          {
            model:CategoryModel
          }
        ],
        order:[['word_id','ASC']]
      })
    }
    return new Promise((resolve,reject)=>{
      resolve(wordBookList)
    })
  }

  // 新增用户生词
  static async createWordBook(web_user_id,word_id) {
    // 获取生词本信息
    let  wordBook = await WordBookModel.findOne({
      where: {
        web_user_id
      }
    })
    let content = []
    if(!Array.isArray(word_id)){
      throw new NotFound({
        message:"word_id应该为数组"
      });
    }
    if(wordBook){
      // 如果存在生词本
      content = JSON.parse(wordBook.content)
      // 添加生词到content
      content = content.concat(word_id)
      // 数组去重操作
      content = unique(content)
      // 将生词信息持久化到数据库表
      wordBook.content = JSON.stringify(content)
      wordBook.save()
    }else{
      // 添加生词到content
      content = content.concat(word_id)
      // 数组去重操作
      content = unique(content)
      let obj = {
        web_user_id,
        content:JSON.stringify(content)
      }
      console.log(obj)
      // 创建生词
      WordBookModel.create(obj)
    }
  }
  
  // 删除用户生词
  static async deleteWordBook(web_user_id,word_id) {
    // 获取生词本信息
    let  wordBook = await WordBookModel.findOne({
      where: {
        web_user_id
      }
    })
    
    if(wordBook){
      // 如果存在生词本
      let content = JSON.parse(wordBook.content)
      // 从content中删除生词
      let index = content.indexOf(word_id)
      if(index !=-1){
        content.splice(content.indexOf(word_id),1)
        // 将生词信息持久化到数据库表
        wordBook.content = JSON.stringify(content)
        wordBook.save()
      }

    }
  }
}

export { WordBook as WordBookDao };
