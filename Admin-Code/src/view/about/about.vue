<template>
  <div class="container">
    <div class="quantity-statistics">
      <div class="quantity-item">
        <div class="quantity-detail">
          <div class="quantity-detail-box">
            <div class="quantity-title">总访问量</div>
            <div class="quantity-border-line"></div>
            <div class="quantity">{{info.visitTotal}}</div>
          </div>
        </div>
        <div class="quantity-icon"><img src="../../assets/image/about/icon.png" alt="" /></div>
      </div>
      <div class="quantity-item">
        <div class="quantity-detail">
          <div class="quantity-detail-box">
            <div class="quantity-title">总用户数</div>
            <div class="quantity-border-line"></div>
            <div class="quantity">{{info.userTotal}}</div>
          </div>
        </div>
        <div class="quantity-icon"><img src="../../assets/image/about/icon.png" alt="" /></div>
      </div>
      <div class="quantity-item">
        <div class="quantity-detail">
          <div class="quantity-detail-box">
            <div class="quantity-title">听力练习总练习数</div>
            <div class="quantity-border-line"></div>
            <div class="quantity">{{info.userListeningTotal}}</div>
          </div>
        </div>
        <div class="quantity-icon"><img src="../../assets/image/about/icon.png" alt="" /></div>
      </div>

    </div>


    <div class="cms-info">
      <div class="cms-info-left">
        <div class="welcome">
          <!-- <img src="../../assets/image/about/welcome.png" class="welcome-title" alt="" /> -->
          <div class="subtitle">
            <div class="guide">点击查看英语学习网站前端网站</div>
            <div class="link"><a href="http://localhost:8080" target="_blank">http://localhost:8080</a></div>
          </div>
        </div>
        <img class="welcome-bg" src="../../assets/image/about/header-bg.png" alt="" />
      </div>
      <div class="cms-info-right">
        <div class="team-detail">
          <div class="team-box">
            <div class="team-title">作品说明</div>
            <ul class="team-ul">
              <li>
                <span class="shadow-box"> <i class="team-shadow"></i> </span> <span class="team-role">作者</span>
                <span class="team-name">Lee</span>
              </li>
              <li>
                <span class="shadow-box"> <i class="team-shadow"></i> </span> <span class="team-role">导师</span>
                <span class="team-name">
                  <ul v-if="!showTeam">
                    <li>Liu</li>
                  </ul>
                </span>
              </li>
              <li>
                <span class="shadow-box"> <i class="team-shadow"></i> </span> <span class="team-role">致谢</span>
                <span class="team-name">
                  <ul v-if="!showTeam">
                    <li>感谢刘老师平时的细心指导，给我很多有用的意见！</li>
                  </ul>
                </span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    
    
  </div>
</template>

<script>
import About from '../../model/about'
export default {
  data() {
    return {
      activeName: 'first',
      showTeam: false,
      info:{
        userListeningTotal: 10,
        userTotal: 10,
        visitTotal: 100
      }
    }
  },
  mounted() {
    if (document.body.clientWidth > 1200 && document.body.clientWidth < 1330) {
      this.showTeam = true
    }
    this.getInfo()
  },
  methods: {
    async getInfo(){
      this.info = await About.getVisit()
    }
  },
}
</script>

<style scoped lang="scss">
.container {
  padding: 20px 100px;
  .cms-info {
    display: flex;
    flex: 1;
    height: 160px;
    width: 100%;
    .cms-info-left {
      position: relative;
      width: 690px;
      height: 100%;
      background: rgba(69, 119, 255, 1);
      box-shadow: 0px 2px 14px 0px rgba(243, 243, 243, 1);
      border-radius: 8px;
      .welcome {
        margin: 28px 0 0 30px;
        .welcome-title {
          width: 366px;
          height: 31px;
        }
        .subtitle {
          display: flex;
          flex-direction: column;
          margin-top: 16px;
          color: #fff;
          .guide {
            margin-right: 20px;
            font-size: 26px;
            font-weight: 400;
            line-height: 20px;
          }
          .link {
            margin-top: 20px;
            width: 160px;
            background: rgba(44, 95, 233, 1);
            border-radius: 11px;
            text-align: center;
            padding: 5px 10px;
            color: rgba(255, 255, 255, 1);
          }
        }
      }
      .welcome-bg {
        position: absolute;
        bottom: 0;
        right: 10px;
        width: 393px;
        height: 121px;
      }
    }
    .cms-info-right {
      width: 690px;
      margin-left: 20px;
      height: 100%;
      display: flex;
      flex-direction: column;
      .team-detail {
        position: relative;
        height: 160px;
        background: rgba(255, 176, 139, 1);
        box-shadow: 0px 2px 14px 0px rgba(243, 243, 243, 1);
        border-radius: 8px;

        .team-box {
          margin: 20px 0 0 22px;

          .team-ul {
            margin-top: 15px;

            li {
              height: 20px;
              line-height: 20px;
              margin-bottom: 15px;
              font-size: 14px;

              .shadow-box {
                position: relative;
                display: inline-block;
                margin-right: 10px;
                width: 14px;
                height: 14px;
                border-radius: 14px;
                background-color: #fff;
                transform: translateY(2px);

                .team-shadow {
                  position: absolute;
                  top: 25%;
                  left: 25%;
                  display: inline-block;
                  width: 6px;
                  height: 6px;
                  border-radius: 6px;
                  background-color: #ffb9a4;
                }
              }

              .team-role {
                display: inline-block;
                width: 30px;
                margin-right: 15px;
                font-weight: 400;
                color: #45526b;
              }

              .team-name {
                font-weight: 400;
                color: #fff;

                ul {
                  display: inline;

                  li {
                    display: inline;
                    margin-right: 15px;
                  }
                }
              }
            }
          }
        }

        .team-icon {
          position: absolute;
          top: 25%;
          right: 33px;
          width: 70px;
          height: 70px;
          display: flex;
          justify-content: center;
          align-items: center;
          background-color: #fff;
          box-shadow: 0 0 10px 0 #cfd5e3;

          img {
            width: 62px;
            height: 62px;
          }
        }
        .team-label {
          position: absolute;
          top: 73%;
          right: 20px;
          font-size: 13px;
          font-weight: 400;
          color: rgba(69, 82, 107, 1);
          line-height: 20px;
        }
      }
    }
  }
  .quantity-statistics {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    height: 90px;
    .quantity-item {
      display: flex;
      width: 30%;
      height: 100%;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0px 2px 14px 0px rgba(243, 243, 243, 1);
      border-radius: 8px;
      .quantity-detail {
        flex: 1;
        .quantity-detail-box {
          margin: 12px 0 0 30px;
          .quantity-title {
            margin-bottom: 2px;
            height: 20px;
            line-height: 20px;
            color: #495468;
            font-size: 14px;
            font-weight: 400;
          }
          .quantity-border-line {
            width: 46px;
            height: 2px;
            background: rgba(73, 84, 104, 1);
          }
          .quantity {
            margin-top: 7px;
            height: 48px;
            font-size: 32px;
            color: rgba(73, 84, 104, 1);
            line-height: 38px;
            letter-spacing: 2px;
          }
        }
      }
      .quantity-icon {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 90px;
        height: 100%;
        background: rgba(69, 119, 255, 0.1);
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
        img {
          width: 28px;
          height: 33px;
        }
      }
    }
  }
  .information {
    margin-top: 20px;
    display: flex;
    .personal {
      width: 320px;
      height: 100%;
      margin-right: 20px;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0px 2px 14px 0px rgba(243, 243, 243, 1);
      border-radius: 8px;
      .personal-title {
        margin: 20px 0 10px 20px;
        height: 22px;
        line-height: 22px;
        font-weight: 500;
        color: #596c8e;
        font-size: 16px;
      }
      .personal-avatar {
        width: 140px;
        height: 140px;
        margin: 0 auto 40px;
        border-radius: 75px;
        box-shadow: 0 0 30px 0 #cfd5e3;
      }
      .personal-influence {
        display: flex;
        justify-content: space-between;
        padding: 0 30px 40px;
        .personal-influence-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          .personal-influence-num {
            font-size: 28px;
            line-height: 34px;
            &.color1 {
              color: #00c292;
            }
            &.color2 {
              color: #fec108;
            }
            &.color3 {
              color: #03a9f3;
            }
          }
          .personal-influece-label {
            font-size: 12px;
            font-weight: 400;
            color: #8c98ae;
            line-height: 17px;
          }
        }
      }
      .personal-tabs {
        margin-bottom: 20px;
      }
      .personal-tabs /deep/ .is-top {
        width: 320px;
        display: flex;
        justify-content: space-around;
      }
      .personal-tabs /deep/ .el-tabs__content {
        text-indent: 20px;
      }
    }
    .article {
      flex: 1;
      height: 100%;
      padding: 20px;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0px 2px 14px 0px rgba(243, 243, 243, 1);
      border-radius: 8px;
      .article-title {
        height: 22px;
        line-height: 22px;
        font-weight: 500;
        color: #596c8e;
        font-size: 16px;
        margin-bottom: 20px;
      }
      .article-list {
        cursor: pointer;
        .article-item {
          display: flex;
          flex-direction: row;
          justify-content: flex-start;

          .article-thumb {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            margin-right: 30px;
          }
          .article-detail {
            flex: 1;
            border-bottom: 1px #ecedef solid;
            margin-bottom: 20px;
            &.article-last {
              border-bottom: none;
              margin-bottom: 0;
            }
            .article-detail-title {
              height: 22px;
              font-size: 16px;
              font-weight: 400;
              color: rgba(69, 82, 107, 1);
              line-height: 22px;
            }
            .article-detail-content {
              margin-top: 10px;
              font-size: 14px;
              font-weight: 400;
              color: rgba(140, 152, 174, 1);
              line-height: 22px;
            }
          }
          .article-tool {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin: 10px 0 20px 0;
            font-size: 12px;
            line-height: 17px;
            font-weight: 400;
            color: #808da3;
            .article-about {
              .iconfont {
                line-height: 17px;
                margin-right: 6px;
                font-size: 12px;
              }
            }
          }
        }
      }
    }
  }
}

@media screen and (max-width: 1200px) {
  .container{
    min-width: 700px;
  }
  .container .cms-info{
    margin-top: 200px;
    display: flex;
    flex-direction: column;
  }
  .container .cms-info .cms-info-right {
    margin-left: 0;
    margin-top: 50px;
    width: 100%;
  }
  .container .cms-info .cms-info-left {
    width: 100%;
    padding: 40px 0;
  }
  .container .quantity-statistics {
    flex-direction: column;
  }
  .container .quantity-statistics .quantity-item {
    width: 100%;

  }
  .container .information .personal {
    display: none;
  }
}

@media screen and (max-width: 1200px) {
  .container .cms-info .cms-info-left {
    width: 100%;
  }
}
</style>
