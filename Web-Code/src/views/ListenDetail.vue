<template>
  <div id="content" class="listen-detail">
    <div class="listen-content">
      <!-- <el-button type="primary" icon="el-icon-back" /> -->
      <h1 class="header-title">{{ listeningDetail.name }}</h1>
      <div class="header-info">
        <div class="author">
          {{ listeningDetail.user.name }}
        </div>
        <div class="date">
          <i class="iconfont icon-clock"></i>{{ listeningDetail.createdAt | formatDate }}
        </div>
        <div class="download" @click="collect">
          <i class="iconfont icon-xiazai"></i>下载当前听力资料
        </div>
        <!-- <div class="d-flex align-items-center flex-wrap">
          <div
            ref="download"
            class="d-none"
            :href="listeningDetail.logo"
            :download="listeningDetail.fileName"
          ></div>
        </div> -->
      </div>
      <div class="post-body">
        <div class="resource">
          <!-- <audio
            v-if="listeningDetail.fileType == 'video'"
            :src="listeningDetail.logo"
            width="400"
            height="150"
            controls
          ></audio> -->
          <myaudio></myaudio>
          <img
            v-if="listeningDetail.fileType == 'img'"
            width="400"
            height="150"
            :src="listeningDetail.logo"
          />
        </div>
        <div class="news-question">
          <ul class="question-list">
            <li
              v-for="(item, i) in listeningDetail.questions"
              :key="item.id"
              class="question-item"
            >
              <p class="item-title">
                <span
                  :color="item.isWrong"
                >{{ i + 1 }}.{{ item.title }}
                  <i v-if="item.isWrong" class="fa fa-hand-o-left colred"></i></span>
                <span
                  v-if="isShowAnswer"
                  style="color:#f5862b;font-size:14px;"
                >正确答案 {{ "：" + item.answer }}
                </span>
              </p>
              <dl class="item-options">
                <dd v-if="item.option1" class="options">
                  <input
                    :id="'option1' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="A"
                  />
                  <label :for="'option1' + i">A.{{ item.option1 }}</label>
                </dd>
                <dd v-if="item.option2" class="options">
                  <input
                    :id="'option2' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="B"
                  />
                  <label :for="'option2' + i">B.{{ item.option2 }}</label>
                </dd>
                <dd v-if="item.option3" class="options">
                  <input
                    :id="'option3' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="C"
                  />
                  <label :for="'option3' + i">C.{{ item.option3 }}</label>
                </dd>
                <dd v-if="item.option4" class="options">
                  <input
                    :id="'option4' + i"
                    v-model="item.answerTemp"
                    class="mr-1"
                    type="radio"
                    :name="'option' + i"
                    value="D"
                  />
                  <label :for="'option4' + i">D.{{ item.option4 }}</label>
                </dd>
              </dl>
            </li>
          </ul>
          <div class="btn-list">
            <el-button
              v-if="!hasSubmit"
              type="primary"
              class="sub-btn"
              @click="submit"
            >提交</el-button>
            <el-button
              v-else
              type="primary"
              class="sub-btn"
              @click="reTry"
            >重来一次</el-button>
            <div class="detail-list">
              <span
                v-if="!isShowAnswer"
                class="show"
                @click="isShowAnswer = true"
              >我太难了，就想看答案</span>
              <span
                v-else
                class="unshow"
                @click="isShowAnswer = false"
              >我就是看看，其实我知道</span>
            </div>
            <div class="detail-list">
              <span
                v-if="!isShowAnalysis"
                class="show"
                @click="isShowAnalysis = true"
              >查看解析</span>
              <span
                v-else
                class="unshow"
                @click="isShowAnalysis = false"
              >先不看</span>
            </div>
          </div>
          <div
            v-if="
              listeningDetail.questions != undefined &&
                listeningDetail.questions.length <= 0
            "
          >
            <div class="no-result">暂时没有内容/(ㄒoㄒ)/~~</div>
          </div>
        </div>
        <div v-if="isShowAnalysis" class="answer-wrap">
          <h3>答案解释</h3>
          <div v-html="listeningDetail.alt"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import myaudio from '@/components/common/myAudio/index'
export default {
  filters: {
    formatDate(date) {
      return new Date(date).toLocaleString()
    }
  },
  components:{
    myaudio
  },
  data() {
    return {
      listeningDetail: {
        user: {}
      },
      isShowAnswer: false,
      isShowAnalysis: false,
      hasSubmit: false,
      score: 0,
      imgList: ['jpg', 'png', 'gif', 'png', 'webp'],
      mediaList: [
        'mp3',
        'mp4',
        'f4v',
        'flv',
        'ogv',
        'webm',
        'wma',
        'rm',
        'wav',
        'midi',
        'ape',
        'fla'
      ]
    }
  },
  created() {
    this.getListeningDetail()
  },
  methods: {
    collect() {
      console.log(this.listeningDetail.id, this.listeningDetail.logo)
      // $.post('/api/listening/collect', {
      //   listeningId: this.listeningDetail.id,
      //   path: this.listeningDetail.logo
      // })
      //   .done(res => {
      //     if (res.code !== 0) {
      //       layer.msg(res.msg)
      //       return false
      //     }
      //     layer.msg(res.msg)
      //     this.$refs.download.click()
      //   })
      //   .fail(err => {
      //     throw err
      //   })
    },
    getListeningDetail() {
      // $.get('/api/getListeningDetail', { listeningId: id })
      //   .done(res => {
      //     if (res.code !== 0) {
      //       layer.msg(res.msg)
      //       return false
      //     }
      //     this.isShowAnswer = false
      //     res.data.questions.map((item, index) => {
      //       item.answerTemp = ''
      //       item.isWrong = false
      //     })
      //     // console.log(res.data);
      //     this.listeningDetail = res.data
      //     // 用数据库表中没用到的option5字段作为排序的值
      //     this.listeningDetail.questions.sort(this.compare('option5'))
      //     console.log(this.listeningDetail)
      //     this.listeningDetail.fileName = this.listeningDetail.logo.substr(
      //       this.listeningDetail.logo.lastIndexOf('-') + 1,
      //       this.listeningDetail.logo.lastIndexOf('.')
      //     )
      //     this.listeningDetail.fileType =
      //       this.imgList.indexOf(
      //         this.listeningDetail.logo.substr(
      //           this.listeningDetail.logo.lastIndexOf('.') + 1
      //         )
      //       ) > -1
      //         ? 'img'
      //         : 'video'
      //   })
      //   .fail(err => {
      //     throw err
      //   })
      const res = {
        data: {
          id: '15856506004785278431L',
          name: '2018年12月英语六级听力真题及答案:第2套',
          alt:
            '<p><strong>Conversation one.</strong></p><p>M：（1）<font color="#c24f4a">Do you mind taking my photo with the statue over there?&nbsp;</font>I think it will make a great shot.</p><p>W:Sure. No worries.You\'re always taking photos. What do you do with all the photos you take?</p><p>M：Well, don\'t laugh.&nbsp;<font color="#c24f4a">My dream is to become an online celebrity of sorts.</font></p><p>W：You\'re not serious, are you?</p><p>M：I am completely I just got the idea a fewmonths ago after posting some holiday photos on my social media accounts, a lotof people like my photos and started asking me for travel tips. So I figuredi\'d give it a go. I post a lot on social media anyway. So i\'ve got nothing to .</p><p>W：&nbsp;I guess that\'s true. So what you have todo to become internet famous .</p><p>M：<font color="#c24f4a">Surprisingly, a lot morethan I did as a hobby recently. I\'ve been spending a lot more time editingphotos, posting online and clearing storage on my phone.</font>&nbsp;It\'s always full. Now that doesn\'t sound like too much work.</p><p>W：Well, there\'s more to it.</p><p>M：I spent all last weekend researching whattopics are popular, what words to use in captions and similar accounts tofollow really was a lot to take. And I was up well past midnight. I\'d say it\'spaying off, though I increased the number of people following my accounts byfifteen percent already.</p><p>W：That is impressive. I guess I neverthought much about all the effort behind the scene.&nbsp;<font color="#c24f4a">Nowthat I think about it, there\'s always something wrong with my photos. As it is,half smiles, closed eyes, messy hair.</font>&nbsp;I hope you have better luck than Ido. Then. Again, I think the only person interested in my photos is my mum.</p><p></p><p>Question 1. What doesthe man asked the woman to do?</p><p>解析：根据问题，问男人让女人做什么，可定位到，对话开篇<font color="#c24f4a">Do you mind taking my photo with the statue overthere?</font></p><p>Question 2. What doesthe man dream of?</p><p>解析：根据问题，问男人梦想什么，可定位到，对话中上篇可得，<font color="#c24f4a">My dream is to become an online celebrity ofsorts.</font></p><p><font color="#c24f4a">Question 3. What hasthe man been busy doing recently?</font></p><p>解析：根据问题，问男人近期忙于做些什么，可定位中间对话可得，<font color="#c24f4a">Surprisingly, a lot more than I did as a hobbyrecently. I\'ve been spending a lot more time editing photos, posting online andclearing storage on my phone.</font></p><p>Question 4, what doesthe woman say about her photos?</p><p>解析：根据问题，问女人关于她的照片说了什么，可定位至对话结尾处，<font color="#c24f4a">Now that I think about it, there\'s alwayssomething wrong with my photos. As it is, half smiles, closed eyes, messy hair.</font></p><p><strong></strong></p><p><strong>Conversation two</strong></p><p>M：<font color="#c24f4a">（5）Good evening and welcome to physics today. Here we interview some ofthe greatest minds in physics as they help us to understand some of the mostcomplicated theories.</font> Today. I\'m very pleased towelcome doctor melissa phillips, professor of theoretical physics. She\'s hereto tell us a little about what it is.<font color="#c24f4a">（6）&nbsp;She studies doctor phillips. You seem to study everything.</font></p><p>W：<font color="#c24f4a">（6）I guess that would be fair to say I spend most of my time studyingthe big bang theory and where our universe came from.</font></p><p>M：Can you tell us a little about that?</p><p>W：Well,<font color="#c24f4a">（7）&nbsp;i\'m very interested in why the universeexists at all.&nbsp;</font>That may sound odd, but the factis at the moment of the big bang, both matter and antimatter were created for ashort time, and I mean just a fraction of a second. The whole universe was asuper hot soup of radiation filled with these particles. So what baffledscientists for so long is why is there a universe at all?</p><p>M：That\'s because matter and anti matter arebasically opposites of each other. They are exactly alike, except that theyhave opposite electrical charges. So when they collide, they destroy eachother.</p><p>W：&nbsp;Exactly. So during the first few momentsof the big bang, the universe was extremely hot and very small matter. And thenow more exotic anti matter would have had little space to avoid each other.This means that they should have totally wiped each other out, leaving theuniverse complete. De baron.</p><p>M：<font color="#c24f4a">（8）But a recent study seems to point to the fact that would matter. Andanti matter were first created. There were slightly more particles of matterwhich allowed the universe we all live in to form</font></p><p>W:exactly becausethere was slightly more matter. The collisions quickly depleted all the antimatter and left just enough matter to create stars, planets, and eventually us.</p><p>Question 5. What doesthe man say is physics today?</p><p>根据问题，问男人说“今日物理学”是怎样的，可定位至对话开篇<font color="#c24f4a">Good eveningand welcome to physics today. Here we interview some of the greatest minds inphysics as they help us to understand some of the most complicated theories</font></p><p>Question 6. What isthe woman physicists? Main research area?</p><p>根据问题，问女人主要研究的领域是什么，可定位至文章开篇对话处，<font color="#c24f4a">She studies doctor phillips. You seem to studyeverything. I guess that would be fair to say I spend most of my time studyingthe big bang theory and where our universe came from.</font></p><p>Questions 7. What isthe woman interested in?</p><p>根据问题，问女人的兴趣所在，可得i\'m very interested in why the universe exists at all.</p><p>Question 8. Whatseems to be the finding of the recent study?</p><p>根据问题，问近期研究的发现，可定位至对话结尾处But后，<font color="#c24f4a">But a recent studyseems to point to the fact that would matter. And anti matter were firstcreated. There were slightly more particles of matter which allowed theuniverse we all live in to form .</font></p><p>Passage 1</p><p>　　In this week\'s edition of special series on bizarre medical conditions. There\'s a report of the case of Michelle Myers. Myers is an American woman who woke up one day speaking with a British accent, even though she\'s lived in the united states all her life in two thousand fifteen, Myers went to bed with<font color="#c24f4a">[9] a terrible headache. She woke up sounding like someone from England. Her British accent has remained for the past two years previously, [9]Meyers had woken up speaking in Irish and Australian accents.</font></p><p>　　However, on both of those occasions, the accents lasted for only a week. Myers has been diagnosed with foreign accent syndrome. <font color="#c24f4a">[10]It\'s a disorder in which a person experiences a setting change to their speech so that they sound like they are speaking in a foreign accent. The condition is most often [10]caused by a stroke or traumatic brain injury.</font> Although people with the syndrome have intelligible speech, their manner of speaking is altered in terms of timing and tongue placement, which may distort their pronunciation. The result is that they may sound foreign when speaking their native language.</p><p>　　It\'s not clear whether Myers has experienced a stroke or other brain damage, but she also has a separate medical condition which can result and loose joints easily bruised skin and other problems. Foreign accent syndrome is rare, with only about sixty cases reported within the past century. <font color="#c24f4a">[11]However, a different American woman reportedly spoke with the Russian accent in two thousand ten after she fell down the stairs and hit her head.</font></p><p>　　Question 9. What happened to Michelle Myers One day?</p><p>　　解析：根据故事线索定位答案，Michelle Myers一天晚上头疼，醒来后发现自己说澳大利亚口音和爱尔兰口音的英语。</p><p>　　Question 10. What does the passage say about foreign accent syndrome?</p><p>　　解析：通过however和cause定位答案位置，外国语音的症状主要由于中风和头痛引起的语音失调的症状。</p><p>　　Question 11. What accent did another American woman speak with after a head injury?</p><p>　　解析：通过however和文章结尾一个美国女人视听一致定位答案位置，这个美国女人从楼梯上摔下来后说俄语口音的英语。</p><p>　　Passage 2</p><p>　　There is something about water that makes it a good metaphor for life. That may be one reason why so many people find relief in swimming when life seized get rough. And<font color="#c24f4a"> [12]it goes some way towards explaining why books about swimming, in which people tackle icy legs, race and rivers, and overcome oceans while reflecting on their lives have recently become so popular.</font></p><p>　　These books reflect a trend particularly strong in Britain, where swimming in pools is declining, but more and more folks are opting for open water. While swimming seems to be especially popular among women. <font color="#c24f4a">[13]Jenny landreth recently published a guide to the best swimming spots in London. </font>Her new book swell into weaves her own story with a history of female pioneers who accomplished remarkable feats paved the way for future generations.<font color="#c24f4a"> [14]Notions of modesty restricted women in the Victorian era, but they still swam. A bathing machine was rolled down to the sea shore, so women would not be seen in swim wear in 1892,[14] the gentle woman\'s book of sport described a woman swimming in a heavy dress, boots, hat, gloves and carrying an umbrella.</font></p><p>　　Eventually swimming became freer. Mixed bathing was permitted on British beaches. In 1901, women won the right to swim in public pools, learn to swim properly, created appropriate swimwear, and in time even competed against men.<font color="#c24f4a"> [15]The first woman to cross the English channel was Gertrude Elderly. In 1926, she beat the record by almost two hours and her father rewarded her with a red sports car.</font></p><p>　　Question 12. What has become so popular recently?</p><p>　　解析：根据问题最近比较流行定位文章第第二句，有原因词why提示游泳成为人们遇到困难时排解的方式，所以关于游泳的书籍最近非常受欢迎。</p><p>　　Question 13. What did Jenny Landreth do recently?</p><p>　　解析：根据人名和best定位答案位置，Jenny Landreth最近出版了一本书，关于指导人们发现最好的游泳地点。</p><p>　　Question 14. What do we learn about women in the Victorian era?</p><p>　　解析：通过转换词but和时间词1892及维多利亚女性话题可以定位答案位置，在保守的维多利亚时期，女性在游泳时依然穿着厚着的衣服，坚持游泳。</p><p>　　Question 15. What does the passage say about Gertrude?</p><p>　　解析;通过first和文章结尾定位答案位置，Gertrude是第一位穿过英吉利海峡的女性，并且打破了2小时的记录，因此她父亲奖励一辆跑车给她。</p><p><strong>Recording One</strong></p><p>TodayI\'m going to talk about a very special kind of person. Psychologists call themmasters of deception. Those rare individuals with a natural ability to tellwith complete confidence, when someone is telling a lie.&nbsp;<span style="background-color: rgb(123, 91, 161);">(16) For decades,&nbsp;researchers and lawenforcement agencies have tried to build a machine that will do the same thing.</span>Now, a company in Massachusetts says that by using magnetic brain scans,they can determine with 97% accuracy whether someone is telling the truth.</p><p>Theyhope that the technology will be cleared for use in American courts by earlynext year.&nbsp;<span style="background-color: rgb(123, 91, 161);">（17）But is this really the ultimate tool for you? The lawyers oftomorrow? You will not find many brain scientists celebrating thisbreakthrough. The company might be very optimistic,&nbsp;but the ability of theirmachine to detect deception has not provided credible proof.&nbsp;</span>That\'sbecause the technology has not been properly tested in real world situations. Inlife, there are different kinds of lies and diverse contexts in which they\'retold. These differences may elicit different brain responses.</p><p>Doestheir hypothesis behind the test apply in every case? We don\'t know the answer,because studies done on how reliable this machine is have not yet beenduplicated. Much more research is badly needed. Whether the technology iseventually deemed reliable enough for the courts will ultimately be decided bythe judges. Let\'s hope they\'re wise enough not to be fooled by a machine thatclaims to determine truthfulness at the flip of a switch. They should also beskeptical of the growing tendency to try to reduce all human traits and actionsto the level of brain activity.&nbsp;Often,they do not map that easily.</p><p>Moreover,understanding the brain is not the same as understanding the mind. Someresearchers have suggested that thoughts cannot properly be seen as purelyinternal. Instead, thoughts make sense only in reference to the individualsexternal world. So while there may be insights to be gained from matchingbehavior to brain activity, those insights will not necessarily lead to justicein a court of law. Problems surround the use of machines to spot deception, atleast until it has been rigorously tested.&nbsp;<span style="background-color: rgb(123, 91, 161);">（18）A high tech test that can tell when aperson is not telling the truth. Sounds too good to be true. And when somethingsounds too good to be true, it usually is.</span></p><p><strong>Question 16.&nbsp;</strong>What haveresearchers and law enforcement agencies tried to do?</p><p><strong>Questions17.</strong>&nbsp;How do manybrain scientists respond to the Massachusetts companies so called technologicalbreakthrough?</p><p><strong>Question 18.&nbsp;</strong>What does thespeaker think of using a high tech test to determine whether a person istelling the truth?</p><p><strong>讲座1解析</strong></p><p>如同上课时我们讲到的，讲座题一定要听好开头，开头往往揭示主题。本篇开头即提到一类人，mastersof deception。对于生僻名词必然给出解释: Those rare individuals witha natural ability to tell with complete confidence, when someone is telling alie.</p><p>当我们听到But is this really the ultimate toolfor you? The lawyers of tomorrow? You will not find many brain scientistscelebrating this breakthrough.&nbsp;时，我们得知很多科学家持反对意见。</p><p>我们在设问后的问题之处得知but之后便是17题的答案，has not provided credible proof.</p><p>本篇难点在于16,17题离得比较近，符合我们所讲的连续出题原则，考生须在确定一题答案后马上开始对下一题的判断。后面大段不出题，知道最后给出最后一题的答案。</p><p>18题作者对于使用高科技仪器测谎的想法是too good tobe true，所以需要选择和负面色彩相关的选项。</p><p><strong>Recording Two</strong></p><p>Lastweek, I attended a research workshop on an island in the South Pacific. Thirtypeople were present, and all except me came from the island called Mcclure inthe nation of Vanuatu.&nbsp;<span style="background-color: rgb(123, 91, 161);">Theylive in sixteen different communities and speak sixteen distinct languages. Inmany cases, you could stand at the edge of one village and see the outskirts ofthe next community.&nbsp;（19）Yet the residents of each village speak acompletely different language.&nbsp;</span>According to recent work by my colleaguesat the Max Plank Institute for the science of human history, this island, justone hundred kilometers long and twenty kilometers wide, is home to speakers ofperhaps forty different indigenous languages.&nbsp;<span style="background-color: rgb(123, 91, 161);">（20）Why so many? We could ask the samequestion of the entire globe. People don\'t speak one universal language or evena handful. Instead, today, our species collectively speaks over seven thousanddistinct languages, and these languages are not spread randomly across theplanet.</span>&nbsp;For example, far more languages are found intropical regions that in the milestones. the tropical island of new guinea ishome to over nine hundred languages, Russia, twenty times larger, has 105indigenous languages.</p><p>Evenwithin the tropics, language diversity varies widely. For example, the twohundred and fifty thousand people who live on Vanuatu’s eighty islands speak110 different languages. But in Bangladesh, a population six hundred timesgreater speaks only 41 languages. How come humans speak so many languages? Andwhy are they so unevenly spread across the planet? As it turns out, we have fewclear answers to these fundamental questions about how humanity communicates.Most people can easily brainstorm possible answers to these intriguingquestions. They hypothesized that language diversity must be about history,cultural differences, mountains or oceans dividing populations.</p><p>Butwhen our diverse team of researchers from six different disciplines and eightdifferent countries began to review what was known, we were shocked that only adozen previous studies had been done, including one we ourselves completed onlanguage diversity in the Pacific. These prior efforts all examine the degreeto which different environmental, social, and geographic variables correlatedwith a number of languages found in a given location. The results varied a lotfrom one study to another, and no clear patterns emerged. The studies also ranup against many methodological challenges, the biggest of which centered on theold statistical saying, “Correlation does not equal causation”.</p><p><strong>Question19.&nbsp;</strong>What does thespeaker say about the island of Mcclure?</p><p><strong>Question 20.</strong>&nbsp;What do welearn from the talk about languages in the world?</p><p><strong>（缺21题）</strong></p><p><strong>讲座2解析</strong></p><p>本篇听好开头an island in the South Pacific，即知道内容说的和岛屿相关，当听到the island called Mcclure in the nation of Vanuatu，便需认真听后面的内容，They live in sixteen different communities and speak sixteendistinct languages.&nbsp;知道本文确切内容为语言。</p><p>19题为转折后出题：the residents of eachvillage speak a completely different language。</p><p>20题符合问句后出题。答案为转折处instead之后的内容：&nbsp;today, our species collectively speaks over seven thousand distinctlanguages, and these languages are not spread randomly across the planet.</p>',
          userId: '158288783747113535288837',
          logo: '/upload/files/1585647669321-94805016-cet620181202.mp3',
          status: 1,
          createdAt: '2020-03-31T10:30:00.000Z',
          updatedAt: '2020-03-31T10:30:00.000Z',
          questions: [
            {
              id: '15856506004785278431L031733Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What does the man say is physics today?',
              option1: ' A journal reporting the latest progress in physics.',
              option2: 'An introductory course of modem physics.',
              option3: 'An occasion for physicists to exchange ideas.',
              option4: 'A series of interviews with outstanding physicists.',
              option5: '4',
              answer: 'D',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L037712Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What happened to Michelle Myers One day?',
              option1: ' She found herself speaking a foreign language.',
              option2: 'She woke up speaking with a different accent.',
              option3: 'She found some symptoms of her illness gone.',
              option4: 'She woke up finding herself in another country.',
              option5: '8',
              answer: 'B',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L048439Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'What does thespeaker think of using a high tech test to determine whether a person istelling the truth?',
              option1: 'It is not to be trusted at all.',
              option2: 'It does not sound economical.',
              option3: " It may intrude into people's privacy.",
              option4: 'It may lead to overuse in court trials.',
              option5: '17',
              answer: 'A',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L053237Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What does the passage say about Gertrude?',
              option1: 'She designed lots of appropriate swimwear for women.',
              option2:
                'She once successfully competed against men in swimming.',
              option3:
                ' She was the first woman to swim across the English Channel.',
              option4:
                "She was an advocate of women's right to swim in public pools.",
              option5: '14',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L067015Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What seems to be the finding of the recent study?',
              option1: 'Matter and anti-matter are opposites of each other.',
              option2: ' Anti-matter allowed humans to come into existence.',
              option3:
                'The universe formed due to a sufficient amount of matter.',
              option4:
                'Anti-matter exists in very high-temperature environments.',
              option5: '7',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L265989Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'What haveresearchers and law enforcement agencies tried to do?',
              option1: 'Build a machine that can detect lies.',
              option2: 'Develop a magnetic brain scanner.',
              option3: 'Test the credibility of court evidence.',
              option4: "Win people's complete trust in them.",
              option5: '15',
              answer: 'A',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L312562Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'What do welearn from the talk about languages in the world?',
              option1: 'They are spread randomly across the world.',
              option2: 'Some are more difficult to learn than others.',
              option3:
                'More are found in tropical regions than in the mild zones.',
              option4:
                'They enrich and impact each other in more ways than one. ',
              option5: '19',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L329605Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'Questions 22 are based on the recording you have just heard.',
              option1: 'Its middle-class is disappearing.',
              option2: 'Its wealth is rationally distributed.',
              option3: 'Its population is rapidly growing.',
              option4: 'Its cherished dream is coming true.',
              option5: '21',
              answer: 'A',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L329906Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'How do manybrain scientists respond to the Massachusetts companies so called technologicalbreakthrough?',
              option1: 'They are optimistic about its potential.',
              option2: ' They are sceptical of its reliability.',
              option3: 'They think it is but business promotion.',
              option4: ' They celebrate it with great enthusiasm.',
              option5: '16',
              answer: 'B',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L346541Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What is the woman physicists? Main research area?',
              option1: 'The future of the physical world.',
              option2: 'The origin of the universe.',
              option3: 'Sources of radiation.',
              option4: 'Particle theory.',
              option5: '5',
              answer: 'B',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L357562Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'Questions 25 are based on the recording you have just heard.',
              option1: 'Reduce the administrative costs.',
              option2: 'Adopt effective business models.',
              option3: 'Hire part-time employees only.',
              option4: 'Make use of the latest technology.',
              option5: '24',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L360953Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What is the woman interested in?',
              option1: 'How matter collides with anti-matter.',
              option2: 'Whether the universe will turn barren.',
              option3: 'Why there exists anti-matter.',
              option4: 'Why there is a universe at all',
              option5: '6',
              answer: 'D',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L396448Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What has the man been busy doing recently?',
              option1: 'Surfing various websites and collecting photos.',
              option2: 'Editing his pictures and posting them online.',
              option3: 'Following similar accounts to compare notes.',
              option4: 'Studying the pictures in popular social media.',
              option5: '2',
              answer: 'B',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L437199Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'Questions 21 are based on the recording you have just heard.',
              option1:
                'They used different methods to collect and analyze data.',
              option2:
                'They identified distinct patterns of language distribution.',
              option3:
                'Their conclusions do not correspond to their original hypotheses.',
              option4:
                'There is no conclusive account for the cause of language diversity.',
              option5: '20',
              answer: 'D',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L475575Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What do we learn about women in the Victorian era?',
              option1: 'They loved vacationing on the seashore.',
              option2: 'They had a unique notion of modesty.',
              option3: 'They were prohibited from swimming.',
              option4: 'They were fully dressed when swimming.',
              option5: '13',
              answer: 'D',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L561384Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'What accent did another American woman speak with after a head injury?',
              option1: 'British',
              option2: 'Irish',
              option3: 'Russian',
              option4: 'Australian',
              option5: '10',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L599805Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What did Jenny Landreth do recently?',
              option1: 'She succeeded in swimming across the English Channel.',
              option2:
                " She published a guide to London's best swimming spots.",
              option3:
                'She told her story of adventures to some young swimmers.',
              option4:
                'She wrote a book about the history of swimwear in the UK.',
              option5: '12',
              answer: 'B',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L702480Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What does the passage say about foreign accent syndrome?',
              option1: ' It is usually caused by a stroke or brain injury.',
              option2: 'It has not yet found any effective treatment.',
              option3: 'It leaves the patient with a distorted memory.',
              option4: 'It often happens to people with speech defects.',
              option5: '9',
              answer: 'A',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L711990Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'what does the woman say about her photos?',
              option1: 'They are far from satisfactory.',
              option2: 'They are mostly taken by her mom.',
              option3: 'They make an impressive album',
              option4: 'They record her fond memories.',
              option5: '3',
              answer: 'A',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L729390Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What has become so popular recently?',
              option1: 'Water sports.',
              option2: 'Racing in rivers.',
              option3: 'Stories about women swimmers.',
              option4: 'Books about swimming.',
              option5: '11',
              answer: 'D',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L748465Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What does thespeaker say about the island of Mcclure?',
              option1: 'Most of its residents speak several languages.',
              option2: 'Some of its indigenous languages are dying out.',
              option3:
                'Each village there speaks a totally different language.',
              option4:
                'Its languages have interested researchers the world over.',
              option5: '18',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L899129Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'Questions 23 are based on the recording you have just heard.',
              option1: 'Success was but a dream without conscientious effort.',
              option2: 'They could realize their dreams through hard work.',
              option3: 'A few dollars could go a long way.',
              option4: 'Wealth was shared by all citizens.',
              option5: '22',
              answer: 'B',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L907615Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What does the man asked the woman to do?',
              option1: 'Stop worrying about him.',
              option2: 'Keep away from the statue.',
              option3: ' Take a picture of him.',
              option4: 'Pat on a smile for the photo.',
              option5: '0',
              answer: 'C',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L984763Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title: 'What does the man dream of?',
              option1: 'Gaining great fame on the Internet.',
              option2: 'Publishing a collection of his photos.',
              option3: 'Collecting the best photos in the world.',
              option4: 'Becoming a professional photographer.',
              option5: '1',
              answer: 'A',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            },
            {
              id: '15856506004785278431L993238Q',
              tid: '15856506004785278431L',
              userId: '158288783747113535288837',
              title:
                'Questions 24 are based on the recording you have just heard.',
              option1: 'Better working conditions.',
              option2: 'Better-paying jobs.',
              option3: 'High social status.',
              option4: ' Full employment.',
              option5: '23',
              answer: 'D',
              createdAt: '2020-03-31T10:30:00.000Z',
              updatedAt: '2020-03-31T10:30:00.000Z'
            }
          ],
          user: {
            name: 'admin'
          }
        }
      }
      console.log(res)
      this.isShowAnswer = false
      res.data.questions.map((item, index) => {
        item.answerTemp = ''
        item.isWrong = false
      })
      this.listeningDetail = res.data
      // 用数据库表中没用到的option5字段作为排序的值
      this.listeningDetail.questions.sort(this.compare('option5'))
      console.log(this.listeningDetail)
      this.listeningDetail.fileName = this.listeningDetail.logo.substr(
        this.listeningDetail.logo.lastIndexOf('-') + 1,
        this.listeningDetail.logo.lastIndexOf('.')
      )
      this.listeningDetail.fileType =
        this.imgList.indexOf(
          this.listeningDetail.logo.substr(
            this.listeningDetail.logo.lastIndexOf('.') + 1
          )
        ) > -1
          ? 'img'
          : 'video'
    },
    compare(property) {
      return function(a, b) {
        const value1 = a[property]
        const value2 = b[property]
        return parseInt(value1) - parseInt(value2)
      }
    },
    submit() {
      let hasFinished = true
      for (let i = 0; i < this.listeningDetail.questions.length; i++) {
        // 判断是否有答案没有选择
        if (!this.listeningDetail.questions[i].answerTemp) {
          hasFinished = false
          break
        }
      }
      if (!hasFinished) {
        this.$message({
          showClose: true,
          message: '您还有试题没有答完呢',
          type: 'warning'
        })
        return false
      }

      // 错题列表
      const falseList = []
      // 用于计算分数score
      const totalLength = this.listeningDetail.questions.length
      let falseLength = 0
      // 遍历题目正误
      this.listeningDetail.questions.map((item, index) => {
        console.log('你选择的答案:', item.answerTemp, '正确答案:', item.answer)
        // 判断选中的选项是否正确
        item.isWrong = item.answer !== item.answerTemp
        // 如果题目错误，错题数加1
        item.isWrong ? falseLength++ : ''
        // 如果题目错误，错题列表添加相对应题目的索引
        item.isWrong ? falseList.push(index + 1) : ''
      })
      // 记录分数
      this.score = ((totalLength - falseLength) / totalLength) * 100
      const message =
        this.score < 60
          ? `小伙子不行啊,已为您标注错误题：<span style="color:#f5862b;">${falseList.join(
            ','
          )}</span>`
          : this.score < 70
            ? `继续努力吧,您错误题为：<span style="color:#f5862b;">${falseList.join(
              ','
            )}</span>`
            : this.score < 80
              ? `还可以,您错误题为：<span style="color:#f5862b;">${falseList.join(
                ','
              )}</span>`
              : this.score < 90
                ? `成绩不错，加油,您错误题为：<span style="color:#f5862b;">${falseList.join(
                  ','
                )}</span>`
                : this.score < 100
                  ? `非常优秀,您错误题为：<span style="color:#f5862b;">${falseList.join(
                    ','
                  )}</span>`
                  : '快把我的九齿钉耙拿来给秀儿梳头！'
      this.$message({
        showClose: true,
        message: `您的分数为：${this.score},${message}`
      })

      //  提交状态
      this.hasSubmit = true
    },
    reTry() {
      this.getListeningDetail()
      this.hasSubmit = false
    },
    deleteListening(id) {
      // $.post('/api/listening/delete', {
      //   id
      // })
      //   .done(data => {
      //     if (data.code !== 0) {
      //       console.log(data.msg)
      //       return false
      //     }
      //     this.$message({
      //       showClose: true,
      //       message: data.msg
      //     })
      //     setTimeout(function() {
      //       location.href = '/listening'
      //     }, 500)
      //   })
      //   .fail(err => {
      //     throw err
      //   })
    }
  }
}
</script>

<style lang='scss' scoped>
.listen-detail {
  min-width: 1300px;
  // padding-top: 54px;

  .listen-content {
    width: 1200px;
    margin: 0 auto;
    padding-bottom: 20px;

    .header-title {
      font-size: 30px;
      line-height: 1.3;
      font-weight: 500;
      padding: 10px 0;
    }
    .header-info {
      display: flex;
      justify-content: flex-start;
      align-items: center;
      width: 500px;
      height: 24px;
      .author {
        font-size: 18px;
        color: rgb(146, 143, 143);
        cursor: pointer;
        &:hover{
          color: rgb(7, 7, 122);
        }
      }
      .date {
        margin: 0 6px;
        padding: 0 6px;
        border-left: 1px solid #999;
        border-right: 1px solid #999;
        font-size: 14px;
        color: #999;
        i{
          font-size: 14px;margin-right: 5px;
        }
      }
      .download {
        cursor: pointer;
        font-size: 16px;
        color: #999;
        &:hover{
          color: rgb(7, 7, 122);
        }
      }
    }
    .post-body {
      .resource {
        margin: 10px 0;
      }
      .news-question {
        width: 100%;
        .question-list {
          width: 100%;
          .question-item {
            width: 100%;
            height: 100px;
            .item-title {
              font-size: 18px;
              font-weight: 500;
              margin-bottom: 20px;
            }
            .item-options {
              width: 100%;
              display: flex;
              .options {
                display: flex;
                width: 25%;
                color: #666;
                label {
                  margin-left: 6px;
                  line-height: 1.5;
                }
              }
            }
          }
        }
        .btn-list {
          display: flex;
          align-items: center;
          /deep/ .sub-btn {
            padding: 8px 16px;
          }
        }
        .detail-list {
          span {
            font-size: 12px;
            cursor: pointer;
          }
          margin-left: 5px;
        }
      }
      .answer-wrap {
        width: 100%;
        margin-top: 10px;
        h3 {
          font-size: 18px;
          font-weight: 500;
          line-height: 24px;
          margin-bottom: 10px;
        }
      }
    }
  }
}
.no-result {
  width: 100%;
  text-align: center;
  font-size: 18px;
}
.show {
  color: #f5862b;
}
.unshow {
  color:#f22424;
}

</style>
