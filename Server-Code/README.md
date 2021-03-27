# 英语学习网站接口服务项目

# 修改接口中的图片字段，只保存绝对路径
# 查询接口中的图片字段，拼接url前缀
> 在模型中设置get()方法，使用this.getDataValue('image')获取到图片字段内容，使用config.getItem('localMainImgUrlPrefix')获取配置的url路径，拼接返回给前端。代码上线的时候，只需要修改config文件中的localMainImgUrlPrefix字段。