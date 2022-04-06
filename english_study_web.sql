/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : english_study_web

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 06/04/2022 22:06:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `published_time` datetime(0) NULL DEFAULT NULL COMMENT '文章发布时间',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章正文',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `is_published` tinyint(1) NOT NULL COMMENT '公开或私密',
  `is_comment_enabled` tinyint(1) NOT NULL COMMENT '评论开关',
  `is_top` int(20) NOT NULL COMMENT '是否置顶',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `views` int(11) NULL DEFAULT NULL COMMENT '浏览次数',
  `words` int(11) NULL DEFAULT NULL COMMENT '文章字数',
  `read_time` int(11) NULL DEFAULT NULL COMMENT '阅读时长(分钟)',
  `like_num` bigint(20) NULL DEFAULT NULL COMMENT '点赞数量',
  `categoryId` bigint(20) NULL DEFAULT NULL COMMENT '文章分类',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`, `created_at`) USING BTREE,
  INDEX `type_id`(`categoryId`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (18, '双语：古特雷斯秘书长2021年世界水日致辞', '1647850513659.jpg', 3, '2022-03-25 08:04:22', '<p><img class=\"aligncenter size-medium\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.en84.com/pic/2103/202103224.jpg\" alt=\"World Water Day 2021\" width=\"500\" height=\"333\" /></p>\n<p style=\"text-align: center;\"><strong>Message by United Nations Secretary-General Ant&oacute;nio Guterres on</strong><strong>&nbsp;World Water Day</strong></p>\n<p style=\"text-align: center;\"><strong>联合国秘书长<span class=\"keyword-inner\">安东尼奥&middot;古特雷斯</span>世界水日致辞</strong></p>\n<p>&nbsp;</p>\n<p>22 March 2021</p>\n<p>2021年3月22日</p>\n<p>&nbsp;</p>\n<p>This year&rsquo;s World Water Day, with the theme &ldquo;Valuing water&rdquo;, asks: What does water mean to me?</p>\n<p>&nbsp;</p>\n<p>今年世界水日的主题是&ldquo;珍惜水&rdquo;。世界水日让我们思考：水对我而言意味着什么？</p>\n<p>&nbsp;</p>\n<p>The value of water is profound and complex. There is no aspect of sustainable development that does not fundamentally rely upon it.</p>\n<p>&nbsp;</p>\n<p>水的价值具有重大而复杂的意义。可持续发展的方方面面都以水为本。</p>\n<p>&nbsp;</p>\n<p>For me, water means protection. A well-managed water cycle &ndash; encompassing drinking water, sanitation, hygiene, wastewater, transboundary governance, the environment and more &ndash; means a defence against ill-health and indignity and a response to challenges from a changing climate and increasing global demand.</p>\n<p>&nbsp;</p>\n<p>对我而言，水意味着保护。管理良好的水循环包含保障饮用水、环境卫生和个人卫生、废水处理、跨界治理、环境保护等内容。管理良好的水循环意味着保护健康免受损害、尊严免遭侮辱，还意味着应对气候变化和不断增长的全球需求带来的挑战。</p>\n<p>&nbsp;</p>\n<p>This World Water Day, we want to record and understand as many views as possible, so decision-makers are better informed and equipped to safeguard this human right for every person and every purpose.</p>\n<p>&nbsp;</p>\n<p>值此世界水日，我们希望记录和了解尽可能多的观点，以便决策者更好地了解情况，更有能力保障人人享有这项人权，以实现每项目标。</p>\n<p>&nbsp;</p>\n<p>Today, we are not on track to ensure everyone has access to water and sanitation by 2030, as set out in&nbsp;<em>Sustainable Development Goal 6</em>. While advances being made, current progress needs to quadruple to achieve universal access.</p>\n<p>&nbsp;</p>\n<p>今天我们还无法按照可持续发展目标6的规定，确保到2030年使人人享有水和环境卫生。尽管已取得进展，但目前的进展需要翻两番才能实现普遍享有的目标。</p>\n<p>&nbsp;</p>\n<p>Chronic under-investment in water and sanitation disadvantages and harms vast numbers of people. This is unacceptable.</p>\n<p>&nbsp;</p>\n<p>对水和环境卫生的投资长期不足，使许多人处于不利地位并受到伤害。这是不可接受的。</p>\n<p>&nbsp;</p>\n<p>I am encouraged by the joint statement signed by some 160 countries during the UN High-Level meeting on water on 18 March. This shows a strong commitment to advancing all water-related aspects of the&nbsp;<em>Sustainable Development Goals</em>.</p>\n<p>&nbsp;</p>\n<p>3月18日，约160个国家在联合国水问题高级别会议上签署了联合声明，这令我感到鼓舞。这表明为推进可持续发展目标中所有与水有关的目标作出了坚定承诺。</p>\n<p>&nbsp;</p>\n<p>On this World Water Day, let us commit to intensifying efforts to truly valuing water so all may have equitable access to this most precious resource.</p>\n<p>&nbsp;</p>\n<p>值此世界水日，让我们承诺加紧努力，真正珍惜水，使所有人都能公平获得这一最宝贵的资源。</p>', 'Message by UN Chief for World Water Day 2021', 0, 1, 6, '2021-03-24 15:05:08', '2021-05-07 17:58:09', 21, 690, 3, 0, 5, NULL);
INSERT INTO `article` VALUES (19, '测试文章210', '1647850513659.jpg', 3, '2022-03-25 09:30:22', '<divclass=\"caas-body\"><figureclass=\"caas-figure\"><divclass=\"caas-figure-with-pb\"><div><divclass=\"caas-img-container\"><imgclass=\"caas-img has-preview caas-loaded\"src=\"https://s.yimg.com/ny/api/res/1.2/4KmF00KWVkGOJ2ylyAxB0g--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MC4wNjIzMjk1Njc1ODg3O2NmPXdlYnA-/https://s.yimg.com/uu/api/res/1.2/ePnygq8htx69okVjEK.xtA--~B/aD0zNDIzO3c9NTEzNDthcHBpZD15dGFjaHlvbg--/https://media.zenfs.com/en/the_independent_635/d7f54bfeb8831085f14c83f3a82d7369\"alt=\" (AP)\"/></div></div></div><divclass=\"caption-wrapper caption-aligned-with-image\"><divclass=\"caption-wrapper caption-aligned-with-image\">&nbsp;</div></div><figcaptionclass=\"caption-collapse\"data-id=\"m-0\">(AP)</figcaption></figure><p>Amongtheitemson&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://www.independent.co.uk/topic/texas\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:Texas\"data-rapid_p=\"6\"data-v9y=\"1\">Texas</a>&nbsp;governor&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://www.independent.co.uk/topic/greg-abbott\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:Greg Abbott\"data-rapid_p=\"7\"data-v9y=\"1\">GregAbbott</a>&rsquo;slistofemergencyprioritiesin2021:&ldquo;electionintegrity&rdquo;.</p><p>ThephrasehasemergedamongRepublicanlawmakersinstatelegislaturesacrosstheUS,asstatesconsiderdozensofGOP-backedbillstorestrictvotingaccessinthewakeofthe2020electionsthatsawunprecedentedvoterturnoutandexpandedvote-by-mailoptionsduringthecoronaviruspandemic.</p><p>RepublicanlawmakersinTexashavefiledmorethantwodozenbillsaimedatrestrictingvotinginastatethatalreadyhassomeofthemostrestrictivevotinglawsinthecountry,whichvotingrightsgroupssaydisproportionatelythreatenandsuppressvotesfromBlackvoters.</p><p>GovernorAbbottsaidonMondaythatthebillsareaimedatrestoring&ldquo;trustandconfidenceintheoutcome&rdquo;ofthestate&rsquo;selections,althoughhealsoadmittedthatheisnotawareofanyelectionsalteredbyfraud.</p><p>Texasisamong43stateswhereRepublicanlawmakershaveintroducedmorethan250billsrestrictingvotingrights,limitingballotaccessoraddingbarrierstovoting.GOPlawmakershavesaidthebillsaimtorestore&ldquo;trust&rdquo;inelections,compelledbybaselessclaimsofelectionfraudpromotedbyformerpresidentDonaldTrump.</p><p>Votingrightsadvocatesandcivilrightsgroupshavearguedthattheformerpresident&rsquo;spersistentliethattheelectionwasstolenfromhim,andhislegalteam&rsquo;sattemptstooverturnmillionsofAmericans&rsquo;votes,hasemboldenedRepublicanstatelawmakersacrosstheUStodowhatMrTrumpandhisattorneyscouldnot,using&ldquo;electionintegrity&rdquo;or&ldquo;electionsafety&rdquo;tomaskMrTrump&rsquo;sclaimsattheheartoftheirobjections.</p><p>Electionofficialsacrossthecountry&ndash;aswellastheformerpresident&rsquo;sownattorneys,JusticeDepartmentandafederalelectionscommission,whichhedisbanded&ndash;havefailedtoproduceanyevidencethatsuchwidespreadfraudexists.</p><p>&ldquo;Rightnow,Idon&rsquo;tknowhowmany,orifany,electionsinthestateofTexasin2020werealteredbecauseofvoterfraud,&rdquo;GovernorAbbottsaidonMonday.</p><p>Adayearlier,thegovernoraccusedDemocraticlawmakersinCongressof&ldquo;tryingtoinstitutionalisevoterfraud&rdquo;intheUSwiththe&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://www.independent.co.uk/news/world/americas/us-politics/for-the-people-act-democrats-b1812180.html\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:passage of HR 1, or the For The People Act\"data-rapid_p=\"12\"data-v9y=\"1\">passageofHR1,ortheForThePeopleAct</a>,whichwouldenshrineintofederallawsomevotingaccesseffortsalreadyinplaceinseveralstates,includingautomaticvoterregistrationandsame-dayregistrationandexpandedmail-invoting.</p><p>&ldquo;Everyoneknows,includingDemocratsinTexas&hellip;thatoneoftheeasiestwaystocheatinelectionsisthroughthesemail-inballots,&rdquo;hesaid,withoutprovidinganyevidence.</p><p>TexasAttorneyGeneralKenPaxton&rsquo;sofficehasspent22,000hourslookingforvoterfraudanduncoveredjust16casesofvoterregistrationformsthatcontainedfalseaddresses,accordingto&nbsp;<em>TheHoustonChronicle</em>.Texas&ndash;thesecond-mostpopulousstateintheUS&ndash;hasmorethan16millionregisteredvoters.Theofficehasdiscovered100voterfraudcasessince2005.</p><p>GOP-sponsoredbillsinTexaswouldpurgevoterrolls,addmorelayerstovoterIDlaws,shrinkmail-invotingperiods,andshutterearlyvotingandmail-invotingsites.</p><p>Oneproposalwouldeliminatetheuseoftentsandotherstructuresfordrive-throughearlyvoting,whichwasusedinseverallargeTexascountiestoaccommodatemail-inballotdrop-offstoensureballotsweredeliveredontimeamidapandemicwithabeleagueredUSPostalServicethatsawwidespreaddelaysandservicecuts.</p><p>HarrisCounty,oneofthelargestcountiesintheUS,had12satelliteoffices,coveringthegreaterHoustonarea.Thecountycoversmorethan1,700squaremiles,withmorethan2.4millionregisteredvoters.</p><divclass=\"twitter-tweet-wrapper\"><blockquoteclass=\"twitter-tweet caas-loaded\"data-theme=\"light\"><divclass=\"caas-card-loader small fixed-height\">&nbsp;</div><p>VotersuppressionhasanefariousanddarkhistoryinTexas,onethatshouldn\'t be seen as clearly in our election laws as it is today.<br /><br />We are more than overdue for common sense reforms like enacting online voter registration in Texas. Let\'smakeithappenthissession.&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://twitter.com/hashtag/txlege?src=hash&amp;ref_src=twsrc%5Etfw\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:#txlege\"data-rapid_p=\"13\"data-v9y=\"1\">#txlege</a>&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://t.co/PdYbh7NjDc\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:https://t.co/PdYbh7NjDc\"data-rapid_p=\"14\"data-v9y=\"1\">https://t.co/PdYbh7NjDc</a></p><p>&mdash;Rep.EddieRodriguez(@EddieforTexas)&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://twitter.com/EddieforTexas/status/1371558707054710789?ref_src=twsrc%5Etfw\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:March 15, 2021\"data-rapid_p=\"15\"data-v9y=\"1\">March15,2021</a></p></blockquote></div><p>InTravisCounty,whichholdsthestate&rsquo;scapitalofAustin,officialshadopenedfoursatellitelocationsforvoterstohand-delivertheirmail-inballots.Thecountyof1.2millionpeopleincludesmorethan800,000registeredvoters,allwithinacountythat&rsquo;smorethan1,000squaremiles.</p><p>Lastyear,Republicans&nbsp;<aclass=\"link rapid-noclick-resp\"href=\"https://www.independent.co.uk/news/world/americas/us-election/texas-ballot-dropoff-boxes-lawsuit-2020-election-b750186.html\"target=\"_blank\"rel=\"nofollow noopener\"data-ylk=\"slk:repeatedly targeted early voting sites in lawsuits and in an executive order\"data-rapid_p=\"16\"data-v9y=\"1\">repeatedlytargetedearlyvotingsitesinlawsuitsandinanexecutiveorder</a>&nbsp;fromthegovernor&rsquo;soffice.OnMonday,thegovernorcalleditan&ldquo;unauthorisedexpansion&rdquo;ofmail-invoting.</p><p>TexasDemocratsandvotingrightsgroupsinthestatehaveslammedthegovernor&rsquo;sagendaandGOP-backedlegislation.</p><p>&ldquo;IfGovernorAbbotwantstotalkaboutelectionintegrity,hecanstartwiththis:whenthevotershavespoken,respecttheresults,&rdquo;saidChrisTurner,chairoftheTexasHouseDemocraticCaucus.</p><p>&ldquo;Votingrightsarehumanrights,&rdquo;saidTexasStateRepresentativeNicoleCollier.&ldquo;Allcitizensofthisstatedeservetohavetheirvoicesheardandtolegallyaccesstheballotboxwithoutfear.&rdquo;</p></div>', '测试10描述', 0, 1, 0, '2021-03-25 19:48:44', '2021-03-25 21:02:57', 1, 1, 1, 0, 4, '2021-03-27 15:45:43');
INSERT INTO `article` VALUES (20, '古特雷斯世界提高自闭症意识日致辞', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p><img class=\"aligncenter size-medium\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.en84.com/pic/2104/2021040211.jpg\" alt=\"World Autism Awareness Day 2021\" width=\"500\" height=\"333\" /></p>\n<p style=\"text-align: center;\"><strong>Message by</strong>&nbsp;<strong>Ant&oacute;nio Guterres, Secretary-General of United Nations, on World Autism Awareness Day</strong></p>\n<p style=\"text-align: center;\"><strong>联合国秘书长<span class=\"keyword-inner\">安东尼奥&middot;古特雷斯</span>世界提高自闭症意识日致辞</strong></p>\n<p>&nbsp;</p>\n<p>2 April 2021</p>\n<p>2021年4月2日</p>\n<p>&nbsp;</p>\n<p>As we work together to recover from the COVID-19 pandemic, one key goal must be to build a more inclusive and accessible world that recognizes the contributions of all people, including persons with disabilities.</p>\n<p>&nbsp;</p>\n<p>当我们共同努力从COVID-19大流行中恢复之际，必须树立一个关键目标，即建设更加包容且无障碍的世界，对包括残疾人在内的所有人的贡献予以认可。</p>\n<p>&nbsp;</p>\n<p>The crisis has created new obstacles and challenges. But efforts to reignite the global economy offer an opportunity to reimagine the workplace to make diversity, inclusion and equity a reality.</p>\n<p>&nbsp;</p>\n<p>这场危机带来了新的障碍与挑战。不过，重振全球经济的努力为重新畅想工作场所创造了机遇，让多元、包容和公平成为现实。</p>\n<p>&nbsp;</p>\n<p>Recovery is also a chance to rethink our systems of education and training to ensure that persons with autism are afforded opportunities for realizing their potential.</p>\n<p>&nbsp;</p>\n<p>复苏还提供了机会，让我们重新思考教育和培训系统，确保自闭症患者有机会实现潜力。</p>\n<p>&nbsp;</p>\n<p>Breaking old habits will be crucial. For persons with autism, access to decent work on an equal basis requires creating an enabling environment, along with reasonable accommodation.</p>\n<p>&nbsp;</p>\n<p>打破旧习至关重要。为使自闭症患者平等获得体面工作，需要创造有利的环境，并为他们提供合理便利。</p>\n<p>&nbsp;</p>\n<p>To truly leave no one behind in pursuit of the&nbsp;<em>2030 Agenda on Sustainable Development</em>, we must realize the rights of all persons with disabilities, including persons with autism, ensuring their full participation in social, cultural and economic life.</p>\n<p>&nbsp;</p>\n<p>在落实《2030年可持续发展议程》的过程中，若要真正不让任何一个人掉队，我们必须实现包括自闭症患者在内的所有残疾人的权利，确保他们充分参与社会、文化和经济生活。</p>\n<p>&nbsp;</p>\n<p>Let us work together with all persons with disabilities and their representative organizations to find innovative solutions to recover better and build a better world for all.</p>\n<p>&nbsp;</p>\n<p>让我们与所有残疾人及其代表组织共同努力，寻找创新解决办法，从而更好地恢复，并为所有人建设一个更美好的世界。</p>', 'Message by UN Chief for World Autism Awareness Day 2021', 1, 1, 0, '2021-04-03 01:08:27', '2021-05-08 16:30:21', 5, 541, 2, 0, 5, NULL);
INSERT INTO `article` VALUES (21, '新闻素养第一课：真新闻与假新闻', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\"><video controls=\"controls\" width=\"730\" height=\"365\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190505ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 1: Real News vs. Fake News</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第一课：真新闻与假新闻</strong></p>\n<p>Information is an important part of our society. People depend on it to guide them through a complex world.</p>\n<p>信息是社会的重要组成部分，人们依靠它引导着自己认识复杂的世界。</p>\n<p>The invention of movable type in 15th century Europe revolutionized the communication of ideas. This invention made it possible to print and publish information to masses of people.</p>\n<p>15世纪欧洲发明的活字印刷术使思想交流发生了革命性的变化，这项发明使印刷和向大众发布信息成为可能。</p>\n<p>This free flow of information eventually led to a free press in many parts of the world. But because information is so powerful, many world leaders have tried to stop it.</p>\n<p>这种信息的自由最终引领了世界许多地区的新闻自由。但由于信息太过强大，许多世界领导人试图阻止它。</p>\n<p>French leader Napoleon Bonaparte once said he feared four newspapers more than 1,000 bayonets.</p>\n<p>法国领导人拿破仑&middot;波拿巴曾经说过，他害怕四家报纸超过1000支刺刀。</p>\n<p>The Chinese emperor who oversaw the building of the Great Wall famously used his power to stop published information. Qin Shi Huang ordered the burning of thousands of books on subjects he wanted to keep from the people. He even had hundreds of scholars executed for refusing to give up their book collections.</p>\n<div>&nbsp;</div>\n<p>中国监督长城建造的皇帝，成功地使用他的权力阻止了信息传播。秦始皇下令烧毁数千本关于他不想要人民看到的主题的书，他甚至处决了数百名拒绝放弃藏书的学者。</p>\n<p>Even powerful leaders in modern times have succeeded in blocking material they do not want the people to see, as in Russia and China.</p>\n<p>就像俄罗斯和中国一样，即使是现代的当权者也成功地阻止了他们不想让人民看到的信息。</p>\n<p>But when true information is allowed to reach the people, good results can follow. Information has fueled successful revolutions in many nations. Government atrocities have been identified and world leaders have been forced to be held accountable for their actions.</p>\n<p>但是，当真正的信息传递给人们时，好的结果会产生，信息推动了许多国家的成功革命。政府的暴行已经被确认，迫使世界领导人对自己的行为负责。</p>\n<p>Advances in media technology have made words and images more powerful and widespread than ever. Smart phones and social media have become quick and easy tools to receive and share news and information. These tools have even made it possible for anyone with a device to gather and publish &ldquo;news.&rdquo;</p>\n<p>媒体技术的进步使文字和图像比以往任何时候都更加强大，传播更加广泛。智能手机和社交媒体已经成为接收和分享新闻、信息的便捷工具。这些工具甚至使任何拥有设备的人都有可能收集和发布&ldquo;新闻&rdquo;。</p>\n<p>This media environment makes it important for us to be able to recognize reliable information. True information gives us the facts to guide our decisions and actions.</p>\n<p>这种媒体环境使得我们能够识别可靠的信息变得非常重要。真实的信息给了我们事实来指导我们的决定和行动。</p>\n<p>In addition to informing, news can also divert.</p>\n<p>除了通知之外，新闻也可以使我们开心。</p>\n<p>This means it can focus our attention on something we are interested in as a kind of escape. An example would be news about subjects we seek out for enjoyment, such as entertainment, celebrities or sports.</p>\n<p>这意味着它可以把我们的注意力集中在我们感兴趣的东西上，作为一种逃避的方式。一个例子就是关于我们寻找娱乐等主题的新闻，比如娱乐、名人或运动。</p>\n<p>News can also serve as a way to connect us as human beings. This could include stories about tragedies or uplifting events that affect us emotionally. Such stories can lead people to join a cause or donate money to help those in need.</p>\n<p>新闻也可以作为连接我们人类的一种方式，这可能包括影响我们情感的悲剧或令人振奋的故事，这样的故事可以引导人们加入一个事业，或者捐钱帮助那些有需要的人。</p>\n<p>No matter what kind of news we experience, we have to be able to tell whether it is authentic or not. In the coming lessons, we will show you the steps; how you can do this.</p>\n<p>无论我们经历的是什么样的新闻，我们都必须能够判断它是否真实。在接下来的课程中，我们将向您展示如何做到这些。</p>\n<p>&nbsp;</p>\n<p><strong>Words in This Story</strong></p>\n<p><strong>type&nbsp;</strong>- n. standardized letters for printing</p>\n<p><strong>masses</strong>&nbsp;- n. large groups of people</p>\n<p><strong>bayonet</strong>&nbsp;- n. Knife at the end of a rifle</p>\n<p><strong>atrocity</strong>&nbsp;- n. a cruel and terrible act</p>\n<p><strong>device&nbsp;</strong>- n. an item, such as mobile phone or radio</p>\n<p><strong>reliable</strong>&nbsp;- adj. can be trusted to do the correct thing</p>\n<p><strong>divert</strong>&nbsp;- v. to change direction, or move one\'s attention</p>', 'voa慢速英语视频:News Literacy Lesson 1: Real News vs. Fake News', 1, 1, 2, '2021-04-04 14:31:36', '2021-04-20 20:17:16', 4, 1138, 4, 0, 7, NULL);
INSERT INTO `article` VALUES (22, '新闻素养第二课：验证、独立、问责', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\"><video controls=\"controls\" width=\"730\" height=\"365\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190506ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 2: Verification, Independence, Accountability</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第二课：验证、独立、问责</strong></p>\n<p>What is legitimate journalism? It is news that has been verified by an independent organization that is accountable for the information.</p>\n<p>什么是合法新闻?就是一个对信息负责的独立组织已经核实过的新闻。</p>\n<p>Verification, independence and accountability are the characteristics of quality journalism. Let&rsquo;s examine Verification. It&rsquo;s the process of establishing that information is truthful and accurate.</p>\n<p>验证、独立和问责是高质量新闻工作的特点。我们重点说一下验证，这是建立真实和准确信息的过程。</p>\n<p>Journalists collect information with the goal of providing the most accurate version of events. They talk to sources, dig through information, and provide accurate documents to back up their stories.</p>\n<p>记者收集信息的目的是提供事件最准确的版本，他们谈论消息来源，挖掘信息，并提供准确的文件来支持他们的故事。</p>\n<p>In 2004, the CBS News broadcast 60 Minutes II claimed it had documents critical of the National Guard service of President George W. Bush. But CBS News failed to authenticate the documents and they were, in fact, forgeries.Several journalists, including anchorman Dan Rather, were fired.</p>\n<p>2004年，哥伦比亚广播公司的&ldquo;60分钟(第二季)&rdquo;节目，声称有批评乔治&middot;W&middot;布什总统国民警卫队的文件，但是CBS新闻没有对这些文件进行验证，事实上，这是伪造的，结果包括主持人丹&middot;拉瑟在内的一些记者都被解雇了。</p>\n<p>Independence. It is a freedom from control or influence, combined with impartiality.</p>\n<p>独立，是一种不受控制或影响，与公正相结合的自由。</p>\n<p>Independence includes objectivity, fairness and balance. But what is fairness? What is balance? And how do we determine that?</p>\n<p>独立包括客观性、公平性和平衡性。但什么是公平?什么是平衡?我们怎么确定呢?</p>\n<p>Let&rsquo;s take, for example the myth that the measles, mumps, and rubella (MMR) vaccine is the cause of autism. This claim has been completely discredited, yet several Hollywood celebrities continue to endorse it, some backing an anti-vaccine film made by pseudo-scientists. Should journalists reporting on autism give time to the position of the anti-vaccine believers? No. They are not scientists. Their &ldquo;opinions&rdquo; cannot be balanced against scientific knowledge and certainty. Both sides are not equal and it is misleading to treat them equally.</p>\n<p>让我们以麻疹、腮腺炎和风疹疫苗是孤独症病因的说法为例。这一说法已完全不可信，但一些好莱坞名人仍在支持它，一些人还支持伪科学家制作的一部反疫苗电影。应该给报道孤独症的记者一些时间来了解抗疫苗信徒的立场吗?不需要，他们不是科学家。他们的&ldquo;意见&rdquo;与科学知识和确定性不平衡。两者是不平等的，所以平等对待他们是有误导性的。</p>\n<p>Accountability. The process of taking responsibility for the reporting.</p>\n<p>问责，是为报告负责的过程。</p>\n<p>News organizations should be clearly identified and journalists&rsquo; contact information, easily obtainable. But most importantly, any news organization or journalist should be prepared to admit errors when they&rsquo;ve been made.</p>\n<p>应该清楚地识别新闻机构和记者的联系信息，这些信息很容易获得。但最重要的是，任何新闻机构或记者都应该在错误出现的时候准备承认。</p>\n<p>In 2005, the New York Times asked veteran reporter Judith Miller to resign after it became clear her reporting about the Iraq war was wrong. The Times wrote an extraordinary critique of its own editorial process. That is also accountability.</p>\n<p>2005年，&ldquo;纽约时报&rdquo;要求资深记者朱迪思&middot;米勒辞职，因为她对伊拉克战争的报道显然是错误的。&ldquo;泰晤士报&rdquo;对自己的编辑过程进行了非同寻常的批评，这也是问责。</p>\n<p>Verification, Independence and Accountability. These are the three main elements of journalism and what distinguishes it from other kinds of information.</p>\n<p>验证、独立和问责，这是新闻工作的三大要素，也是新闻与其他信息的区别。</p>\n<p>In our next lesson, we will look more closely at verification.</p>\n<p>在我们的下一课中，我们将更仔细地研究验证问题。</p>\n<p><strong>Words in This Story</strong></p>\n<p><strong>legitimate</strong>&nbsp;- adj. real truthful</p>\n<p><strong>accountable</strong>&nbsp;&ndash; adj. take responsibility for</p>\n<p><strong>characteristic</strong>&nbsp;&ndash; n. a feature of something</p>\n<p><strong>accurate</strong>&nbsp;&ndash; adj. truthful, correct</p>\n<p><strong>forgeries&nbsp;</strong>&ndash; n. something that is created to falsely look real</p>\n<p><strong>Impartiality</strong>&nbsp;&ndash; n. without any interest, seeing both sides equally</p>\n<p><strong>myth</strong>&nbsp;&ndash; n. In our next lesson, we will look more closely at verification.</p>\n<p><strong>autism</strong>&nbsp;&ndash; n. a condition or disorder that begins in childhood and that causes problems in forming relationships and in communicating with other people</p>\n<p><strong>mislead</strong>&nbsp;&ndash; v. to purposely give a false idea to someone</p>\n<p><strong>obtain&nbsp;</strong>&ndash; v. to get, to have</p>\n<p><strong>error</strong>&nbsp;- n. a mistake, something incorrect</p>\n<p><strong>critique</strong>&nbsp;&ndash; n. a careful judgment about something&rsquo;s quality</p>', 'voa慢速英语视频:News Literacy Lesson 2: Verification, Independence, Accountability', 1, 1, 0, '2021-04-04 14:35:14', '2021-04-17 17:48:12', 4, 1056, 4, 0, 7, NULL);
INSERT INTO `article` VALUES (23, '新闻素养第三课：建立真理', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\"><video poster=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190507ms.mp4\" controls=\"controls\" width=\"730\" height=\"365\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190507ms.mp4\" type=\"video/mp4\" />\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190507ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 3: Establishing the Truth</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第三课：建立真理</strong></p>\n<p>Let&rsquo;s examine the verification process a little closer. Becoming a literate news consumer requires us to be able to identify legitimate journalism. Legitimate journalism seeks truth. But how do we define that truth?</p>\n<p>让我们仔细研究一下验证过程。成为一个文学新闻的消费者需要我们能够识别合法的新闻，合法新闻追求的是真理。但我们要怎样定义真实呢?</p>\n<p>Truthful reporting comes from using facts that can be confirmed. All the details may not be known. But a news story should include the latest version of events based on verified facts.</p>\n<p>真实的报道使用的是可以证明的事实，虽然不可能知道所有的细节，但新闻报道应该包括基于事实的最新事件。</p>\n<p>Truth is a journey that evolves over time. It is not possible for us to read one newspaper on one day and get a complete picture of world events. We must seek out multiple sources: newspapers, magazines, television and &ndash; yes &ndash; the internet.</p>\n<p>真理是一段随时间而演变的旅程，我们不可能在某一天读一份报纸，了解到世界上所有事件的全部情况。我们必须通过多种渠道寻找：报纸、杂志、电视，当然还有互联网。</p>\n<p>In Iran recently, massive street demonstrations took place throughout the country.</p>\n<p>最近，伊朗全国各地都发生了大规模的街头示威活动。</p>\n<p>When news organizations reported on these events, the evidence was clear. Images of the protests appeared on television, in newspapers and on the internet. Literate news consumers could be certain the demonstrations took place.</p>\n<p>当新闻机构报道这些事件时，证据是明确的，抗议活动的图像出现在电视、报纸和互联网上，文学新闻的消费者可以确信发生了示威活动。</p>\n<p>But not all evidence is captured on digital equipment. Sometimes evidence comes in the most unreliable form &ndash; memory. It is well known that if a police officer interviews 10 witnesses about a crime, he will receive 10 different versions of events. Yet all were witnesses. A journalist seeking the truth should interview as many witnesses as possible in search of the true story.</p>\n<p>但并不是所有的证据都是在数字设备上捕捉到的，有时证据以最不可靠的形式出现-记忆。众所周知，如果一名警官询问一个案件的10名目击者，他将收到10种关于事件的不同版本的说法，但他们都是目击证人。寻求真相的记者应该采访尽可能多的证人，以寻找事件的真相。</p>\n<p>One of the most exciting developments in the &ldquo;smart phone age&rdquo; is the ability to record events as they happen.</p>\n<p>&ldquo;智能手机时代&rdquo;中最令人兴奋的发展之一是，当事件发生时，能随时记录。</p>\n<p>In May of 2017 former North Charleston, South Carolina police officer Michael Slager admitted in court to shooting and killing Walter Scott. But two years earlier, Officer Slager stated that Scott, pulled over for a traffic violation, had grabbed for his gun. Many news organizations reported Slager&rsquo;s version of the incident. But the next day, a video emerged clearly showing that Slager was lying. He shot Scott in the back as he ran away. News organizations quickly corrected and updated their earlier reporting.</p>\n<p>2017年5月，前北查尔斯顿的南卡罗来纳州警官迈克尔&middot;斯雷格在法庭上承认枪杀了沃尔特&middot;司各特。但是两年前，斯雷格警官说司各特因为交通违规而被逮捕，并抢了他的枪。许多新闻机构报道了斯雷格对这起事件的陈述，但第二天，一段视频的出现清晰地显示出斯雷格在撒谎，当司各特跑走时，他在背后冲司各特开了枪。新闻机构迅速更正和更新了他们先前的报道。</p>\n<p>Verification is the responsibility of both news organizations and journalists. But a literate news consumer also checks often for updates or for corrections in stories because he realizes that sometimes &ndash; even journalists make mistakes.</p>\n<p>核查是新闻机构和记者共同的责任。但是，一个文学新闻消费者也经常核查以更新或修正新闻，因为他意识到，有时即使是记者也会犯错。</p>\n<p>Next, we will examine balance and fairness.</p>\n<p>接下来，我们将研究平衡和公平。</p>\n<p><strong>Words in This Story</strong></p>\n<p><strong>verification</strong>&nbsp;- n. to quickly take and hold (someone or something) with your hand or arms</p>\n<p><strong>literate</strong>&nbsp;- adj. one who can read, write and understand</p>\n<p><strong>consumer&nbsp;</strong>- n. one who uses or buys things</p>\n<p><strong>journey</strong>&nbsp;- n. a trip</p>\n<p><strong>multiple</strong>&nbsp;- adj. many, more than one or two</p>\n<p><strong>grab</strong>&nbsp;- v. to quickly take and hold (someone or something) with your hand or arms</p>\n<p><strong>emerge</strong>&nbsp;- v. to become known or apparent</p>', 'voa慢速英语视频:News Literacy Lesson 3: Establishing the Truth', 1, 1, 4, '2021-04-04 14:37:29', '2021-04-21 14:18:24', 4, 1058, 4, 0, 7, NULL);
INSERT INTO `article` VALUES (24, '新闻素养第四课：平衡，公平', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\"><video controls=\"controls\" width=\"730\" height=\"365\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190508ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 4: Balance, Fairness</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第四课：平衡，公平</strong></p>\n<p>Media organizations often use words like &ldquo;balance&rdquo; and &ldquo;fairness.&rdquo; They want to say that they are reporting without showing favoritism or making judgments. Balance simply means giving equal time to both sides of an issue, or not giving one side more importance.</p>\n<p>媒体机构经常使用&ldquo;平衡&rdquo;和&ldquo;公平&rdquo;这样的词，他们想说，他们的报道并没有显示出偏袒或作出评判。平衡仅仅意味着给问题的两面同等的时间，或不给予一方更多的重视。</p>\n<p>For example, let&rsquo;s consider a report about abortion bills winding their way through U.S. legislatures. A balanced report will give equal time to both supporters of abortion and those opposed to the operation. However, journalists must verify the facts put forth by each side. It is not balance to allow both sides to make any statement supporting their case. This can perpetuate fake news and leaves the reader or viewer without solid information.</p>\n<p>例如，我们来看一份关于堕胎法案在美国立法机构中曲折通过的报告。一份平衡的报告将给予堕胎支持者和反对该法案者同样的时间。但是，记者必须核实双方提出的事实。允许双方发表任何支持其理由的声明是不平衡的，这会使假新闻永久化，而没有把可靠信息留给读者或观众。</p>\n<p>&ldquo;Will you just shut up for a minute and let me finish? Pardon me, sir, you don&rsquo;t get to tell me to shut up and national television.&rdquo;</p>\n<p>&ldquo;你能不能闭嘴，让我说完?对不起，先生，你不能让我和国家电视台闭嘴。&ldquo;</p>\n<p>Shouting and arguing does not bring balance to an issue and it certainly isn&rsquo;t journalism.</p>\n<p>喊和争论并不能使问题得到平衡，当然也不是新闻业。</p>\n<p>But journalists must be careful that seeking balance doesn&rsquo;t lead to unfair reporting, or setting up an unfair moral equivalency or balance, between unequal sides in an argument.</p>\n<p>但是记者们必须注意，寻求平衡不能导致不公平的报道，或者在争论中不平等的双方之间建立不公平的道德对等或平衡。</p>\n<p>Actually, objectivity means reporting the truth, it means getting everybody&rsquo;s truth and reporting it, but never creating a false moral equivalence. Never saying all sides are equal because that&rsquo;s not the truth, false. That&rsquo;s a cop-out, it&rsquo;s a lie.</p>\n<p>事实上，客观性意味着报道真相，也就是得到每个人的真相并报道，但绝不制造虚假的道德对等。永远不要说各方都是平等的，因为这不是事实，是假的，这是没有根据的，是谎言。</p>\n<p>Journalist Christiane Amanpour is talking about the Bosnian War, where she reported on attacks against Bosnian Muslims. Experts called it a kind of ethnic cleansing. To give equal weight to official denials of the violence she saw would have been wrong.</p>\n<p>记者克里斯蒂娜&middot;阿曼普尔正在谈论波斯尼亚战争，她在那里报道了对波斯尼亚穆斯林的袭击，专家称这是种族清洗。对官方否认她所看到的暴力行为给予同样的重视是错误的。</p>\n<p>Fair reporting represents reality, not a simple &ldquo;he said, she said.&rdquo; False moral equivalency is a failure of journalists to carry out their duties.</p>\n<p>公平的报道代表着现实，而不是一个简单的&ldquo;他说的或她说的&rdquo;。虚假的道德等于是记者未能成功履行其职责。</p>\n<p>A smart news consumer must ask: is this coverage fair to the evidence? And what exactly is evidence? In lesson 5 we will explain how to evaluate news coverage in order to answer these questions.</p>\n<p>一个聪明的新闻消费者必须问：这种报道对证据公平吗?证据到底是什么?在第五课，我们将解释如何评估新闻报道，以回答这些问题。</p>\n<p><strong>Words in this story</strong></p>\n<p><strong>abortion</strong>&nbsp;&ndash; n. a medical procedure used to end a pregnancy and cause the death of the fetus</p>\n<p><strong>verify&nbsp;</strong>&ndash; v. to prove, show, find out, or state that (something) is true or correct</p>\n<p><strong>perpetuate</strong>&nbsp;&ndash; v. to cause (something that should be stopped, such as a mistaken idea or a bad situation) to continue</p>\n<p><strong>equivalency</strong>&nbsp;&ndash; n. a level of that is considered to be on the same level</p>\n<p><strong>Ethnic&nbsp;</strong>&ndash; adj. of or relating to races or large groups of people who have the same customs, religion, origin, etc.</p>', 'voa慢速英语视频:News Literacy Lesson 4: Balance, Fairness', 1, 1, 0, '2021-04-04 14:39:01', '2021-04-17 16:43:48', 4, 957, 4, 0, 7, NULL);
INSERT INTO `article` VALUES (25, '新闻素养第五课：新闻报道的质量', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\"><video controls=\"controls\" width=\"730\" height=\"365\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190509ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 5: Quality of News Reports</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第五课：新闻报道的质量</strong></p>\n<p>In this lesson, we present seven steps to help you judge the quality of news reporting:</p>\n<p>在本课程中，我们将介绍七个步骤来帮助您判断新闻报道的质量：</p>\n<p>Step One: Main Points</p>\n<p>第一步：要点</p>\n<p>Be able to recognize and re-state the main points of the story. An intelligent news consumer asks: What are the facts and how are they presented?</p>\n<p>能够识别并再述新闻的要点。一位聪明的新闻消费者问：事实是什么?它们是如何呈现的?</p>\n<p>Step Two: Evidence</p>\n<p>第二步：证据</p>\n<p>Examine the evidence. How has the reporter confirmed the evidence? Is there video you can trust? Is there a paper trail -- documents to prove what happened?</p>\n<p>核实证据。记者是如何证实证据的?有可以信任的视频吗?有书面证据证明发生了什么吗?</p>\n<p>Step Three: Sources</p>\n<p>第三步：来源</p>\n<p>Consider the sources of the story. Are they named or not identified in the story?</p>\n<p>考虑一下新闻的来源，他们在故事中是被指定的还是没有被识别出来的?</p>\n<p>Step Four: Openness</p>\n<p>第四步：开放</p>\n<p>What is the transparency level -- the level of openness -- in the news organization? Where did they get their information?</p>\n<p>新闻机构的透明度-开放程度是多少?他们是从哪里得到信息的?</p>\n<p>Step Five: Knowledge of Subject</p>\n<p>第五步：主题知识</p>\n<p>Is there something to provide context, such as background information or history? Does the reporter have a command of the subject of the report?</p>\n<p>是否有什么可以提供上下文信息，例如背景信息或历史?记者对报道的主题有掌握吗?</p>\n<p>Step Six: The Five &ldquo;W&rdquo;s</p>\n<p>第六步：五个&ldquo;W&rdquo;</p>\n<p>Are important pieces of information missing? Does the report answer the questions: what happened? Where, when and why did it happen? Who was involved?</p>\n<p>重要的信息丢失了吗?报告是否回答了以下问题：发生了什么?在哪里、何时以及为什么会发生这种情况?谁被牵扯进来了?</p>\n<p>Step Seven: Self Examination</p>\n<p>第七步：自我检查</p>\n<p>Are you open to fairness? As a news consumer, you must know yourself. Do you have opinions or beliefs that could influence your judgment?</p>\n<p>你愿意接受公平吗?作为一个新闻消费者，你必须了解自己。你是否有可能影响你判断力的观点或信念?</p>\n<p>Perhaps step seven is the most important of the seven steps. Ask yourself: Are you more likely to believe a story if it confirms your pre-existing beliefs? That is called confirmation bias. Confirmation bias is a sort of blindness that leads news consumers to seek out information they WANT to be true. A smart news consumer seeks out information from multiple sources, weighing the reputation of each source, and comparing their coverage.</p>\n<p>或许第七步是最重要的。扪心自问：如果一个故事证实了你原有的信念，你更有可能相信它吗?这叫做确认偏差。确认偏差是一种盲目性，导致新闻消费者寻找他们想要的真实信息。聪明的新闻消费者从多个来源寻找信息，衡量每个消息来源的可信度，并比较它们的报道。</p>\n<p>Using these seven steps, a reader or listener can decide the quality and truthfulness of news reports.</p>\n<p>通过这七个步骤，读者或听众可以决定新闻报道的质量和真实性。</p>\n<p>In our final lesson, we will consider journalistic responsibility in the age of social media.</p>\n<p>在我们的最后一课，我们将考虑新闻在社会媒体时代的责任。</p>\n<p><strong>Words in This Story</strong></p>\n<p><strong>consumer&nbsp;</strong>-- n. one who buys or uses a product</p>\n<p><strong>transparency</strong>&nbsp;- n. the quality that makes it possible to see through something</p>\n<p><strong>context&nbsp;</strong>- n. the situation in which something happens : the group of conditions that exist where and when something happens</p>\n<p><strong>bias</strong>&nbsp;- n. a tendency to believe that some people, ideas, etc., are better than others that usually results in treating some people unfairly</p>', 'voa慢速英语视频：News Literacy Lesson 5: Quality of News Reports', 1, 1, 0, '2021-04-04 14:55:44', '2021-04-17 16:43:56', 3, 878, 3, 0, 7, NULL);
INSERT INTO `article` VALUES (26, '新闻素养第六课：新闻与社会媒体', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><video controls=\"controls\" width=\"730\" height=\"365\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190510ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 6: News and Social Media</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第六课：新闻与社会媒体</strong></p>\n<p>Today anyone with a smartphone or a laptop can spread information and video around the world immediately.</p>\n<p>如今，任何拥有智能手机或笔记本电脑的人都可以在世界各地即时传播信息和视频。</p>\n<p>This new-found power can play a vital role in our understanding of events in places that have been cut off from traditional journalism.</p>\n<p>这种新发现的力量可以在我们理解与传统新闻隔绝的地方的事件中发挥至关重要的作用。</p>\n<p>As in Syria where the effects of the violent civil war are captured by citizens who are often trapped behind the firing line. In this digital age, it is nearly impossible for tyrants to mask their cruelty and anyone can speak about oppression to a global audience.</p>\n<p>就像在叙利亚，暴力内战影响了那些经常被困在火线后面的公民。在这个数字时代，专制者几乎不可能掩盖他们的残忍，任何人都可以向全球观众谈论压迫。</p>\n<p>But digitalization has a dark side. Social media, like Twitter and Facebook, often release information to the public that has not been verified, or long before a legitimate news organization would release it. So, it is possible for erroneous information to spread quickly.</p>\n<p>但数字化有其阴暗面。像twitter和facebook这样的社交媒体经常向公众发布未经证实的信息，或者抢在合法的新闻机构之前发布信息。因此，错误信息有可能迅速传播。</p>\n<p>Take the case of Veerender Jubbal. Several European news outlets named the Canadian Sikh as a possible suspect for the November 2015 Paris terror attack. They even published a photo of him wearing a suicide bomber vest.<ins class=\"adsbygoogle\" data-ad-format=\"fluid\" data-ad-layout=\"in-article\" data-ad-client=\"ca-pub-6138521113002217\" data-ad-slot=\"8622533935\" data-adsbygoogle-status=\"done\"><ins id=\"aswift_1_expand\" tabindex=\"0\" title=\"Advertisement\" aria-label=\"Advertisement\"><ins id=\"aswift_1_anchor\"></ins></ins></ins></p>\n<p>以维伦德&middot;朱巴尔为例，一些欧洲的新闻媒体认定这位加拿大锡克人可能是2015年11月巴黎恐怖袭击的嫌疑人，他们甚至公布了他身穿自杀炸弹背心的照片。</p>\n<p>But Mr. Jubbal was completely innocent. Someone had manipulated a photo on his Facebook page and posted it on social media as a joke. It quickly spread, causing Mr. Jubbal to suffer extreme damage to his reputation and a lot of emotional distress.</p>\n<p>但是，朱巴尔先生完全是无辜的，某个人在他的脸书主页上合成了一张照片，然后当做玩笑似的发到了社交媒体上。信息很快传播开来，致使朱巴尔先生遭受了严重的名誉伤害和巨大的精神压力。</p>\n<p>This is a dramatic example but think about it. How many times have you fallen for click bait -- those deceptive ads that lure you to click with gossip or untrue information? For example, those ads that imply a famous celebrity has died or suffered a terrible tragedy?</p>\n<p>这虽是一个戏剧性的例子，但也值得我们思考。你有多少次陷入了点击诱饵，即利用谣言或虚假信息吸引你点击的欺诈性广告。例如，一些暗示某个名人已经死亡或遭受严重悲剧的广告。</p>\n<p>Unlike traditional journalism, social media does not have an obligation to the truth. Its users are its reporters, and they are accountable to no one.</p>\n<p>不同于传统媒体，社交媒体不用为事实负责，它的用户就是报告者，他们不用对任何人负责。</p>\n<p>A smart news consumer is always aware of this discrepancy between traditional media and social media.</p>\n<p>一个明智的消费者总能意识到传统媒体和现代社交媒体的矛盾。</p>\n<p>Exercising news literacy is a skill like any other skill. It requires thoughtful concentration and consideration. A literate news consumer uses the tools we have outlined to evaluate the mounds of information we encounter every minute of every day.</p>\n<p>与其他技能一样，新闻素养的锻炼也是一项技能。它需要超强的专注力和周全的考虑。有素质的新闻消费者使用我们重点标出的工具去评估我们每天、每分钟看到的大量的信息。</p>\n<p>&nbsp;</p>\n<p><strong>Words in this story</strong></p>\n<p><strong>tyrant&nbsp;</strong>&ndash; n. a ruler who has complete power over a country and who is cruel and unfair</p>\n<p><strong>cruelty</strong>&nbsp;&ndash; n. a desire to cause others to suffer : the quality or state of being cruel</p>\n<p><strong>legitimate</strong>&nbsp;&ndash; adj. allowed according to rules or laws</p>\n<p><strong>erroneous</strong>&nbsp;&ndash; adj. not correct</p>\n<p><strong>manipulate&nbsp;</strong>&ndash; v. to deal with or control (someone or something) in a clever and usually unfair or selfish way</p>\n<p><strong>reputation</strong>&nbsp;&ndash; n. the common opinion that people have about someone or something</p>\n<p><strong>distress</strong>&nbsp;&ndash; n. suffering that affects the mind or body</p>\n<p><strong>lure</strong>&nbsp;&ndash; v. to cause or persuade (a person or an animal) to go somewhere or to do something by offering some pleasure or gain</p>\n<p><strong>gossip</strong>&nbsp;&ndash; n. information about the behavior and personal lives of other people</p>\n<p><strong>obligation</strong>&nbsp;&ndash; n. something that you must do because of a law, rule, promise, etc.</p>\n<p><strong>discrepancy</strong>&nbsp;&ndash; n. a difference especially between things that should be the same</p>', 'voa慢速英语视频：News Literacy Lesson 6: News and Social Media', 1, 1, 0, '2021-04-04 14:57:37', '2021-04-20 10:48:09', 4, 1068, 4, 0, 7, NULL);
INSERT INTO `article` VALUES (27, '中国女足拼下东京奥运会入场券 如何用英语解说比赛？', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>东京奥运会女足亚洲区预选赛（Asian Qualification playoffs for Tokyo 2020 Olympics）附加赛第二回合较量4月13日在苏州结束，中国队最终拿下东京奥运会参赛资格。</p>\n<figure class=\"image\"><img id=\"img-60764d20e4b0fc41953c67c4\" style=\"width: 708px; height: 447px;\" src=\"https://cds.chinadaily.com.cn/dams/capital/image/202104/14/60764d20e4b0fc41953c67c4.jpeg\" data-from=\"dams\" data-damsstoid=\"po60764d2de4b0fc41953c67c6\" data-damslibid=\"capital\" data-imgid=\"60764d200b9f006b94de0aec\" data-mimetype=\"image/jpg\" />\n<figcaption>4月13日，中国队球员王霜（中）在比赛中庆祝进球。新华社记者 丁旭 摄</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p>Chinese star player Wang Shuang contributed one goal and one assist as the Steel Roses came from 2-0 behind to beat South Korea 4-3 on aggregate in the Olympic Qualification playoffs.<br />中国女足在半场落后两球的情况下反击，名将王霜贡献了一记进球和一次助攻，最终以4:3的总比分拿下东京奥运会女足亚洲区的入场券。</p>\n<p><strong>【词汇讲解】</strong></p>\n<p>On aggregate这个短语在体育比赛的报道中比较常见，表示&ldquo;一系列比赛之后某个队拿到的总分&rdquo;，一般直接跟在比分的后面，比如：They won 2-1 on the night and 3-2 on aggregate.（他们当晚2比1赢了，最终总分3比2胜出）。</p>\n<p><br />双方首回合较量，中国女足客场2:1获胜，掌握出线主动权。回到苏州主场，中国队却在开场后陷入被动，甚至一度陷入绝境。</p>\n<p>Going into the match 2-1 down from the first leg, the South Koreans executed a high press from the front and took the reins in the first half. They broke the deadlock in the 30th minute when Kang Chae-rim scored after a precise cross from Cho So-hyun.<br />第一回合2:1落后的情况下，这场比赛韩国队通过积极拼抢给中国队造成很大压力，上半场占据主导。第30分钟，赵昭贤送出精准传球，助力姜綵林攻入一球，打破场上僵局。</p>\n<p><br />In the last minute of the first half, Chinese goalkeeper Peng Shimeng saved a close-range header from a corner, but couldn\'t keep the ball out of the net from a rebound shot. The goal was initially credited to South Korean forward Choe Yu-ri, but the Asian Football Confederation (AFC) later ruled it as Chinese defender Li Mengwen\'s own goal.<br />上半场最后一分钟，中国队守门员彭诗梦扑出了韩国队利用角球机会发出的一个近距离头球，但是球反弹进网。这个进球最初判给了韩国队前锋崔友利，不过亚洲足联后来又判定这个进球是中国队后卫李梦雯的乌龙球。</p>\n<p><strong>【词汇讲解】</strong></p>\n<p>&ldquo;头球&rdquo;直接用header表示，如果说某个球员&ldquo;善于顶球&rdquo;我们就可以说someone is good in the air。除此之外，足球比赛中还会经常出现&ldquo;香蕉球&rdquo;和&ldquo;倒勾球&rdquo;。</p>\n<p>&ldquo;香蕉球&rdquo;（banana kick）指以弧线运行的球（a type of kick that gives the ball a curved trajectory），多是为了让球绕过守门员或者后卫，也就是大家熟知的&ldquo;弧线球&rdquo;。</p>\n<p>传说中的&ldquo;倒钩球&rdquo;（bicycle kick或overhead kick）指球员在腾空状态下、且头下脚上将球往后踢的动作（a player kicks the ball in mid-air backwards and over his own head）。</p>\n<p><br />Chinese head coach Jia Xiuquan changed his tactics in the second half as Yang Man came off the bench and became the turning point of the match. The 1.86-meter center forward headed home a free kick from Wang in the 69th minute.<br />下半场，中国队主教练贾秀全改变策略，换上身高1米86的中锋杨曼，成为整场比赛的转折点。第69分钟，中国队获得前场任意球，王霜主罚，杨曼将球攻入。</p>\n<p><br />凭借这个进球，中国队在90分钟内追成1:2。双方总比分打成3:3，重回同一起跑线。</p>\n<p><br />In the 103rd minute, Wang fired a long-distance shot into the bottom right corner, gifting China a lead on aggregate, which denied South Korean\'s dream to qualify for the Olympics.<br />加时赛第13分钟，王霜在禁区外拿球一脚远射破门，中国队总分领先，韩国队无缘奥运赛场。</p>\n<figure class=\"image\"><img id=\"img-60764d42e4b0fc41953c67c9\" style=\"width: 706px; height: 525px;\" src=\"https://cds.chinadaily.com.cn/dams/capital/image/202104/14/60764d42e4b0fc41953c67c9.jpeg\" data-from=\"dams\" data-damsstoid=\"po60764d7de4b0fc41953c67cb\" data-damslibid=\"capital\" data-imgid=\"60764d430b9f006b94de0aef\" data-mimetype=\"image/jpg\" />\n<figcaption>4月13日，中国队总比分4:3淘汰韩国队，拿下东京奥运会参赛资格。</figcaption>\n</figure>\n<p><br /><strong>【足球比赛技术统计的关键词】</strong></p>\n<p>射门 shots</p>\n<p>球门范围内射门 shots on goal</p>\n<p>进球数 goals scored</p>\n<p>犯规 fouls committed</p>\n<p>角球 corner kick</p>\n<p>任意球 free kick</p>\n<p>点球 penalty kick</p>\n<p>越位 offside</p>\n<p>乌龙球 own goals</p>\n<p>控球率 possession percentage</p>\n<p><br />参考来源：新华网</p>\n<p>（中国日报网英语点津 Helen）</p>', '东京奥运会女足亚洲区预选赛（Asian Qualification playoffs for Tokyo 2020 Olympics）附加赛第二回合较量4月13日在苏州结束，中国队最终拿下东京奥运会参赛资格。', 1, 1, 0, '2021-04-14 16:24:31', '2021-05-07 17:35:01', 2, 1034, 4, 0, 9, NULL);
INSERT INTO `article` VALUES (28, '哪些是精彩的人生所必须的技能？', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<div class=\"main_title\">&nbsp;</div>\n<div id=\"Content\" class=\"mian_txt\"><iframe id=\"playerFrame\" src=\"https://v-hls.chinadaily.com.cn/player/player.html?src=//v-hls.chinadaily.com.cn/stream/606312/f6bf8627-c174-411a-971e-b3143f6460c8/03837d89-84cd-4429-b59c-6f2bca34cedd_h.m3u8&amp;p=//img2.chinadaily.com.cn/images/202104/08/606ecb7ca31024adbdc0a7a6.jpeg&amp;l=en&amp;c=5af95d2da3103f6866ee8458&amp;s=WS606ecb7ca31024ad0bab44cc&amp;d=20210408172305&amp;t=TED%E6%BC%94%E8%AE%B2%EF%BC%9A%E5%93%AA%E4%BA%9B%E6%98%AF%E7%B2%BE%E5%BD%A9%E7%9A%84%E4%BA%BA%E7%94%9F%E6%89%80%E5%BF%85%E9%A1%BB%E7%9A%84%E6%8A%80%E8%83%BD%EF%BC%9F\" width=\"730\" height=\"357\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"allowfullscreen\" data-mce-fragment=\"1\"></iframe>\n<div class=\"urlShareArea\" style=\"text-align: center;\">\n<div class=\"smallishide\">\n<div class=\"urlShareBox\" style=\"text-align: left;\"><br />现代人类的生活充满焦虑，压力重重，这是因为人类遗忘了生活的基础：POD（play，others，downtime）。人类应该学会像海豚一样生活，才能重新找回生活的平衡。</div>\n</div>\n</div>\n<p style=\"text-align: left;\">每个焦虑的父母都应该听一听这个演讲。孩子最需要的人生技能是adaptability（适应力），而你我都需要玩耍、联系和休息时间。</p>\n<p style=\"text-align: left;\">&nbsp;</p>\n</div>', '现代人类的生活充满焦虑，压力重重，这是因为人类遗忘了生活的基础：POD（play，others，downtime）。', 1, 1, 0, '2021-04-14 16:31:42', '2021-04-20 21:11:17', 1, 104, 1, 0, 10, NULL);
INSERT INTO `article` VALUES (29, '现象级畅销书《掌控习惯》作者谈习惯的力量', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<div class=\"main_title\">&nbsp;</div>\n<div id=\"Content\" class=\"mian_txt\"><iframe id=\"playerFrame\" src=\"https://v-hls.chinadaily.com.cn/player/player.html?src=//v-hls.chinadaily.com.cn/stream/606309/78e05cb2-2b3f-4cd0-af9e-64b5f2d33e30/a3f37877-867e-4ed1-80d9-21ae0ab722b1_h.m3u8&amp;p=//img2.chinadaily.com.cn/images/202103/16/60505670a31024adbdbb9fbb.jpeg&amp;l=en&amp;c=5af95d2da3103f6866ee8458&amp;s=WS60505670a31024ad0baaf836&amp;d=20210316145543&amp;t=%E7%8E%B0%E8%B1%A1%E7%BA%A7%E7%95%85%E9%94%80%E4%B9%A6%E3%80%8A%E6%8E%8C%E6%8E%A7%E4%B9%A0%E6%83%AF%E3%80%8B%E4%BD%9C%E8%80%85%E8%B0%88%E4%B9%A0%E6%83%AF%E7%9A%84%E5%8A%9B%E9%87%8F\" width=\"730\" height=\"437\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"allowfullscreen\" data-mce-fragment=\"1\"></iframe>\n<p>雄踞《纽约时报》排行榜的现象级畅销书《掌控习惯》（Atomic Habits）的作者詹姆斯&middot;克利尔（James Clear）花了数年时间研究关于习惯的科学知识，来听听这个著名习惯研究专家揭示习惯养成的奥秘吧。</p>\n</div>', '雄踞《纽约时报》排行榜的现象级畅销书《掌控习惯》（Atomic Habits）的作者詹姆斯·克利尔（James Clear）花了数年时间研究关于习惯的科学知识，来听听这个著名习惯研究专家揭示习惯养成的奥秘吧。', 1, 1, 0, '2021-04-14 16:34:52', '2021-04-20 20:07:39', 5, 73, 1, 0, 10, NULL);
INSERT INTO `article` VALUES (30, '全国累计报告接种新冠疫苗超过1亿剂次', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>3月28日举行的国务院联防联控机制新闻发布会正式宣布，</p>\n<p>China had administered more than 100 million doses of COVID-19 vaccines by Saturday.<br />截至3月27日24时，全国累计报告接种新冠病毒疫苗超过1亿剂次。</p>\n<p><strong>【单词讲解】</strong></p>\n<p>Administer这个词最常见的意思是&ldquo;管理、治理&rdquo;，所以很多管理机构的名称里都有administration，比如National Medical Products Administration（国家药品监督管理局）。但是在接种疫苗这个语境里，administer的意思是&ldquo;to give something to someone/to cause someone to receive something&rdquo;（让某人接收到某物），比如：This drug should not be administered to the very young（这个药不能给太小的孩子用）；administer justice（实施正义）；Tests will be administered to schoolchildren at seven and twelve years（要对7岁和12岁的学生进行考试）。</p>\n<figure class=\"image\"><img id=\"img-606145d1e4b0fc419538a429\" src=\"https://cds.chinadaily.com.cn/dams/capital/image/202103/29/606145d1e4b0fc419538a429.jpeg\" width=\"700\" height=\"487\" data-from=\"dams\" data-damsstoid=\"po606145e5e4b0fc419538a42b\" data-damslibid=\"capital\" data-imgid=\"606145d20b9f006b94dd478d\" data-mimetype=\"image/jpg\" />\n<figcaption>3月28日，华东师范大学的师生在接种新冠疫苗。（图片来源：新华网）</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p>国家卫健委疾控局副局长吴良有在发布会上表示，</p>\n<p>Beijing and Shanghai have started vaccinating people over 60 who are in good health and those who have chronic disease.<br />北京、上海等地已经陆续开展了针对60岁以上身体健康状况良好的老年人群的疫苗接种。</p>\n<p><br />The country will actively and prudently advance the COVID-19 vaccination of people over 60 and those who have chronic disease, based on the effectiveness of its mass vaccination campaign.<br />下一步将结合疫苗在大规模人群中的使用效果，积极稳妥推进60岁以上人群和慢性病患者的疫苗接种工作。</p>\n<p>&nbsp;</p>\n<p><br /><strong>未来疫苗接种还将覆盖18岁以下人群</strong></p>\n<p><br />国药集团中国生物副总裁张云涛表示，</p>\n<p>China National Biotech Group will start consultations with the National Medical Products Administration on the vaccination of those aged between 3 and 17, and it is expected to start soon.<br />对于3-17岁人群的接种工作，中国生物近期将和药监局作沟通。</p>\n<p><br />The company started early and mid-stage clinical trials of vaccinations for people in that age group in Henan province last year, Zhang said.<br />去年中国生物在河南现场开展的I/II期临床研究的过程中就涵盖了3-17岁年龄段的临床研究。</p>\n<p><br />The trials have shown that the vaccine\'s safety met expectations, and data on its effectiveness has also been obtained, he said.<br />目前这个年龄段的安全性数据已获得，达到了预期效果，有效性数据也已获得。</p>\n<p>&nbsp;</p>\n<p><br /><strong>两款灭活疫苗对不同地区的10多株毒株有中和作用</strong></p>\n<p>近期国外频频发现变异新冠病毒，引发许多人对于我国疫苗有效性的担忧。对此，张云涛介绍，</p>\n<p>Researchers have been testing the antiviral-mutation ability of the inactivated vaccines.<br />研究人员对灭活疫苗对抗变异病毒的能力进行了实验。</p>\n<p><br />By using data from mid-and late-stage clinical trials in China and overseas, researchers have conducted experiments on a dozen variants, including those found in South Africa and the United Kingdom, Zhang said.<br />研究人员利用在国内和海外二期、三期临床试验后的血清，对包括南非发现的、英国发现的毒株，还有国内不同地区、不同流行区发现的10多株的毒株进行了交叉综合实验。</p>\n<p><br />The experiments have found that the antibodies produced by the two inactivated vaccines have a good neutralizing effect on all the tested strains, he said, adding that such experiments are continuing on strains found in Brazil and Zimbabwe.<br />结果显示，两款灭活疫苗产生的中和抗体对这些毒株都有很好的中和作用。目前，国药集团中国生物在对巴西、津巴布韦发现的毒株进行中和实验监测。</p>\n<p><br />北京科兴中维生物技术公司总经理高强也表示，</p>\n<p>The company has started research and development of vaccines against the variants discovered in South Africa and Brazil.<br />科兴中维同时已经启动了对南非株、巴西株的疫苗研发工作。</p>\n<p><br />Based on earlier cross-neutralization research on mutated strains found in 10 countries, its vaccine has proved to be effective, he said.<br />在研究初期已经对10个国家病毒株的变异进行中和试验，已经证明了当时研发的疫苗对各个国家的变异株是有保护作用的。</p>\n<p><br /><strong>【相关词汇】</strong></p>\n<p>药品和疫苗研发<br />drug and vaccine development</p>\n<p>免疫系统<br />immune system</p>\n<p>有效性和安全性研究<br />safety and efficacy research</p>\n<p>人类卫生健康共同体<br />a global community of health for all</p>\n<p>疫苗联合研发<br />joint research and development of vaccines</p>\n<p><br />参考来源：新华网、中国日报网</p>\n<p>（中国日报网英语点津 Helen）</p>', '截至3月27日24时，全国累计报告接种新冠病毒疫苗超过1亿剂次。', 1, 1, 0, '2021-04-14 16:42:43', '2021-04-20 21:11:03', 1, 1105, 4, 0, 6, NULL);
INSERT INTO `article` VALUES (31, '《你好，李焕英》即将全球上映', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>热门影片《你好，李焕英》要走出国门了，该片即将在全球范围内上映。</p>\n<p>\"Hi, Mom,\" the maiden directorial project of Chinese comedian and actress Jia Ling, is scheduled to hit international theaters on Thursday. The tear-jerker film will be released in North America, Japan, the Republic of Korea, Britain, Spain, Australia, New Zealand, Colombia and several other countries and regions, according to Ruyi Films, one of the producers.<br />喜剧演员贾玲的导演处女作《你好，李焕英》4月8日起将在全球范围内上映。制片方儒意影业表示，这部催泪影片将在北美、日本、韩国、英国、西班牙、澳大利亚、新西兰、哥伦比亚等国家和地区上映。</p>\n<p><strong>【单词讲解】</strong></p>\n<p>Maiden这个词来源于maid，本意指&ldquo;未婚女子&rdquo;，用作形容词时多表示&ldquo;初次的、首次的&rdquo;，比如：a ship\'s maiden voyage（船只首航），the maiden flight of a spacecraft（飞机首飞）等。</p>\n<p>影片在影院全面放映一般叫theatrical release或者general release，用动词形式表达就可以用hit theaters/cinemas，但是有些影片在正式全面上映之前会选择部分城市的部分影院进行&ldquo;点映&rdquo;（preview），为的是营造口碑，推动票房销售。</p>\n<figure class=\"image\"><img id=\"img-606fc568e4b0fc41953b44c5\" src=\"https://cds.chinadaily.com.cn/dams/capital/image/202104/09/606fc568e4b0fc41953b44c5.jpg\" width=\"700\" height=\"2551\" data-from=\"dams\" data-damsstoid=\"po606fc56ce4b0fc41953b44c7\" data-damslibid=\"capital\" data-imgid=\"606fc5690b9f006b94ddd511\" data-mimetype=\"image/jpg\" />\n<figcaption></figcaption>\n</figure>\n<p><br />The film has raked in nearly 5.4 billion yuan as of early Tuesday afternoon.<br />截至4月6日中午，该片已经收获近54亿元的票房。</p>\n<p><strong>【单词讲解】</strong></p>\n<p>Rake本意指&ldquo;耙子，耙状工具&rdquo;等可以用来把地面上的树叶等轻轻拢到一起的工具，用作动词的时候就表示&ldquo;拢到一起&rdquo;这个动作，比如：rake leaves into a pile（把叶子拢成一堆）。Rake in是一个常用的固定搭配，表示&ldquo;迅速、大量获得&rdquo;，除了上文中出现的rake in+金额以外，也可以说rake in a fortune（暴富）。</p>\n<p><br />It surpassed the 2017 superhero film \"Wonder Woman\" from Patty Jenkins and became the world\'s top-grossing film ever from a solo female director, according to the China Movie Data Information Network.<br />中国电影数据信息网的数据显示，该片已经超过派蒂&middot;杰金斯2017年导演的超级英雄影片《神奇女侠》，成为全球票房最高的女性导演作品。</p>\n<p><br />The film overtook the 2019 animated fantasy \"Ne Zha\" to become the second highest-grossing film ever screened in China on March 6. The 2017 action-adventure film<em>&nbsp;Wolf Warrior 2</em>&nbsp;is currently topping the all-time box office chart covering all films ever screened in China with a total revenue of 5.693 billion yuan, according to data compiled by the China Movie Data Information Network.<br />3月6日，该片超过2019年奇幻动漫电影《哪吒之魔童降世》，成为中国影史票房第二高的电影。目前，位列影史票房冠军的是2017年的动作冒险影片《战狼2》，票房成绩为56.93亿元。</p>\n<p>&nbsp;</p>\n<p><strong>【相关词汇】</strong></p>\n<p>动作片 action movie</p>\n<p>武侠片 swordsmen film, martial-arts movie</p>\n<p>音乐歌舞片 musical</p>\n<p>古装剧 costume drama</p>\n<p>催泪片 tear-jerker</p>\n<p>票房 box office</p>\n<p>大片 blockbuster</p>\n<p>影评网站 film rating/review site</p>\n<p>视觉特效 visual effect</p>\n<p>影片配音 film dubbing</p>\n<p>电影发行公司 film distribution corporation</p>\n<p><br />参考来源：新华网、中新网</p>\n<p>（中国日报网英语点津 Helen）</p>', '热门影片《你好，李焕英》要走出国门了，该片即将在全球范围内上映。', 1, 1, 0, '2021-04-14 16:49:09', '2021-04-20 21:07:35', 1, 740, 3, 0, 11, NULL);
INSERT INTO `article` VALUES (32, '四月最值得一看的4部电影', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>四月份科幻片云集，讲述外太空殖民的《太空异旅》、超级英雄&ldquo;女团&rdquo;首度亮相的《雷霆女神》、以疫情后时代为背景的《地表惊旅》&hellip;&hellip;科幻迷们千万不要错过！</p>\n<p>&nbsp;</p>\n<figure class=\"image\"><img id=\"img-6066d1faa31024adbdbfbfb4\" src=\"https://img2.chinadaily.com.cn/images/202104/02/6066d1faa31024adbdbfbfb4.jpeg\" data-from=\"newsroom\" data-mimetype=\"image/jpeg\" />\n<figcaption>(Credit: Lionsgate)</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p><strong><em>Voyagers</em>《太空异旅》</strong></p>\n<p>&nbsp;</p>\n<p>In the near future, 30 young men and women are sent into space to populate a recently discovered planet. Onboard their spacecraft, they\'re dosed with drugs to keep their emotions in check, but, of course, something goes wrong. According to&nbsp;<em>Variety</em>, the \"crew descends into chaos, reverting to a primitive, tribal state, giving in to their most feral and animal desires\". This sci-fi version of&nbsp;<em>Lord of the Flies</em>&nbsp;stars Lily-Rose Depp and Tye Sheridan as two of the colonists, alongside Colin Farrell as the vessel\'s unfortunate captain.</p>\n<p>在不久的未来，30名年轻男女被送往太空，到一个刚被发现的行星繁殖人类后代。在登上飞船后，这些人服用了克制情感的药物，但是意外发生了。据《综艺》杂志报道，&ldquo;船员们陷入了混乱，回归到了原始的部落状态，野性的动物欲望占了上风。&rdquo;在这部科幻版《蝇王》中，莉莉-罗丝&middot;德普和泰尔&middot;谢里丹分别饰演其中两名殖民者，科林&middot;法瑞尔饰演不幸的飞船船长。</p>\n<p>&nbsp;</p>\n<p>Released on 8 April in Australia and Singapore, and 9 April in the US and Canada</p>\n<p>该片将于4月8日在澳大利亚和新加坡上映，4月9日在美国和加拿大上映。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<figure class=\"image\"><img id=\"img-6066d1faa31024adbdbfbfb6\" src=\"https://img2.chinadaily.com.cn/images/202104/02/6066d1faa31024adbdbfbfb6.jpeg\" data-from=\"newsroom\" data-mimetype=\"image/jpeg\" />\n<figcaption>(Credit: Netflix)</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p><strong><em>Thunder Force</em>《雷霆女神》</strong></p>\n<p>&nbsp;</p>\n<p>If Zack Snyder\'s&nbsp;<em>Justice League</em>&nbsp;was too gloomy for you, try&nbsp;<em>Thunder Force</em>, a superhero film that is a bit lighter and a lot shorter. Melissa McCarthy stars as Lydia, a slacker whose best friend from school, Emily (Octavia Spencer), is now a top scientist. Emily concocts a secret formula that accidentally gives her the power of invisibility, and gives Lydia phenomenal strength, so the two inexperienced middle-aged women put on rubber suits and become the world\'s first superhero team. The supervillains are played by Jason Bateman and Bobby Cannavale, and the writer-director is McCarthy\'s husband, Ben Falcone.</p>\n<p>如果扎克&middot;施奈德的《正义联盟》对你来说太阴郁了，不妨看看《雷霆女神》。这部超级英雄电影比《正义联盟》轻快一些，而且短得多。梅丽莎&middot;麦卡西饰演懒散的莉迪娅，她的老同学兼好友艾米丽（奥克塔维亚&middot;斯宾瑟饰演）如今是一名顶级科学家。艾米丽意外调制出了一种能让自己隐形并让莉迪娅获得神力的秘方，于是这两位缺乏经验的中年妇女穿上了橡胶制服，组成了世界上第一支超级英雄团队。片中的反派由杰森&middot;贝特曼和鲍比&middot;坎纳瓦尔饰演，编剧兼导演则是麦卡西的丈夫本&middot;法尔科内。</p>\n<p>&nbsp;</p>\n<p>Released on Netflix from 9 April</p>\n<p>该片将于4月9日在奈飞平台上线。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<figure class=\"image\"><img id=\"img-6066d1faa31024adbdbfbfb8\" src=\"https://img2.chinadaily.com.cn/images/202104/02/6066d1faa31024adbdbfbfb8.jpeg\" data-from=\"newsroom\" data-mimetype=\"image/jpeg\" />\n<figcaption>(Credit: Netflix)</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p><strong><em>Things Heard and Seen</em>《所见所闻》</strong></p>\n<p>&nbsp;</p>\n<p>Shari Springer Berman and Robert Pulcini have been married for 25 years, but the latest film from the writer-directors of&nbsp;<em>American Splendor</em>&nbsp;and&nbsp;<em>The Nanny Diaries</em>&nbsp;is all about the terrors of marriage. Adapted from a gothic novel by Elizabeth Brundage,&nbsp;<em>Things Heard and Seen</em>&nbsp;stars Amanda Seyfried as an artist who moves from Manhattan to rural Hudson Valley with her husband, James Norton, but soon fears that her new house is cursed. It\'s a film that examines what it means to be bound to another person. \"I think one of the most frightening things in the world is a marriage,\" Berman told&nbsp;<em>EW</em>. \"It can be incredibly wonderful, and it can be incredibly scary, both at the same time. \"</p>\n<p>《美国荣耀》和《保姆日记》的编剧兼导演莎里&middot;斯宾厄&middot;伯曼和罗伯特&middot;帕西尼已经结婚25年，但是两人的新片则是关于婚姻的恐怖。电影《所见所闻》改编自伊丽莎白&middot;布伦代奇所著的哥特式小说，阿曼达&middot;塞弗里德在片中饰演和丈夫（詹姆斯&middot;诺顿饰演）一起从曼哈顿搬到哈德逊河谷乡村的艺术家，但很快她开始担心自己的新房子受到了诅咒。这部电影检视了被另一个人束缚住意味着什么。伯曼告诉《娱乐周刊》说：&ldquo;我认为世界上最可怕的东西之一就是婚姻。婚姻可以美妙至极，同时也可以非常恐怖。&rdquo;</p>\n<p>&nbsp;</p>\n<p>Released on Netflix from 30 April</p>\n<p>该片将于4月30日在奈飞平台上线。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<figure class=\"image\"><img id=\"img-6066d1faa31024adbdbfbfba\" src=\"https://img2.chinadaily.com.cn/images/202104/02/6066d1faa31024adbdbfbfba.jpeg\" data-from=\"newsroom\" data-mimetype=\"image/jpeg\" />\n<figcaption>(Credit: Neon)</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p><strong><em>In the Earth</em>《地表惊旅》</strong></p>\n<p>&nbsp;</p>\n<p>Written and shot during last year\'s lockdowns,&nbsp;<em>In the Earth</em>&nbsp;is set in a Britain which has been devastated by a Covid-like virus. A scientist (Joel Fry) and a park scout (Ellora Torchia) trek into a forest to rendezvous with another scientist (Hayley Squires) who is experimenting with genetically modified crops. Along the way they encounter a mad hermit played by Reece Shearsmith (<em>Inside No. 9</em>), and things get weirder from there.</p>\n<p>《地表惊旅》的编剧和拍摄均在去年封锁期间完成，故事背景设定在被类似新冠的病毒摧毁的英国。一名科学家（乔尔&middot;弗莱饰演）和一名公园巡逻员（埃洛拉&middot;托尔基亚饰演）徒步进入森林和另一名正在做转基因谷物试验的科学家（海莉&middot;斯奎尔斯饰演）会合。在路上他们碰见了里斯&middot;谢尔史密斯（曾主演《9号秘室》）饰演的一名疯癫的隐居者，从那开始事情变得诡异起来。</p>\n<p>&nbsp;</p>\n<p>Released on 30 April in the US and Canada, 18 June in the UK and Ireland</p>\n<p>该片于4月30日在美国和加拿大上映，6月18日在英国和爱尔兰上映。</p>\n<p>&nbsp;</p>\n<p>英文来源：BBC文化频道</p>\n<p>翻译&amp;编辑：丹妮</p>', '四月份科幻片云集，讲述外太空殖民的《太空异旅》、超级英雄“女团”首度亮相的《雷霆女神》、以疫情后时代为背景的《地表惊旅》……科幻迷们千万不要错过', 1, 1, 0, '2021-04-14 16:51:14', '2021-05-08 16:30:25', 2, 1308, 5, 0, 11, NULL);
INSERT INTO `article` VALUES (38, '五一火车票秒光，或成“史上最热黄金周”', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>你抢到五一假期的票了吗？，五一假期第一天的火车票开售。不少热门方向的火车票手快有手慢无，瞬间秒没！</p>\n<figure class=\"image\"><img id=\"img-607cf4dba31024adbdc2c576\" src=\"https://img2.chinadaily.com.cn/images/202104/19/607cf4dba31024adbdc2c576.png\" data-from=\"newsroom\" data-mimetype=\"image/png\" />\n<figcaption></figcaption>\n</figure>\n<p><br />Train tickets to some of the most popular destinations for this year\'s May Day holiday sold out the moment they became available, causing platforms to temporarily crash, foretelling an explosive holiday season starting on May 1.<br />今年五一假期一些热门目的地的火车票一开售就售罄，导致售票平台暂时瘫痪，这预示着一个火爆的五一假期。</p>\n<p><br />据报道，17日早晨8点，北京日报记者登录12306官网查询，发现开售仅仅两分钟，北京西站到郑州东站50余趟高铁、动车车票售罄，剩余车次所剩车票不多。</p>\n<p><br />北京西站到石家庄站当天，只有21时以后发车车次还有余票。北京西站到长沙南站，只剩两趟高铁一等座还有部分余票。</p>\n<p><br />此外，前往武汉、太原等方向高铁列车同样抢手。</p>\n<p><br />随着京哈高铁全线贯通，北京前往东北地区主要城市间旅行时间大幅缩短，北京朝阳站前往哈尔滨、沈阳等地车票也非常抢手。</p>\n<p><br />目前，假期前一日北京朝阳站前往沈阳、阜新的车票，已经&ldquo;一票难求&rdquo;。</p>\n<figure class=\"image\"><img id=\"img-607cf4dba31024adbdc2c578\" src=\"https://img2.chinadaily.com.cn/images/202104/19/607cf4dba31024adbdc2c578.jpeg\" data-from=\"newsroom\" data-mimetype=\"image/jpeg\" />\n<figcaption>[Photo by Wei Xiaohao/chinadaily.com.cn]</figcaption>\n</figure>\n<p><br /><strong>&ldquo;五一火车票秒光&rdquo;上热搜</strong></p>\n<p><br />随着假期首日火车票的开售，微博上#五一火车票秒光#的话题也冲上了热搜。</p>\n<p><br />不少网友表示，抢了个寂寞。</p>\n<p><br />\"I tried wearing and taking off my glasses, binding and not binding my hair, and walked to the brighter living room to pass the facial recognition check on the app, but failed five or six times,\" a Beijing resident surnamed Zhang told the Global Times on Friday.<br />据环球时报，一位姓张的北京居民16日表示，&ldquo;为了通过应用程序上的面部识别验证，我试了五六次，戴着眼镜的、不戴眼镜的，绑着头发的、披着头发的，甚至走到光线更充足的客厅，但都没成功。&rdquo;</p>\n<p><br />\"Only when I browsed social media did I realize it wasn\'t my problem, it was that 12306 was down,\" Zhang said. She was trying to purchase a ticket to her hometown, Luoyang in Central China\'s Henan Province, which also has many historical sites and tourist spots.<br />张女士说：&ldquo;后来我浏览社交媒体平台才发现这不是我的问题，而是12306&lsquo;崩了&rsquo;。&rdquo; 据悉，当时她正试着购买回家乡洛阳的车票。洛阳坐落于中国河南省，是一座拥有许多历史古迹和旅游景点的城市。</p>\n<p><br />世界上最远的距离，就是眼看着火车票显示&ldquo;有&rdquo;，但是你却抢不到票&hellip;&hellip;</p>\n<p><br />而抢到票的网友们，心境就完全不一样了。</p>\n<p><br />不过抢到票的小伙伴们也别忘了，还要记得定时抢回来的车票。</p>\n<p><br />温馨小提示：</p>\n<p><br />4月21日，可购买5月5日假期最后一天的返程火车票。</p>\n<p><br />为了方便旅客购票，铁路部门已经延长了铁路12306网站售票服务时间：从每日的6:00至23:30，提前到每日5:00至23:30，同步12306网站和线下窗口改签规则，线上也可改签乘车当日24点前其它列车的车票。</p>\n<p><br /><strong>今年五一或成史上最热黄金周</strong></p>\n<p><br />小长假是激发消费活力、观察经济内在潜力的重要窗口。</p>\n<p><br />随着各项五一假期预订数据的出炉，业内人士分析，今年五一假期将成为&ldquo;史上最热五一黄金周&rdquo;。</p>\n<p><br />数据显示，\"五一\"期间国内进出港航班搜索量同比2020年提升超过五倍。三亚、西安、重庆、成都等热门目的地，进港航班搜索量分别提升550%到1000%。</p>\n<p><br />从旅游目的地搜索量、航班和酒店预订量等先行指标来看，今年五一出游人次或达到两亿。其中，红色旅游、跨省长线游、探秘新秘境等广受青睐。</p>\n<figure class=\"image\"><img id=\"img-607cf4dba31024adbdc2c57b\" src=\"https://img2.chinadaily.com.cn/images/202104/19/607cf4dba31024adbdc2c57b.jpeg\" data-from=\"newsroom\" data-mimetype=\"image/jpeg\" />\n<figcaption>Travelers line up at Air China\'s check-in counters for domestic flights at Beijing Capital International Airport. [Photo provided to China Daily]</figcaption>\n</figure>\n<p><br />Apart from railway travels, China\'s domestic civil aviation industry has also come up with a vengeance, based on bookings for the coming holiday. According to the Civil Aviation Administration of China (CAAC), the five-day May Day holiday will \"fully release\" the transportation demand in China that had been previously suppressed by the pandemic.<br />除铁路旅行外，从即将到来的黄金周的机票预订情况来看，中国民航业也迎来了复苏。据中国民航总局（CAAC），为期五天的五一黄金周假期将使中国民航业前期因新冠疫情受到抑制的运输需求得到&ldquo;全面释放&rdquo;。</p>\n<p><br />而透过这些数据，或许能窥见旺盛的假日市场需求背后，旅游市场中蕴藏的经济活力和消费潜力。</p>\n<p><br />还有两周就到五一小长假了，这个假期你有什么计划？</p>', '你抢到五一假期的票了吗？，五一假期第一天的火车票开售。不少热门方向的火车票手快有手慢无，瞬间秒没！', 0, 1, 0, '2021-04-19 15:06:43', '2021-04-20 10:45:55', 0, 1226, 5, 0, 6, NULL);
INSERT INTO `article` VALUES (39, 'ceshi ', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>1</p>', 'ces', 0, 1, 7, '2021-04-20 16:49:06', '2021-04-20 16:53:20', 0, 1, 0, 0, 2, '2021-04-20 20:06:45');
INSERT INTO `article` VALUES (40, '我是修改后的', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>1</p>', '1', 1, 1, 12, '2021-04-20 18:50:20', '2021-05-04 14:49:46', 3, 1, 1, 0, 2, '2021-05-04 14:52:00');
INSERT INTO `article` VALUES (41, 'ceshi33', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>1</p>', '1', 0, 0, 9, '2021-04-20 18:51:32', '2021-04-20 19:57:40', 1, 1, 1, 0, 2, '2021-04-20 20:06:43');
INSERT INTO `article` VALUES (42, 'cehis2', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>ceshi2</p>', '策士', 1, 1, 11, '2021-04-21 14:25:22', '2021-04-21 14:26:02', 0, 33, 1, 0, 2, '2021-05-04 14:52:02');
INSERT INTO `article` VALUES (43, 'ceshi', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>ces</p>', 'ces', 1, 1, 0, '2021-05-07 17:55:33', '2021-05-08 16:27:56', 0, 111, 1, 0, 2, '2021-05-08 16:28:17');
INSERT INTO `article` VALUES (44, '测试', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p>测试</p>', '测试', 1, 1, 7, '2021-05-08 16:13:47', '2021-05-08 16:13:47', 0, 22, 1, 0, 4, '2021-05-08 16:13:51');
INSERT INTO `article` VALUES (45, '修改了标题222', '1647850513659.jpg', 3, '2022-03-25 11:07:22', '<p>测试</p>', '测试', 1, 1, 7, '2021-05-08 16:20:44', '2022-03-28 23:28:12', 0, 3, 1, 0, 4, NULL);
INSERT INTO `article` VALUES (46, '新闻素养第一课：最新的真新闻与假新闻', '1647850513659.jpg', 3, '2022-03-24 15:04:22', '<p style=\"text-align: center;\"><video controls=\"controls\" width=\"324\" height=\"162\">\n<source src=\"//down.chinavoa.com/voadownload/voamsvideo/2019/20190505ms.mp4\" type=\"video/mp4\" /></video></p>\n<p style=\"text-align: center;\"><strong>News Literacy Lesson 1: Real News vs. Fake News</strong></p>\n<p style=\"text-align: center;\"><strong>新闻素养第一课：真新闻与假新闻</strong></p>\n<p>Information is an important part of our society. People depend on it to guide them through a complex world.</p>\n<p>信息是社会的重要组成部分，人们依靠它引导着自己认识复杂的世界。</p>\n<p>The invention of movable type in 15th century Europe revolutionized the communication of ideas. This invention made it possible to print and publish information to masses of people.</p>\n<p>15世纪欧洲发明的活字印刷术使思想交流发生了革命性的变化，这项发明使印刷和向大众发布信息成为可能。</p>\n<p>This free flow of information eventually led to a free press in many parts of the world. But because information is so powerful, many world leaders have tried to stop it.</p>\n<p>这种信息的自由最终引领了世界许多地区的新闻自由。但由于信息太过强大，许多世界领导人试图阻止它。</p>\n<p>French leader Napoleon Bonaparte once said he feared four newspapers more than 1,000 bayonets.</p>\n<p>法国领导人拿破仑&middot;波拿巴曾经说过，他害怕四家报纸超过1000支刺刀。</p>\n<p>The Chinese emperor who oversaw the building of the Great Wall famously used his power to stop published information. Qin Shi Huang ordered the burning of thousands of books on subjects he wanted to keep from the people. He even had hundreds of scholars executed for refusing to give up their book collections.</p>\n<div>&nbsp;</div>\n<p>中国监督长城建造的皇帝，成功地使用他的权力阻止了信息传播。秦始皇下令烧毁数千本关于他不想要人民看到的主题的书，他甚至处决了数百名拒绝放弃藏书的学者。</p>\n<p>Even powerful leaders in modern times have succeeded in blocking material they do not want the people to see, as in Russia and China.</p>\n<p>就像俄罗斯和中国一样，即使是现代的当权者也成功地阻止了他们不想让人民看到的信息。</p>\n<p>But when true information is allowed to reach the people, good results can follow. Information has fueled successful revolutions in many nations. Government atrocities have been identified and world leaders have been forced to be held accountable for their actions.</p>\n<p>但是，当真正的信息传递给人们时，好的结果会产生，信息推动了许多国家的成功革命。政府的暴行已经被确认，迫使世界领导人对自己的行为负责。</p>\n<p>Advances in media technology have made words and images more powerful and widespread than ever. Smart phones and social media have become quick and easy tools to receive and share news and information. These tools have even made it possible for anyone with a device to gather and publish &ldquo;news.&rdquo;</p>\n<p>媒体技术的进步使文字和图像比以往任何时候都更加强大，传播更加广泛。智能手机和社交媒体已经成为接收和分享新闻、信息的便捷工具。这些工具甚至使任何拥有设备的人都有可能收集和发布&ldquo;新闻&rdquo;。</p>\n<p>This media environment makes it important for us to be able to recognize reliable information. True information gives us the facts to guide our decisions and actions.</p>\n<p>这种媒体环境使得我们能够识别可靠的信息变得非常重要。真实的信息给了我们事实来指导我们的决定和行动。</p>\n<p>In addition to informing, news can also divert.</p>\n<p>除了通知之外，新闻也可以使我们开心。</p>\n<p>This means it can focus our attention on something we are interested in as a kind of escape. An example would be news about subjects we seek out for enjoyment, such as entertainment, celebrities or sports.</p>\n<p>这意味着它可以把我们的注意力集中在我们感兴趣的东西上，作为一种逃避的方式。一个例子就是关于我们寻找娱乐等主题的新闻，比如娱乐、名人或运动。</p>\n<p>News can also serve as a way to connect us as human beings. This could include stories about tragedies or uplifting events that affect us emotionally. Such stories can lead people to join a cause or donate money to help those in need.</p>\n<p>新闻也可以作为连接我们人类的一种方式，这可能包括影响我们情感的悲剧或令人振奋的故事，这样的故事可以引导人们加入一个事业，或者捐钱帮助那些有需要的人。</p>\n<p>No matter what kind of news we experience, we have to be able to tell whether it is authentic or not. In the coming lessons, we will show you the steps; how you can do this.</p>\n<p>无论我们经历的是什么样的新闻，我们都必须能够判断它是否真实。在接下来的课程中，我们将向您展示如何做到这些。</p>\n<p>&nbsp;</p>\n<p><strong>Words in This Story</strong></p>\n<p><strong>type&nbsp;</strong>- n. standardized letters for printing</p>\n<p><strong>masses</strong>&nbsp;- n. large groups of people</p>\n<p><strong>bayonet</strong>&nbsp;- n. Knife at the end of a rifle</p>\n<p><strong>atrocity</strong>&nbsp;- n. a cruel and terrible act</p>\n<p><strong>device&nbsp;</strong>- n. an item, such as mobile phone or radio</p>\n<p><strong>reliable</strong>&nbsp;- adj. can be trusted to do the correct thing</p>\n<p><strong>divert</strong>&nbsp;- v. to change direction, or move one\'s attention</p>', 'voa慢速英语视频:News Literacy Lesson 1: Real News vs. Fake News', 1, 1, 15, '2021-04-04 14:31:36', '2022-04-05 13:04:34', 4, 1138, 4, 2, 7, NULL);
INSERT INTO `article` VALUES (47, '测试管理员写的文章', '1649135534392.jpg', 1, '2022-04-05 13:12:23', '<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>\n<p>测试一下啦</p>', '测试一下', 1, 0, 20, '2022-04-05 13:13:01', '2022-04-05 19:50:20', 0, 10, 1, 0, 17, NULL);
INSERT INTO `article` VALUES (48, '测试一下', '1649160673451.jpg', 3, '2022-04-05 20:11:17', '<p>而是1111</p>', '测试', 1, 1, 21, '2022-04-05 20:11:27', '2022-04-05 20:11:27', 0, 4, 1, 0, 4, NULL);
INSERT INTO `article` VALUES (49, '测试 2', '1649160839536.jpg', 13, '2022-04-05 20:14:06', '<p>123</p>', '123', 1, 1, 22, '2022-04-05 20:14:18', '2022-04-05 20:14:18', 0, 3, 1, 0, 4, NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '体育', NULL, '2021-03-24 16:53:14', '2021-03-24 16:38:48');
INSERT INTO `category` VALUES (2, '音乐', '2021-03-24 16:53:29', '2021-03-24 16:53:26', NULL);
INSERT INTO `category` VALUES (3, '测试', '2021-03-21 15:28:24', '2021-03-21 15:30:13', '2021-03-21 15:30:41');
INSERT INTO `category` VALUES (4, '四级', '2021-03-21 23:39:00', '2021-03-21 23:39:03', NULL);
INSERT INTO `category` VALUES (5, '演讲', '2021-03-24 11:51:43', '2021-03-24 11:51:43', NULL);
INSERT INTO `category` VALUES (6, '时事新闻', '2021-03-24 16:41:52', '2021-03-24 16:50:06', NULL);
INSERT INTO `category` VALUES (7, 'VOA慢速英语', '2021-04-04 14:28:17', '2021-04-04 14:28:17', NULL);
INSERT INTO `category` VALUES (8, '六级', '2021-04-04 19:46:07', '2021-04-04 19:46:07', NULL);
INSERT INTO `category` VALUES (9, '体育', '2021-04-14 16:22:30', '2021-04-14 16:22:30', NULL);
INSERT INTO `category` VALUES (10, 'TED演讲', '2021-04-14 16:26:22', '2021-04-14 16:26:22', NULL);
INSERT INTO `category` VALUES (11, '电影', '2021-04-14 16:47:18', '2021-04-21 14:26:56', NULL);
INSERT INTO `category` VALUES (12, '测试', '2021-04-19 19:29:07', '2021-04-19 19:29:07', '2021-04-19 19:36:29');
INSERT INTO `category` VALUES (13, '测试', '2021-04-19 19:40:08', '2021-04-19 19:40:08', '2021-04-19 19:42:29');
INSERT INTO `category` VALUES (14, 'ces', '2021-04-20 18:47:56', '2021-04-20 18:47:56', '2021-04-20 18:48:01');
INSERT INTO `category` VALUES (15, '测试分类', '2021-04-21 14:27:00', '2021-04-21 14:27:00', '2021-04-21 14:27:06');
INSERT INTO `category` VALUES (16, '测试111', '2021-05-07 17:56:05', '2021-05-07 17:56:10', '2021-05-07 17:56:12');
INSERT INTO `category` VALUES (17, '测试分类', '2021-05-08 16:21:01', '2021-05-08 16:21:01', NULL);

-- ----------------------------
-- Table structure for cms_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_group`;
CREATE TABLE `cms_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称，例如：搬砖者',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组信息：例如：搬砖的人',
  `level` tinyint(2) NOT NULL DEFAULT 3 COMMENT '分组级别 1：root 2：guest 3：user（root、guest分组只能存在一个)',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_del`(`name`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_group
-- ----------------------------
INSERT INTO `cms_group` VALUES (1, 'root', '超级用户组', 1, '2020-12-22 00:35:50.235', '2020-12-22 00:35:50.235', NULL);
INSERT INTO `cms_group` VALUES (2, 'guest', '游客组', 2, '2020-12-22 00:35:50.238', '2020-12-22 00:35:50.238', NULL);
INSERT INTO `cms_group` VALUES (3, '管理员', '管理员', 3, '2021-03-22 23:32:45.000', '2021-04-13 17:20:09.000', '2021-04-13 17:20:09.000');
INSERT INTO `cms_group` VALUES (4, '内容管理员', '负责网站的日常内容管理', 3, '2021-04-13 20:29:25.000', '2021-04-13 20:29:25.000', NULL);
INSERT INTO `cms_group` VALUES (5, '测试分组', '测试分组', 3, '2021-04-19 19:09:57.000', '2021-04-21 10:43:31.000', '2021-04-21 10:43:31.000');
INSERT INTO `cms_group` VALUES (6, '测试1', '测试1', 3, '2021-04-20 11:26:38.000', '2021-04-21 10:42:56.000', '2021-04-21 10:42:56.000');
INSERT INTO `cms_group` VALUES (7, '测试111', '测试', 3, '2021-04-21 14:22:32.000', '2021-04-21 14:22:32.000', NULL);
INSERT INTO `cms_group` VALUES (8, '新的测试', '123123', 3, '2021-05-07 17:57:26.000', '2021-05-07 17:57:26.000', NULL);
INSERT INTO `cms_group` VALUES (9, '测试分组1', '111', 3, '2021-05-08 16:21:59.000', '2021-05-08 16:21:59.000', NULL);

-- ----------------------------
-- Table structure for cms_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `cms_group_permission`;
CREATE TABLE `cms_group_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '分组id',
  `permission_id` int(10) UNSIGNED NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id_permission_id`(`group_id`, `permission_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_group_permission
-- ----------------------------
INSERT INTO `cms_group_permission` VALUES (31, 4, 22);
INSERT INTO `cms_group_permission` VALUES (32, 4, 23);
INSERT INTO `cms_group_permission` VALUES (33, 4, 24);
INSERT INTO `cms_group_permission` VALUES (34, 4, 25);
INSERT INTO `cms_group_permission` VALUES (35, 4, 26);
INSERT INTO `cms_group_permission` VALUES (36, 4, 27);
INSERT INTO `cms_group_permission` VALUES (37, 4, 28);
INSERT INTO `cms_group_permission` VALUES (38, 4, 29);
INSERT INTO `cms_group_permission` VALUES (39, 4, 30);
INSERT INTO `cms_group_permission` VALUES (88, 4, 37);
INSERT INTO `cms_group_permission` VALUES (89, 4, 38);
INSERT INTO `cms_group_permission` VALUES (90, 4, 39);
INSERT INTO `cms_group_permission` VALUES (92, 4, 41);
INSERT INTO `cms_group_permission` VALUES (93, 4, 42);
INSERT INTO `cms_group_permission` VALUES (94, 4, 44);
INSERT INTO `cms_group_permission` VALUES (91, 4, 45);
INSERT INTO `cms_group_permission` VALUES (115, 7, 22);
INSERT INTO `cms_group_permission` VALUES (116, 7, 23);
INSERT INTO `cms_group_permission` VALUES (117, 7, 24);
INSERT INTO `cms_group_permission` VALUES (118, 7, 41);
INSERT INTO `cms_group_permission` VALUES (119, 8, 22);
INSERT INTO `cms_group_permission` VALUES (120, 8, 23);
INSERT INTO `cms_group_permission` VALUES (121, 8, 24);
INSERT INTO `cms_group_permission` VALUES (95, 8, 37);
INSERT INTO `cms_group_permission` VALUES (96, 8, 38);
INSERT INTO `cms_group_permission` VALUES (97, 8, 39);
INSERT INTO `cms_group_permission` VALUES (122, 8, 41);
INSERT INTO `cms_group_permission` VALUES (98, 8, 45);
INSERT INTO `cms_group_permission` VALUES (103, 9, 25);
INSERT INTO `cms_group_permission` VALUES (104, 9, 26);
INSERT INTO `cms_group_permission` VALUES (105, 9, 27);
INSERT INTO `cms_group_permission` VALUES (107, 9, 28);
INSERT INTO `cms_group_permission` VALUES (108, 9, 29);
INSERT INTO `cms_group_permission` VALUES (109, 9, 30);
INSERT INTO `cms_group_permission` VALUES (111, 9, 37);
INSERT INTO `cms_group_permission` VALUES (112, 9, 38);
INSERT INTO `cms_group_permission` VALUES (113, 9, 39);
INSERT INTO `cms_group_permission` VALUES (106, 9, 42);
INSERT INTO `cms_group_permission` VALUES (110, 9, 44);
INSERT INTO `cms_group_permission` VALUES (114, 9, 45);

-- ----------------------------
-- Table structure for cms_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_log`;
CREATE TABLE `cms_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `message` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作日志信息',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `status_code` int(11) NULL DEFAULT NULL COMMENT '响应状态码',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口访问路径',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 454 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_log
-- ----------------------------
INSERT INTO `cms_log` VALUES (1, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-01-02 11:41:14.000', '2021-01-02 11:41:14.000', NULL);
INSERT INTO `cms_log` VALUES (2, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-02 11:58:43.000', '2021-01-02 11:58:43.000', NULL);
INSERT INTO `cms_log` VALUES (3, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/6', '删除期刊内容', '2021-01-02 12:03:38.000', '2021-01-02 12:03:38.000', NULL);
INSERT INTO `cms_log` VALUES (4, 'root新增最新期刊', 1, 'root', 201, 'POST', '/v1/flow', '新增最新期刊', '2021-01-02 15:57:00.000', '2021-01-02 15:57:00.000', NULL);
INSERT INTO `cms_log` VALUES (5, 'root新增最新期刊', 1, 'root', 201, 'POST', '/v1/flow', '新增最新期刊', '2021-01-02 16:47:13.000', '2021-01-02 16:47:13.000', NULL);
INSERT INTO `cms_log` VALUES (6, 'root新增最新期刊', 1, 'root', 201, 'POST', '/v1/flow', '新增最新期刊', '2021-01-02 16:47:36.000', '2021-01-02 16:47:36.000', NULL);
INSERT INTO `cms_log` VALUES (7, 'root新增最新期刊', 1, 'root', 201, 'POST', '/v1/flow', '新增最新期刊', '2021-01-02 16:47:40.000', '2021-01-02 16:47:40.000', NULL);
INSERT INTO `cms_log` VALUES (8, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 00:44:40.000', '2021-01-03 00:44:40.000', NULL);
INSERT INTO `cms_log` VALUES (9, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 00:44:48.000', '2021-01-03 00:44:48.000', NULL);
INSERT INTO `cms_log` VALUES (10, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 00:45:15.000', '2021-01-03 00:45:15.000', NULL);
INSERT INTO `cms_log` VALUES (11, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 00:45:25.000', '2021-01-03 00:45:25.000', NULL);
INSERT INTO `cms_log` VALUES (12, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 00:45:36.000', '2021-01-03 00:45:36.000', NULL);
INSERT INTO `cms_log` VALUES (13, 'root最新期刊内容删除', 1, 'root', 201, 'DELETE', '/v1/flow/4', '最新期刊内容删除', '2021-01-03 00:56:39.000', '2021-01-03 00:56:39.000', NULL);
INSERT INTO `cms_log` VALUES (14, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-03 01:17:01.000', '2021-01-03 01:17:01.000', NULL);
INSERT INTO `cms_log` VALUES (15, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-03 01:20:20.000', '2021-01-03 01:20:20.000', NULL);
INSERT INTO `cms_log` VALUES (16, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/8', '删除期刊内容', '2021-01-03 01:21:51.000', '2021-01-03 01:21:51.000', NULL);
INSERT INTO `cms_log` VALUES (17, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/1', '修改期刊内容', '2021-01-03 01:22:27.000', '2021-01-03 01:22:27.000', NULL);
INSERT INTO `cms_log` VALUES (18, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/1', '修改期刊内容', '2021-01-03 01:23:18.000', '2021-01-03 01:23:18.000', NULL);
INSERT INTO `cms_log` VALUES (19, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 01:25:27.000', '2021-01-03 01:25:27.000', NULL);
INSERT INTO `cms_log` VALUES (20, 'root修改最新期刊', 1, 'root', 201, 'PUT', '/v1/flow/1', '编辑最新期刊', '2021-01-03 01:25:30.000', '2021-01-03 01:25:30.000', NULL);
INSERT INTO `cms_log` VALUES (21, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-04 14:05:27.000', '2021-01-04 14:05:27.000', NULL);
INSERT INTO `cms_log` VALUES (22, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-05 12:16:14.000', '2021-01-05 12:16:14.000', NULL);
INSERT INTO `cms_log` VALUES (23, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-05 12:16:19.000', '2021-01-05 12:16:19.000', NULL);
INSERT INTO `cms_log` VALUES (24, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-05 12:16:22.000', '2021-01-05 12:16:22.000', NULL);
INSERT INTO `cms_log` VALUES (25, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-05 12:16:26.000', '2021-01-05 12:16:26.000', NULL);
INSERT INTO `cms_log` VALUES (26, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/1', '修改期刊内容', '2021-01-05 12:34:34.000', '2021-01-05 12:34:34.000', NULL);
INSERT INTO `cms_log` VALUES (27, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/1', '修改期刊内容', '2021-01-05 12:48:56.000', '2021-01-05 12:48:56.000', NULL);
INSERT INTO `cms_log` VALUES (28, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 00:13:52.000', '2021-01-22 00:13:52.000', NULL);
INSERT INTO `cms_log` VALUES (29, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 00:18:05.000', '2021-01-22 00:18:05.000', NULL);
INSERT INTO `cms_log` VALUES (30, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 01:57:51.000', '2021-01-22 01:57:51.000', NULL);
INSERT INTO `cms_log` VALUES (31, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 01:59:11.000', '2021-01-22 01:59:11.000', NULL);
INSERT INTO `cms_log` VALUES (32, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 02:01:57.000', '2021-01-22 02:01:57.000', NULL);
INSERT INTO `cms_log` VALUES (33, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 02:02:25.000', '2021-01-22 02:02:25.000', NULL);
INSERT INTO `cms_log` VALUES (34, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-22 02:03:56.000', '2021-01-22 02:03:56.000', NULL);
INSERT INTO `cms_log` VALUES (35, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/17', '修改期刊内容', '2021-01-26 02:08:33.000', '2021-01-26 02:08:33.000', NULL);
INSERT INTO `cms_log` VALUES (36, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/18', '修改期刊内容', '2021-01-26 02:08:39.000', '2021-01-26 02:08:39.000', NULL);
INSERT INTO `cms_log` VALUES (37, 'root修改期刊内容', 1, 'root', 201, 'PUT', '/v1/content/18', '修改期刊内容', '2021-01-26 02:08:51.000', '2021-01-26 02:08:51.000', NULL);
INSERT INTO `cms_log` VALUES (38, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/7', '删除期刊内容', '2021-01-29 21:21:47.000', '2021-01-29 21:21:47.000', NULL);
INSERT INTO `cms_log` VALUES (39, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/18', '删除期刊内容', '2021-01-29 21:23:30.000', '2021-01-29 21:23:30.000', NULL);
INSERT INTO `cms_log` VALUES (40, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/5', '删除期刊内容', '2021-01-29 21:23:35.000', '2021-01-29 21:23:35.000', NULL);
INSERT INTO `cms_log` VALUES (41, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/1', '删除期刊内容', '2021-01-29 21:23:37.000', '2021-01-29 21:23:37.000', NULL);
INSERT INTO `cms_log` VALUES (42, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/1', '删除期刊内容', '2021-01-29 21:23:39.000', '2021-01-29 21:23:39.000', NULL);
INSERT INTO `cms_log` VALUES (43, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/2', '删除期刊内容', '2021-01-29 21:23:41.000', '2021-01-29 21:23:41.000', NULL);
INSERT INTO `cms_log` VALUES (44, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/2', '删除期刊内容', '2021-01-29 21:23:43.000', '2021-01-29 21:23:43.000', NULL);
INSERT INTO `cms_log` VALUES (45, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/3', '删除期刊内容', '2021-01-29 21:23:45.000', '2021-01-29 21:23:45.000', NULL);
INSERT INTO `cms_log` VALUES (46, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/4', '删除期刊内容', '2021-01-29 21:23:46.000', '2021-01-29 21:23:46.000', NULL);
INSERT INTO `cms_log` VALUES (47, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/5', '删除期刊内容', '2021-01-29 21:23:47.000', '2021-01-29 21:23:47.000', NULL);
INSERT INTO `cms_log` VALUES (48, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/7', '删除期刊内容', '2021-01-29 21:23:49.000', '2021-01-29 21:23:49.000', NULL);
INSERT INTO `cms_log` VALUES (49, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/9', '删除期刊内容', '2021-01-29 21:23:51.000', '2021-01-29 21:23:51.000', NULL);
INSERT INTO `cms_log` VALUES (50, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/10', '删除期刊内容', '2021-01-29 21:23:52.000', '2021-01-29 21:23:52.000', NULL);
INSERT INTO `cms_log` VALUES (51, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/11', '删除期刊内容', '2021-01-29 21:23:54.000', '2021-01-29 21:23:54.000', NULL);
INSERT INTO `cms_log` VALUES (52, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/12', '删除期刊内容', '2021-01-29 21:23:56.000', '2021-01-29 21:23:56.000', NULL);
INSERT INTO `cms_log` VALUES (53, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/13', '删除期刊内容', '2021-01-29 21:23:57.000', '2021-01-29 21:23:57.000', NULL);
INSERT INTO `cms_log` VALUES (54, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/14', '删除期刊内容', '2021-01-29 21:23:59.000', '2021-01-29 21:23:59.000', NULL);
INSERT INTO `cms_log` VALUES (55, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/15', '删除期刊内容', '2021-01-29 21:24:00.000', '2021-01-29 21:24:00.000', NULL);
INSERT INTO `cms_log` VALUES (56, 'root删除期刊内容', 1, 'root', 201, 'DELETE', '/v1/content/6', '删除期刊内容', '2021-01-29 21:24:01.000', '2021-01-29 21:24:01.000', NULL);
INSERT INTO `cms_log` VALUES (57, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 21:34:35.000', '2021-01-29 21:34:35.000', NULL);
INSERT INTO `cms_log` VALUES (58, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 21:37:49.000', '2021-01-29 21:37:49.000', NULL);
INSERT INTO `cms_log` VALUES (59, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:01:45.000', '2021-01-29 22:01:45.000', NULL);
INSERT INTO `cms_log` VALUES (60, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:22:18.000', '2021-01-29 22:22:18.000', NULL);
INSERT INTO `cms_log` VALUES (61, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:23:40.000', '2021-01-29 22:23:40.000', NULL);
INSERT INTO `cms_log` VALUES (62, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:24:48.000', '2021-01-29 22:24:48.000', NULL);
INSERT INTO `cms_log` VALUES (63, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:25:43.000', '2021-01-29 22:25:43.000', NULL);
INSERT INTO `cms_log` VALUES (64, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:27:19.000', '2021-01-29 22:27:19.000', NULL);
INSERT INTO `cms_log` VALUES (65, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:29:10.000', '2021-01-29 22:29:10.000', NULL);
INSERT INTO `cms_log` VALUES (66, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:29:38.000', '2021-01-29 22:29:38.000', NULL);
INSERT INTO `cms_log` VALUES (67, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:31:55.000', '2021-01-29 22:31:55.000', NULL);
INSERT INTO `cms_log` VALUES (68, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:33:14.000', '2021-01-29 22:33:14.000', NULL);
INSERT INTO `cms_log` VALUES (69, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:33:56.000', '2021-01-29 22:33:56.000', NULL);
INSERT INTO `cms_log` VALUES (70, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:38:16.000', '2021-01-29 22:38:16.000', NULL);
INSERT INTO `cms_log` VALUES (71, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:39:04.000', '2021-01-29 22:39:04.000', NULL);
INSERT INTO `cms_log` VALUES (72, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:40:26.000', '2021-01-29 22:40:26.000', NULL);
INSERT INTO `cms_log` VALUES (73, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:41:45.000', '2021-01-29 22:41:45.000', NULL);
INSERT INTO `cms_log` VALUES (74, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:42:06.000', '2021-01-29 22:42:06.000', NULL);
INSERT INTO `cms_log` VALUES (75, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:44:24.000', '2021-01-29 22:44:24.000', NULL);
INSERT INTO `cms_log` VALUES (76, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:45:05.000', '2021-01-29 22:45:05.000', NULL);
INSERT INTO `cms_log` VALUES (77, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:46:05.000', '2021-01-29 22:46:05.000', NULL);
INSERT INTO `cms_log` VALUES (78, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:47:03.000', '2021-01-29 22:47:03.000', NULL);
INSERT INTO `cms_log` VALUES (79, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:47:59.000', '2021-01-29 22:47:59.000', NULL);
INSERT INTO `cms_log` VALUES (80, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:49:55.000', '2021-01-29 22:49:55.000', NULL);
INSERT INTO `cms_log` VALUES (81, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:52:13.000', '2021-01-29 22:52:13.000', NULL);
INSERT INTO `cms_log` VALUES (82, 'root新增期刊内容', 1, 'root', 201, 'POST', '/v1/content', '新增期刊内容', '2021-01-29 22:53:11.000', '2021-01-29 22:53:11.000', NULL);
INSERT INTO `cms_log` VALUES (83, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-19 23:28:12.000', '2021-03-19 23:28:12.000', NULL);
INSERT INTO `cms_log` VALUES (84, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-19 23:42:04.000', '2021-03-19 23:42:04.000', NULL);
INSERT INTO `cms_log` VALUES (85, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-19 23:42:18.000', '2021-03-19 23:42:18.000', NULL);
INSERT INTO `cms_log` VALUES (86, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-19 23:47:44.000', '2021-03-19 23:47:44.000', NULL);
INSERT INTO `cms_log` VALUES (87, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/1', '删除文章', '2021-03-19 23:53:42.000', '2021-03-19 23:53:42.000', NULL);
INSERT INTO `cms_log` VALUES (88, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/2', '修改文章内容', '2021-03-19 23:57:52.000', '2021-03-19 23:57:52.000', NULL);
INSERT INTO `cms_log` VALUES (89, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/2', '修改文章内容', '2021-03-19 23:58:18.000', '2021-03-19 23:58:18.000', NULL);
INSERT INTO `cms_log` VALUES (90, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/2', '修改文章内容', '2021-03-19 23:59:37.000', '2021-03-19 23:59:37.000', NULL);
INSERT INTO `cms_log` VALUES (91, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-20 00:37:51.000', '2021-03-20 00:37:51.000', NULL);
INSERT INTO `cms_log` VALUES (92, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-20 00:38:05.000', '2021-03-20 00:38:05.000', NULL);
INSERT INTO `cms_log` VALUES (93, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-20 00:38:11.000', '2021-03-20 00:38:11.000', NULL);
INSERT INTO `cms_log` VALUES (94, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-20 00:38:17.000', '2021-03-20 00:38:17.000', NULL);
INSERT INTO `cms_log` VALUES (95, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-20 00:38:24.000', '2021-03-20 00:38:24.000', NULL);
INSERT INTO `cms_log` VALUES (96, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-20 01:32:37.000', '2021-03-20 01:32:37.000', NULL);
INSERT INTO `cms_log` VALUES (97, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-21 14:40:40.000', '2021-03-21 14:40:40.000', NULL);
INSERT INTO `cms_log` VALUES (98, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-03-21 15:28:24.000', '2021-03-21 15:28:24.000', NULL);
INSERT INTO `cms_log` VALUES (99, 'root修改分类内容', 1, 'root', 201, 'PUT', '/v1/category/3', '修改分类内容', '2021-03-21 15:30:13.000', '2021-03-21 15:30:13.000', NULL);
INSERT INTO `cms_log` VALUES (100, 'root删除分类', 1, 'root', 201, 'DELETE', '/v1/category/3', '删除分类', '2021-03-21 15:30:41.000', '2021-03-21 15:30:41.000', NULL);
INSERT INTO `cms_log` VALUES (101, 'root删除分类', 1, 'root', 201, 'DELETE', '/v1/category/2', '删除分类', '2021-03-21 22:01:48.000', '2021-03-21 22:01:48.000', NULL);
INSERT INTO `cms_log` VALUES (102, 'root删除分类', 1, 'root', 201, 'DELETE', '/v1/category/2', '删除分类', '2021-03-21 22:02:33.000', '2021-03-21 22:02:33.000', NULL);
INSERT INTO `cms_log` VALUES (103, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-03-22 10:11:18.000', '2021-03-22 10:11:18.000', NULL);
INSERT INTO `cms_log` VALUES (104, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/2', '修改听力练习内容', '2021-03-22 10:12:40.000', '2021-03-22 10:12:40.000', NULL);
INSERT INTO `cms_log` VALUES (105, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/2', '修改听力练习内容', '2021-03-22 10:13:01.000', '2021-03-22 10:13:01.000', NULL);
INSERT INTO `cms_log` VALUES (106, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/1', '删除听力练习', '2021-03-22 10:13:47.000', '2021-03-22 10:13:47.000', NULL);
INSERT INTO `cms_log` VALUES (107, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-03-22 23:32:07.000', '2021-03-22 23:32:07.000', NULL);
INSERT INTO `cms_log` VALUES (108, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/9', '删除文章', '2021-03-23 16:38:53.000', '2021-03-23 16:38:53.000', NULL);
INSERT INTO `cms_log` VALUES (109, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/9', '删除文章', '2021-03-23 16:39:20.000', '2021-03-23 16:39:20.000', NULL);
INSERT INTO `cms_log` VALUES (110, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/8', '删除文章', '2021-03-23 16:39:55.000', '2021-03-23 16:39:55.000', NULL);
INSERT INTO `cms_log` VALUES (111, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/7', '删除文章', '2021-03-23 16:41:01.000', '2021-03-23 16:41:01.000', NULL);
INSERT INTO `cms_log` VALUES (112, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/6', '删除文章', '2021-03-23 16:45:16.000', '2021-03-23 16:45:16.000', NULL);
INSERT INTO `cms_log` VALUES (113, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/6', '删除文章', '2021-03-23 16:45:56.000', '2021-03-23 16:45:56.000', NULL);
INSERT INTO `cms_log` VALUES (114, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/5', '删除文章', '2021-03-23 16:47:02.000', '2021-03-23 16:47:02.000', NULL);
INSERT INTO `cms_log` VALUES (115, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-23 17:37:13.000', '2021-03-23 17:37:13.000', NULL);
INSERT INTO `cms_log` VALUES (116, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/10', '修改文章内容', '2021-03-23 17:39:22.000', '2021-03-23 17:39:22.000', NULL);
INSERT INTO `cms_log` VALUES (117, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/10', '修改文章内容', '2021-03-23 17:39:52.000', '2021-03-23 17:39:52.000', NULL);
INSERT INTO `cms_log` VALUES (118, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-23 19:23:20.000', '2021-03-23 19:23:20.000', NULL);
INSERT INTO `cms_log` VALUES (119, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/11', '修改文章内容', '2021-03-23 19:34:57.000', '2021-03-23 19:34:57.000', NULL);
INSERT INTO `cms_log` VALUES (120, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-23 19:40:22.000', '2021-03-23 19:40:22.000', NULL);
INSERT INTO `cms_log` VALUES (121, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/10', '修改文章内容', '2021-03-23 19:49:06.000', '2021-03-23 19:49:06.000', NULL);
INSERT INTO `cms_log` VALUES (122, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/11', '修改文章内容', '2021-03-23 20:00:15.000', '2021-03-23 20:00:15.000', NULL);
INSERT INTO `cms_log` VALUES (123, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-23 20:08:09.000', '2021-03-23 20:08:09.000', NULL);
INSERT INTO `cms_log` VALUES (124, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-23 20:10:21.000', '2021-03-23 20:10:21.000', NULL);
INSERT INTO `cms_log` VALUES (125, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/14', '修改文章内容', '2021-03-23 20:10:54.000', '2021-03-23 20:10:54.000', NULL);
INSERT INTO `cms_log` VALUES (126, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/12', '修改文章内容', '2021-03-23 20:13:02.000', '2021-03-23 20:13:02.000', NULL);
INSERT INTO `cms_log` VALUES (127, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/13', '修改文章内容', '2021-03-23 20:13:16.000', '2021-03-23 20:13:16.000', NULL);
INSERT INTO `cms_log` VALUES (128, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-24 11:15:22.000', '2021-03-24 11:15:22.000', NULL);
INSERT INTO `cms_log` VALUES (129, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-24 11:15:39.000', '2021-03-24 11:15:39.000', NULL);
INSERT INTO `cms_log` VALUES (130, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/11', '删除文章', '2021-03-24 11:16:06.000', '2021-03-24 11:16:06.000', NULL);
INSERT INTO `cms_log` VALUES (131, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-03-24 11:51:43.000', '2021-03-24 11:51:43.000', NULL);
INSERT INTO `cms_log` VALUES (132, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/12', '修改文章内容', '2021-03-24 11:59:36.000', '2021-03-24 11:59:36.000', NULL);
INSERT INTO `cms_log` VALUES (133, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-24 14:25:58.000', '2021-03-24 14:25:58.000', NULL);
INSERT INTO `cms_log` VALUES (134, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-24 15:05:08.000', '2021-03-24 15:05:08.000', NULL);
INSERT INTO `cms_log` VALUES (135, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/2', '删除文章', '2021-03-24 15:35:42.000', '2021-03-24 15:35:42.000', NULL);
INSERT INTO `cms_log` VALUES (136, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 15:36:05.000', '2021-03-24 15:36:05.000', NULL);
INSERT INTO `cms_log` VALUES (137, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 15:36:38.000', '2021-03-24 15:36:38.000', NULL);
INSERT INTO `cms_log` VALUES (138, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:12:34.000', '2021-03-24 16:12:34.000', NULL);
INSERT INTO `cms_log` VALUES (139, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:13:29.000', '2021-03-24 16:13:29.000', NULL);
INSERT INTO `cms_log` VALUES (140, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:15:54.000', '2021-03-24 16:15:54.000', NULL);
INSERT INTO `cms_log` VALUES (141, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:16:04.000', '2021-03-24 16:16:04.000', NULL);
INSERT INTO `cms_log` VALUES (142, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:16:40.000', '2021-03-24 16:16:40.000', NULL);
INSERT INTO `cms_log` VALUES (143, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:17:11.000', '2021-03-24 16:17:11.000', NULL);
INSERT INTO `cms_log` VALUES (144, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/3', '修改文章内容', '2021-03-24 16:17:50.000', '2021-03-24 16:17:50.000', NULL);
INSERT INTO `cms_log` VALUES (145, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/3', '删除文章', '2021-03-24 16:21:21.000', '2021-03-24 16:21:21.000', NULL);
INSERT INTO `cms_log` VALUES (146, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/4', '删除文章', '2021-03-24 16:21:24.000', '2021-03-24 16:21:24.000', NULL);
INSERT INTO `cms_log` VALUES (147, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/10', '删除文章', '2021-03-24 16:21:26.000', '2021-03-24 16:21:26.000', NULL);
INSERT INTO `cms_log` VALUES (148, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/12', '删除文章', '2021-03-24 16:21:27.000', '2021-03-24 16:21:27.000', NULL);
INSERT INTO `cms_log` VALUES (149, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/13', '删除文章', '2021-03-24 16:21:29.000', '2021-03-24 16:21:29.000', NULL);
INSERT INTO `cms_log` VALUES (150, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/14', '删除文章', '2021-03-24 16:21:31.000', '2021-03-24 16:21:31.000', NULL);
INSERT INTO `cms_log` VALUES (151, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/15', '删除文章', '2021-03-24 16:21:33.000', '2021-03-24 16:21:33.000', NULL);
INSERT INTO `cms_log` VALUES (152, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/16', '删除文章', '2021-03-24 16:21:35.000', '2021-03-24 16:21:35.000', NULL);
INSERT INTO `cms_log` VALUES (153, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/17', '删除文章', '2021-03-24 16:21:37.000', '2021-03-24 16:21:37.000', NULL);
INSERT INTO `cms_log` VALUES (154, 'root删除分类', 1, 'root', 201, 'DELETE', '/v1/category/1', '删除分类', '2021-03-24 16:38:48.000', '2021-03-24 16:38:48.000', NULL);
INSERT INTO `cms_log` VALUES (155, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-03-24 16:41:52.000', '2021-03-24 16:41:52.000', NULL);
INSERT INTO `cms_log` VALUES (156, 'root修改分类内容', 1, 'root', 201, 'PUT', '/v1/category/6', '修改分类内容', '2021-03-24 16:49:11.000', '2021-03-24 16:49:11.000', NULL);
INSERT INTO `cms_log` VALUES (157, 'root修改分类内容', 1, 'root', 201, 'PUT', '/v1/category/6', '修改分类内容', '2021-03-24 16:50:06.000', '2021-03-24 16:50:06.000', NULL);
INSERT INTO `cms_log` VALUES (158, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-03-24 19:17:46.000', '2021-03-24 19:17:46.000', NULL);
INSERT INTO `cms_log` VALUES (159, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/18', '修改文章内容', '2021-03-24 19:25:03.000', '2021-03-24 19:25:03.000', NULL);
INSERT INTO `cms_log` VALUES (160, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-03-24 19:26:44.000', '2021-03-24 19:26:44.000', NULL);
INSERT INTO `cms_log` VALUES (161, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-03-24 21:33:50.000', '2021-03-24 21:33:50.000', NULL);
INSERT INTO `cms_log` VALUES (162, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-03-25 19:48:44.000', '2021-03-25 19:48:44.000', NULL);
INSERT INTO `cms_log` VALUES (163, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/19', '删除文章', '2021-03-27 15:45:43.000', '2021-03-27 15:45:43.000', NULL);
INSERT INTO `cms_log` VALUES (164, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-02 21:30:28.000', '2021-04-02 21:30:28.000', NULL);
INSERT INTO `cms_log` VALUES (165, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-02 21:30:56.000', '2021-04-02 21:30:56.000', NULL);
INSERT INTO `cms_log` VALUES (166, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-02 21:31:34.000', '2021-04-02 21:31:34.000', NULL);
INSERT INTO `cms_log` VALUES (167, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-02 21:31:45.000', '2021-04-02 21:31:45.000', NULL);
INSERT INTO `cms_log` VALUES (168, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1', '删除单词', '2021-04-02 21:51:33.000', '2021-04-02 21:51:33.000', NULL);
INSERT INTO `cms_log` VALUES (169, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-03 01:08:27.000', '2021-04-03 01:08:27.000', NULL);
INSERT INTO `cms_log` VALUES (170, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-04-04 14:28:17.000', '2021-04-04 14:28:17.000', NULL);
INSERT INTO `cms_log` VALUES (171, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-04 14:31:36.000', '2021-04-04 14:31:36.000', NULL);
INSERT INTO `cms_log` VALUES (172, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/21', '修改文章内容', '2021-04-04 14:32:18.000', '2021-04-04 14:32:18.000', NULL);
INSERT INTO `cms_log` VALUES (173, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-04 14:35:15.000', '2021-04-04 14:35:15.000', NULL);
INSERT INTO `cms_log` VALUES (174, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-04 14:37:29.000', '2021-04-04 14:37:29.000', NULL);
INSERT INTO `cms_log` VALUES (175, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-04 14:37:40.000', '2021-04-04 14:37:40.000', NULL);
INSERT INTO `cms_log` VALUES (176, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/21', '修改文章内容', '2021-04-04 14:37:48.000', '2021-04-04 14:37:48.000', NULL);
INSERT INTO `cms_log` VALUES (177, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-04 14:39:02.000', '2021-04-04 14:39:02.000', NULL);
INSERT INTO `cms_log` VALUES (178, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-04 14:55:44.000', '2021-04-04 14:55:44.000', NULL);
INSERT INTO `cms_log` VALUES (179, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-04 14:57:37.000', '2021-04-04 14:57:37.000', NULL);
INSERT INTO `cms_log` VALUES (180, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/5', '删除听力练习', '2021-04-04 17:54:44.000', '2021-04-04 17:54:44.000', NULL);
INSERT INTO `cms_log` VALUES (181, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/4', '删除听力练习', '2021-04-04 17:54:45.000', '2021-04-04 17:54:45.000', NULL);
INSERT INTO `cms_log` VALUES (182, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/3', '删除听力练习', '2021-04-04 17:54:47.000', '2021-04-04 17:54:47.000', NULL);
INSERT INTO `cms_log` VALUES (183, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-04 19:00:26.000', '2021-04-04 19:00:26.000', NULL);
INSERT INTO `cms_log` VALUES (184, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-04 19:30:21.000', '2021-04-04 19:30:21.000', NULL);
INSERT INTO `cms_log` VALUES (185, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/18', '修改文章内容', '2021-04-04 19:30:48.000', '2021-04-04 19:30:48.000', NULL);
INSERT INTO `cms_log` VALUES (186, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-04 19:31:20.000', '2021-04-04 19:31:20.000', NULL);
INSERT INTO `cms_log` VALUES (187, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-04 19:31:27.000', '2021-04-04 19:31:27.000', NULL);
INSERT INTO `cms_log` VALUES (188, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-04 19:34:12.000', '2021-04-04 19:34:12.000', NULL);
INSERT INTO `cms_log` VALUES (189, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-04 19:36:42.000', '2021-04-04 19:36:42.000', NULL);
INSERT INTO `cms_log` VALUES (190, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-04 19:39:51.000', '2021-04-04 19:39:51.000', NULL);
INSERT INTO `cms_log` VALUES (191, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-04 19:45:51.000', '2021-04-04 19:45:51.000', NULL);
INSERT INTO `cms_log` VALUES (192, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-04-04 19:46:07.000', '2021-04-04 19:46:07.000', NULL);
INSERT INTO `cms_log` VALUES (193, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-04 19:51:33.000', '2021-04-04 19:51:33.000', NULL);
INSERT INTO `cms_log` VALUES (194, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-04 19:53:08.000', '2021-04-04 19:53:08.000', NULL);
INSERT INTO `cms_log` VALUES (195, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-04 19:56:02.000', '2021-04-04 19:56:02.000', NULL);
INSERT INTO `cms_log` VALUES (196, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:21:36.000', '2021-04-12 10:21:36.000', NULL);
INSERT INTO `cms_log` VALUES (197, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:22:28.000', '2021-04-12 10:22:28.000', NULL);
INSERT INTO `cms_log` VALUES (198, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:24:17.000', '2021-04-12 10:24:17.000', NULL);
INSERT INTO `cms_log` VALUES (199, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:24:38.000', '2021-04-12 10:24:38.000', NULL);
INSERT INTO `cms_log` VALUES (200, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:24:56.000', '2021-04-12 10:24:56.000', NULL);
INSERT INTO `cms_log` VALUES (201, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:25:12.000', '2021-04-12 10:25:12.000', NULL);
INSERT INTO `cms_log` VALUES (202, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:25:28.000', '2021-04-12 10:25:28.000', NULL);
INSERT INTO `cms_log` VALUES (203, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-12 10:25:44.000', '2021-04-12 10:25:44.000', NULL);
INSERT INTO `cms_log` VALUES (204, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-13 20:01:21.000', '2021-04-13 20:01:21.000', NULL);
INSERT INTO `cms_log` VALUES (205, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-13 20:01:56.000', '2021-04-13 20:01:56.000', NULL);
INSERT INTO `cms_log` VALUES (206, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-13 20:02:30.000', '2021-04-13 20:02:30.000', NULL);
INSERT INTO `cms_log` VALUES (207, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-13 20:09:09.000', '2021-04-13 20:09:09.000', NULL);
INSERT INTO `cms_log` VALUES (208, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-04-13 20:10:32.000', '2021-04-13 20:10:32.000', NULL);
INSERT INTO `cms_log` VALUES (209, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/20', '删除单词', '2021-04-13 20:10:35.000', '2021-04-13 20:10:35.000', NULL);
INSERT INTO `cms_log` VALUES (210, 'lzl新增分类', 3, 'lzl', 201, 'POST', '/v1/category', '新增分类', '2021-04-14 16:22:30.000', '2021-04-14 16:22:30.000', NULL);
INSERT INTO `cms_log` VALUES (211, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2021-04-14 16:24:31.000', '2021-04-14 16:24:31.000', NULL);
INSERT INTO `cms_log` VALUES (212, 'lzl修改文章内容', 3, 'lzl', 201, 'PUT', '/v1/article/18', '修改文章内容', '2021-04-14 16:24:49.000', '2021-04-14 16:24:49.000', NULL);
INSERT INTO `cms_log` VALUES (213, 'lzl修改文章内容', 3, 'lzl', 201, 'PUT', '/v1/article/20', '修改文章内容', '2021-04-14 16:25:03.000', '2021-04-14 16:25:03.000', NULL);
INSERT INTO `cms_log` VALUES (214, 'lzl新增分类', 3, 'lzl', 201, 'POST', '/v1/category', '新增分类', '2021-04-14 16:26:22.000', '2021-04-14 16:26:22.000', NULL);
INSERT INTO `cms_log` VALUES (215, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2021-04-14 16:31:43.000', '2021-04-14 16:31:43.000', NULL);
INSERT INTO `cms_log` VALUES (216, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2021-04-14 16:34:52.000', '2021-04-14 16:34:52.000', NULL);
INSERT INTO `cms_log` VALUES (217, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2021-04-14 16:42:44.000', '2021-04-14 16:42:44.000', NULL);
INSERT INTO `cms_log` VALUES (218, 'lzl修改文章内容', 3, 'lzl', 201, 'PUT', '/v1/article/25', '修改文章内容', '2021-04-14 16:43:47.000', '2021-04-14 16:43:47.000', NULL);
INSERT INTO `cms_log` VALUES (219, 'lzl新增分类', 3, 'lzl', 201, 'POST', '/v1/category', '新增分类', '2021-04-14 16:47:18.000', '2021-04-14 16:47:18.000', NULL);
INSERT INTO `cms_log` VALUES (220, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2021-04-14 16:49:09.000', '2021-04-14 16:49:09.000', NULL);
INSERT INTO `cms_log` VALUES (221, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2021-04-14 16:51:14.000', '2021-04-14 16:51:14.000', NULL);
INSERT INTO `cms_log` VALUES (222, 'lzl修改文章内容', 3, 'lzl', 201, 'PUT', '/v1/article/26', '修改文章内容', '2021-04-14 16:58:57.000', '2021-04-14 16:58:57.000', NULL);
INSERT INTO `cms_log` VALUES (223, 'lzl修改分类内容', 3, 'lzl', 201, 'PUT', '/v1/category/4', '修改分类内容', '2021-04-14 21:18:08.000', '2021-04-14 21:18:08.000', NULL);
INSERT INTO `cms_log` VALUES (224, 'lzl修改分类内容', 3, 'lzl', 201, 'PUT', '/v1/category/2', '修改分类内容', '2021-04-14 21:22:57.000', '2021-04-14 21:22:57.000', NULL);
INSERT INTO `cms_log` VALUES (225, 'lzl修改分类内容', 3, 'lzl', 201, 'PUT', '/v1/category/2', '修改分类内容', '2021-04-14 21:23:22.000', '2021-04-14 21:23:22.000', NULL);
INSERT INTO `cms_log` VALUES (226, 'lzl修改分类内容', 3, 'lzl', 201, 'PUT', '/v1/category/2', '修改分类内容', '2021-04-14 21:34:59.000', '2021-04-14 21:34:59.000', NULL);
INSERT INTO `cms_log` VALUES (227, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-15 10:52:53.000', '2021-04-15 10:52:53.000', NULL);
INSERT INTO `cms_log` VALUES (228, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-15 11:05:41.000', '2021-04-15 11:05:41.000', NULL);
INSERT INTO `cms_log` VALUES (229, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/21', '修改文章内容', '2021-04-17 16:42:55.000', '2021-04-17 16:42:55.000', NULL);
INSERT INTO `cms_log` VALUES (230, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 16:43:13.000', '2021-04-17 16:43:13.000', NULL);
INSERT INTO `cms_log` VALUES (231, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 16:43:23.000', '2021-04-17 16:43:23.000', NULL);
INSERT INTO `cms_log` VALUES (232, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/24', '修改文章内容', '2021-04-17 16:43:48.000', '2021-04-17 16:43:48.000', NULL);
INSERT INTO `cms_log` VALUES (233, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/25', '修改文章内容', '2021-04-17 16:43:56.000', '2021-04-17 16:43:56.000', NULL);
INSERT INTO `cms_log` VALUES (234, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/26', '修改文章内容', '2021-04-17 16:44:20.000', '2021-04-17 16:44:20.000', NULL);
INSERT INTO `cms_log` VALUES (235, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/28', '修改文章内容', '2021-04-17 16:44:33.000', '2021-04-17 16:44:33.000', NULL);
INSERT INTO `cms_log` VALUES (236, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/29', '修改文章内容', '2021-04-17 16:44:43.000', '2021-04-17 16:44:43.000', NULL);
INSERT INTO `cms_log` VALUES (237, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/18', '修改文章内容', '2021-04-17 16:47:00.000', '2021-04-17 16:47:00.000', NULL);
INSERT INTO `cms_log` VALUES (238, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 16:57:33.000', '2021-04-17 16:57:33.000', NULL);
INSERT INTO `cms_log` VALUES (239, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 16:59:29.000', '2021-04-17 16:59:29.000', NULL);
INSERT INTO `cms_log` VALUES (240, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 16:59:56.000', '2021-04-17 16:59:56.000', NULL);
INSERT INTO `cms_log` VALUES (241, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:00:58.000', '2021-04-17 17:00:58.000', NULL);
INSERT INTO `cms_log` VALUES (242, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:02:01.000', '2021-04-17 17:02:01.000', NULL);
INSERT INTO `cms_log` VALUES (243, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:02:13.000', '2021-04-17 17:02:13.000', NULL);
INSERT INTO `cms_log` VALUES (244, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:02:36.000', '2021-04-17 17:02:36.000', NULL);
INSERT INTO `cms_log` VALUES (245, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:05:45.000', '2021-04-17 17:05:45.000', NULL);
INSERT INTO `cms_log` VALUES (246, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:08:09.000', '2021-04-17 17:08:09.000', NULL);
INSERT INTO `cms_log` VALUES (247, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:10:16.000', '2021-04-17 17:10:16.000', NULL);
INSERT INTO `cms_log` VALUES (248, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:10:32.000', '2021-04-17 17:10:32.000', NULL);
INSERT INTO `cms_log` VALUES (249, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:14:59.000', '2021-04-17 17:14:59.000', NULL);
INSERT INTO `cms_log` VALUES (250, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:18:24.000', '2021-04-17 17:18:24.000', NULL);
INSERT INTO `cms_log` VALUES (251, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:18:59.000', '2021-04-17 17:18:59.000', NULL);
INSERT INTO `cms_log` VALUES (252, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:19:34.000', '2021-04-17 17:19:34.000', NULL);
INSERT INTO `cms_log` VALUES (253, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:20:03.000', '2021-04-17 17:20:03.000', NULL);
INSERT INTO `cms_log` VALUES (254, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:20:46.000', '2021-04-17 17:20:46.000', NULL);
INSERT INTO `cms_log` VALUES (255, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:33:14.000', '2021-04-17 17:33:14.000', NULL);
INSERT INTO `cms_log` VALUES (256, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:33:45.000', '2021-04-17 17:33:45.000', NULL);
INSERT INTO `cms_log` VALUES (257, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:35:34.000', '2021-04-17 17:35:34.000', NULL);
INSERT INTO `cms_log` VALUES (258, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:36:07.000', '2021-04-17 17:36:07.000', NULL);
INSERT INTO `cms_log` VALUES (259, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 17:36:47.000', '2021-04-17 17:36:47.000', NULL);
INSERT INTO `cms_log` VALUES (260, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:37:52.000', '2021-04-17 17:37:52.000', NULL);
INSERT INTO `cms_log` VALUES (261, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:39:59.000', '2021-04-17 17:39:59.000', NULL);
INSERT INTO `cms_log` VALUES (262, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 17:40:53.000', '2021-04-17 17:40:53.000', NULL);
INSERT INTO `cms_log` VALUES (263, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:42:07.000', '2021-04-17 17:42:07.000', NULL);
INSERT INTO `cms_log` VALUES (264, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:42:57.000', '2021-04-17 17:42:57.000', NULL);
INSERT INTO `cms_log` VALUES (265, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:43:37.000', '2021-04-17 17:43:37.000', NULL);
INSERT INTO `cms_log` VALUES (266, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/21', '修改文章内容', '2021-04-17 17:43:53.000', '2021-04-17 17:43:53.000', NULL);
INSERT INTO `cms_log` VALUES (267, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 17:44:02.000', '2021-04-17 17:44:02.000', NULL);
INSERT INTO `cms_log` VALUES (268, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:45:37.000', '2021-04-17 17:45:37.000', NULL);
INSERT INTO `cms_log` VALUES (269, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/23', '修改文章内容', '2021-04-17 17:45:46.000', '2021-04-17 17:45:46.000', NULL);
INSERT INTO `cms_log` VALUES (270, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 17:46:01.000', '2021-04-17 17:46:01.000', NULL);
INSERT INTO `cms_log` VALUES (271, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 17:46:16.000', '2021-04-17 17:46:16.000', NULL);
INSERT INTO `cms_log` VALUES (272, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/22', '修改文章内容', '2021-04-17 17:48:12.000', '2021-04-17 17:48:12.000', NULL);
INSERT INTO `cms_log` VALUES (273, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/18', '修改文章内容', '2021-04-17 17:48:36.000', '2021-04-17 17:48:36.000', NULL);
INSERT INTO `cms_log` VALUES (274, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-18 18:41:51.000', '2021-04-18 18:41:51.000', NULL);
INSERT INTO `cms_log` VALUES (275, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-18 18:48:22.000', '2021-04-18 18:48:22.000', NULL);
INSERT INTO `cms_log` VALUES (276, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-18 19:18:44.000', '2021-04-18 19:18:44.000', NULL);
INSERT INTO `cms_log` VALUES (277, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/33', '删除文章', '2021-04-18 19:20:01.000', '2021-04-18 19:20:01.000', NULL);
INSERT INTO `cms_log` VALUES (278, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-18 19:20:23.000', '2021-04-18 19:20:23.000', NULL);
INSERT INTO `cms_log` VALUES (279, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/34', '修改文章内容', '2021-04-18 19:20:40.000', '2021-04-18 19:20:40.000', NULL);
INSERT INTO `cms_log` VALUES (280, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/34', '删除文章', '2021-04-18 19:29:15.000', '2021-04-18 19:29:15.000', NULL);
INSERT INTO `cms_log` VALUES (281, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-18 19:37:11.000', '2021-04-18 19:37:11.000', NULL);
INSERT INTO `cms_log` VALUES (282, 'ceshi新增文章', 6, 'ceshi', 201, 'POST', '/v1/article', '新增文章', '2021-04-18 19:37:45.000', '2021-04-18 19:37:45.000', NULL);
INSERT INTO `cms_log` VALUES (283, 'ceshi修改文章内容', 6, 'ceshi', 201, 'PUT', '/v1/article/35', '修改文章内容', '2021-04-18 19:38:00.000', '2021-04-18 19:38:00.000', NULL);
INSERT INTO `cms_log` VALUES (284, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-19 14:38:14.000', '2021-04-19 14:38:14.000', NULL);
INSERT INTO `cms_log` VALUES (285, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/36', '修改文章内容', '2021-04-19 14:39:44.000', '2021-04-19 14:39:44.000', NULL);
INSERT INTO `cms_log` VALUES (286, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/36', '修改文章内容', '2021-04-19 14:40:41.000', '2021-04-19 14:40:41.000', NULL);
INSERT INTO `cms_log` VALUES (287, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/36', '删除文章', '2021-04-19 14:44:55.000', '2021-04-19 14:44:55.000', NULL);
INSERT INTO `cms_log` VALUES (288, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/35', '删除文章', '2021-04-19 14:44:57.000', '2021-04-19 14:44:57.000', NULL);
INSERT INTO `cms_log` VALUES (289, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-19 14:45:15.000', '2021-04-19 14:45:15.000', NULL);
INSERT INTO `cms_log` VALUES (290, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/37', '修改文章内容', '2021-04-19 14:45:36.000', '2021-04-19 14:45:36.000', NULL);
INSERT INTO `cms_log` VALUES (291, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/37', '修改文章内容', '2021-04-19 14:46:16.000', '2021-04-19 14:46:16.000', NULL);
INSERT INTO `cms_log` VALUES (292, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/37', '删除文章', '2021-04-19 14:47:52.000', '2021-04-19 14:47:52.000', NULL);
INSERT INTO `cms_log` VALUES (293, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-19 15:06:43.000', '2021-04-19 15:06:43.000', NULL);
INSERT INTO `cms_log` VALUES (294, 'lzl新增分类', 3, 'lzl', 201, 'POST', '/v1/category', '新增分类', '2021-04-19 19:29:07.000', '2021-04-19 19:29:07.000', NULL);
INSERT INTO `cms_log` VALUES (295, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-19 19:35:58.000', '2021-04-19 19:35:58.000', NULL);
INSERT INTO `cms_log` VALUES (296, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-19 19:36:04.000', '2021-04-19 19:36:04.000', NULL);
INSERT INTO `cms_log` VALUES (297, 'lzl删除单词', 3, 'lzl', 201, 'DELETE', '/v1/word/23', '删除单词', '2021-04-19 19:36:08.000', '2021-04-19 19:36:08.000', NULL);
INSERT INTO `cms_log` VALUES (298, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-19 19:36:23.000', '2021-04-19 19:36:23.000', NULL);
INSERT INTO `cms_log` VALUES (299, 'lzl删除分类', 3, 'lzl', 201, 'DELETE', '/v1/category/12', '删除分类', '2021-04-19 19:36:29.000', '2021-04-19 19:36:29.000', NULL);
INSERT INTO `cms_log` VALUES (300, 'lzl新增分类', 3, 'lzl', 201, 'POST', '/v1/category', '新增分类', '2021-04-19 19:40:08.000', '2021-04-19 19:40:08.000', NULL);
INSERT INTO `cms_log` VALUES (301, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-19 19:40:14.000', '2021-04-19 19:40:14.000', NULL);
INSERT INTO `cms_log` VALUES (302, 'lzl新增单词', 3, 'lzl', 201, 'POST', '/v1/word', '新增单词', '2021-04-19 19:41:56.000', '2021-04-19 19:41:56.000', NULL);
INSERT INTO `cms_log` VALUES (303, 'lzl修改文章内容', 3, 'lzl', 201, 'PUT', '/v1/article/32', '修改文章内容', '2021-04-19 19:42:06.000', '2021-04-19 19:42:06.000', NULL);
INSERT INTO `cms_log` VALUES (304, 'lzl修改文章内容', 3, 'lzl', 201, 'PUT', '/v1/article/32', '修改文章内容', '2021-04-19 19:42:20.000', '2021-04-19 19:42:20.000', NULL);
INSERT INTO `cms_log` VALUES (305, 'lzl删除分类', 3, 'lzl', 201, 'DELETE', '/v1/category/13', '删除分类', '2021-04-19 19:42:29.000', '2021-04-19 19:42:29.000', NULL);
INSERT INTO `cms_log` VALUES (306, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-20 00:17:19.000', '2021-04-20 00:17:19.000', NULL);
INSERT INTO `cms_log` VALUES (307, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/11', '修改听力练习内容', '2021-04-20 00:20:52.000', '2021-04-20 00:20:52.000', NULL);
INSERT INTO `cms_log` VALUES (308, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/11', '删除听力练习', '2021-04-20 00:21:02.000', '2021-04-20 00:21:02.000', NULL);
INSERT INTO `cms_log` VALUES (309, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/38', '修改文章内容', '2021-04-20 10:44:32.000', '2021-04-20 10:44:32.000', NULL);
INSERT INTO `cms_log` VALUES (310, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/38', '修改文章内容', '2021-04-20 10:45:44.000', '2021-04-20 10:45:44.000', NULL);
INSERT INTO `cms_log` VALUES (311, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/38', '修改文章内容', '2021-04-20 10:45:55.000', '2021-04-20 10:45:55.000', NULL);
INSERT INTO `cms_log` VALUES (312, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-20 11:08:04.000', '2021-04-20 11:08:04.000', NULL);
INSERT INTO `cms_log` VALUES (313, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-20 11:26:54.000', '2021-04-20 11:26:54.000', NULL);
INSERT INTO `cms_log` VALUES (314, 'ceshi新增听力练习', 8, 'ceshi', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-20 16:45:03.000', '2021-04-20 16:45:03.000', NULL);
INSERT INTO `cms_log` VALUES (315, 'ceshi修改听力练习内容', 8, 'ceshi', 201, 'PUT', '/v1/listen/12', '修改听力练习内容', '2021-04-20 16:45:25.000', '2021-04-20 16:45:25.000', NULL);
INSERT INTO `cms_log` VALUES (316, 'ceshi修改听力练习内容', 8, 'ceshi', 201, 'PUT', '/v1/listen/10', '修改听力练习内容', '2021-04-20 16:45:37.000', '2021-04-20 16:45:37.000', NULL);
INSERT INTO `cms_log` VALUES (317, 'ceshi删除听力练习', 8, 'ceshi', 201, 'DELETE', '/v1/listen/12', '删除听力练习', '2021-04-20 16:45:48.000', '2021-04-20 16:45:48.000', NULL);
INSERT INTO `cms_log` VALUES (318, 'ceshi新增文章', 8, 'ceshi', 201, 'POST', '/v1/article', '新增文章', '2021-04-20 16:49:06.000', '2021-04-20 16:49:06.000', NULL);
INSERT INTO `cms_log` VALUES (319, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/39', '修改文章内容', '2021-04-20 16:53:20.000', '2021-04-20 16:53:20.000', NULL);
INSERT INTO `cms_log` VALUES (320, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 16:53:58.000', '2021-04-20 16:53:58.000', NULL);
INSERT INTO `cms_log` VALUES (321, 'ceshi删除单词', 8, 'ceshi', 201, 'DELETE', '/v1/word/24', '删除单词', '2021-04-20 16:54:04.000', '2021-04-20 16:54:04.000', NULL);
INSERT INTO `cms_log` VALUES (322, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 17:01:17.000', '2021-04-20 17:01:17.000', NULL);
INSERT INTO `cms_log` VALUES (323, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 17:04:15.000', '2021-04-20 17:04:15.000', NULL);
INSERT INTO `cms_log` VALUES (324, 'ceshi删除单词', 8, 'ceshi', 201, 'DELETE', '/v1/word/25', '删除单词', '2021-04-20 17:05:38.000', '2021-04-20 17:05:38.000', NULL);
INSERT INTO `cms_log` VALUES (325, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 17:12:54.000', '2021-04-20 17:12:54.000', NULL);
INSERT INTO `cms_log` VALUES (326, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 17:13:06.000', '2021-04-20 17:13:06.000', NULL);
INSERT INTO `cms_log` VALUES (327, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 17:13:14.000', '2021-04-20 17:13:14.000', NULL);
INSERT INTO `cms_log` VALUES (328, 'ceshi修改单词内容', 8, 'ceshi', 200, 'PUT', '/v1/word/undefined', '修改单词内容', '2021-04-20 17:15:41.000', '2021-04-20 17:15:41.000', NULL);
INSERT INTO `cms_log` VALUES (329, 'ceshi修改单词内容', 8, 'ceshi', 200, 'PUT', '/v1/word/17', '修改单词内容', '2021-04-20 17:16:21.000', '2021-04-20 17:16:21.000', NULL);
INSERT INTO `cms_log` VALUES (330, 'ceshi修改单词内容', 8, 'ceshi', 201, 'PUT', '/v1/word/17', '修改单词内容', '2021-04-20 17:16:44.000', '2021-04-20 17:16:44.000', NULL);
INSERT INTO `cms_log` VALUES (331, 'ceshi新增单词', 8, 'ceshi', 201, 'POST', '/v1/word', '新增单词', '2021-04-20 17:17:10.000', '2021-04-20 17:17:10.000', NULL);
INSERT INTO `cms_log` VALUES (332, 'ceshi修改单词内容', 8, 'ceshi', 201, 'PUT', '/v1/word/26', '修改单词内容', '2021-04-20 17:17:21.000', '2021-04-20 17:17:21.000', NULL);
INSERT INTO `cms_log` VALUES (333, 'ceshi修改单词内容', 8, 'ceshi', 201, 'PUT', '/v1/word/26', '修改单词内容', '2021-04-20 17:17:29.000', '2021-04-20 17:17:29.000', NULL);
INSERT INTO `cms_log` VALUES (334, 'ceshi删除单词', 8, 'ceshi', 201, 'DELETE', '/v1/word/26', '删除单词', '2021-04-20 17:17:34.000', '2021-04-20 17:17:34.000', NULL);
INSERT INTO `cms_log` VALUES (335, 'ceshi修改单词内容', 8, 'ceshi', 201, 'PUT', '/v1/word/13', '修改单词内容', '2021-04-20 17:18:53.000', '2021-04-20 17:18:53.000', NULL);
INSERT INTO `cms_log` VALUES (336, 'ceshi新增分类', 8, 'ceshi', 201, 'POST', '/v1/category', '新增分类', '2021-04-20 18:47:56.000', '2021-04-20 18:47:56.000', NULL);
INSERT INTO `cms_log` VALUES (337, 'ceshi删除分类', 8, 'ceshi', 201, 'DELETE', '/v1/category/14', '删除分类', '2021-04-20 18:48:01.000', '2021-04-20 18:48:01.000', NULL);
INSERT INTO `cms_log` VALUES (338, 'ceshi新增文章', 8, 'ceshi', 201, 'POST', '/v1/article', '新增文章', '2021-04-20 18:50:20.000', '2021-04-20 18:50:20.000', NULL);
INSERT INTO `cms_log` VALUES (339, 'ceshi新增文章', 8, 'ceshi', 201, 'POST', '/v1/article', '新增文章', '2021-04-20 18:51:32.000', '2021-04-20 18:51:32.000', NULL);
INSERT INTO `cms_log` VALUES (340, 'ceshi修改文章内容', 8, 'ceshi', 201, 'PUT', '/v1/article/41', '修改文章内容', '2021-04-20 18:51:48.000', '2021-04-20 18:51:48.000', NULL);
INSERT INTO `cms_log` VALUES (341, 'ceshi新增听力练习', 8, 'ceshi', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-20 19:13:38.000', '2021-04-20 19:13:38.000', NULL);
INSERT INTO `cms_log` VALUES (342, 'ceshi删除听力练习', 8, 'ceshi', 201, 'DELETE', '/v1/listen/13', '删除听力练习', '2021-04-20 19:16:33.000', '2021-04-20 19:16:33.000', NULL);
INSERT INTO `cms_log` VALUES (343, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-20 19:21:10.000', '2021-04-20 19:21:10.000', NULL);
INSERT INTO `cms_log` VALUES (344, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/41', '删除文章', '2021-04-20 20:06:43.000', '2021-04-20 20:06:43.000', NULL);
INSERT INTO `cms_log` VALUES (345, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/39', '删除文章', '2021-04-20 20:06:45.000', '2021-04-20 20:06:45.000', NULL);
INSERT INTO `cms_log` VALUES (346, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/40', '修改文章内容', '2021-04-20 20:06:49.000', '2021-04-20 20:06:49.000', NULL);
INSERT INTO `cms_log` VALUES (347, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/31', '修改文章内容', '2021-04-20 21:07:35.000', '2021-04-20 21:07:35.000', NULL);
INSERT INTO `cms_log` VALUES (348, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/30', '修改文章内容', '2021-04-20 21:09:37.000', '2021-04-20 21:09:37.000', NULL);
INSERT INTO `cms_log` VALUES (349, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/27', '修改文章内容', '2021-04-20 21:12:31.000', '2021-04-20 21:12:31.000', NULL);
INSERT INTO `cms_log` VALUES (350, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/27', '修改文章内容', '2021-04-20 21:12:50.000', '2021-04-20 21:12:50.000', NULL);
INSERT INTO `cms_log` VALUES (351, 'lzl新增听力练习', 3, 'lzl', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-21 10:51:47.000', '2021-04-21 10:51:47.000', NULL);
INSERT INTO `cms_log` VALUES (352, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/14', '修改听力练习内容', '2021-04-21 10:52:50.000', '2021-04-21 10:52:50.000', NULL);
INSERT INTO `cms_log` VALUES (353, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-04-21 12:54:59.000', '2021-04-21 12:54:59.000', NULL);
INSERT INTO `cms_log` VALUES (354, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/7', '修改听力练习内容', '2021-04-21 12:58:16.000', '2021-04-21 12:58:16.000', NULL);
INSERT INTO `cms_log` VALUES (355, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/8', '修改听力练习内容', '2021-04-21 13:01:24.000', '2021-04-21 13:01:24.000', NULL);
INSERT INTO `cms_log` VALUES (356, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/9', '修改听力练习内容', '2021-04-21 13:03:27.000', '2021-04-21 13:03:27.000', NULL);
INSERT INTO `cms_log` VALUES (357, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/9', '修改听力练习内容', '2021-04-21 13:05:32.000', '2021-04-21 13:05:32.000', NULL);
INSERT INTO `cms_log` VALUES (358, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/9', '修改听力练习内容', '2021-04-21 13:06:36.000', '2021-04-21 13:06:36.000', NULL);
INSERT INTO `cms_log` VALUES (359, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/10', '修改听力练习内容', '2021-04-21 13:10:40.000', '2021-04-21 13:10:40.000', NULL);
INSERT INTO `cms_log` VALUES (360, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/7', '修改听力练习内容', '2021-04-21 13:13:08.000', '2021-04-21 13:13:08.000', NULL);
INSERT INTO `cms_log` VALUES (361, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/14', '修改听力练习内容', '2021-04-21 13:13:56.000', '2021-04-21 13:13:56.000', NULL);
INSERT INTO `cms_log` VALUES (362, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/9', '修改听力练习内容', '2021-04-21 13:14:22.000', '2021-04-21 13:14:22.000', NULL);
INSERT INTO `cms_log` VALUES (363, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:38:03.000', '2021-04-21 13:38:03.000', NULL);
INSERT INTO `cms_log` VALUES (364, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:45:11.000', '2021-04-21 13:45:11.000', NULL);
INSERT INTO `cms_log` VALUES (365, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:45:52.000', '2021-04-21 13:45:52.000', NULL);
INSERT INTO `cms_log` VALUES (366, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:47:16.000', '2021-04-21 13:47:16.000', NULL);
INSERT INTO `cms_log` VALUES (367, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:50:09.000', '2021-04-21 13:50:09.000', NULL);
INSERT INTO `cms_log` VALUES (368, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:54:19.000', '2021-04-21 13:54:19.000', NULL);
INSERT INTO `cms_log` VALUES (369, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:55:10.000', '2021-04-21 13:55:10.000', NULL);
INSERT INTO `cms_log` VALUES (370, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:56:06.000', '2021-04-21 13:56:06.000', NULL);
INSERT INTO `cms_log` VALUES (371, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:56:32.000', '2021-04-21 13:56:32.000', NULL);
INSERT INTO `cms_log` VALUES (372, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:56:55.000', '2021-04-21 13:56:55.000', NULL);
INSERT INTO `cms_log` VALUES (373, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:57:27.000', '2021-04-21 13:57:27.000', NULL);
INSERT INTO `cms_log` VALUES (374, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:58:15.000', '2021-04-21 13:58:15.000', NULL);
INSERT INTO `cms_log` VALUES (375, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:58:46.000', '2021-04-21 13:58:46.000', NULL);
INSERT INTO `cms_log` VALUES (376, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word/wordArr', '新增单词', '2021-04-21 13:59:05.000', '2021-04-21 13:59:05.000', NULL);
INSERT INTO `cms_log` VALUES (377, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-04-21 14:23:11.000', '2021-04-21 14:23:11.000', NULL);
INSERT INTO `cms_log` VALUES (378, 'ceshi11修改单词内容', 10, 'ceshi11', 201, 'PUT', '/v1/word/33', '修改单词内容', '2021-04-21 14:23:58.000', '2021-04-21 14:23:58.000', NULL);
INSERT INTO `cms_log` VALUES (379, 'ceshi11修改单词内容', 10, 'ceshi11', 201, 'PUT', '/v1/word/33', '修改单词内容', '2021-04-21 14:24:02.000', '2021-04-21 14:24:02.000', NULL);
INSERT INTO `cms_log` VALUES (380, 'ceshi11新增单词', 10, 'ceshi11', 201, 'POST', '/v1/word', '新增单词', '2021-04-21 14:24:14.000', '2021-04-21 14:24:14.000', NULL);
INSERT INTO `cms_log` VALUES (381, 'ceshi11删除单词', 10, 'ceshi11', 201, 'DELETE', '/v1/word/1036', '删除单词', '2021-04-21 14:24:21.000', '2021-04-21 14:24:21.000', NULL);
INSERT INTO `cms_log` VALUES (382, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-04-21 14:25:22.000', '2021-04-21 14:25:22.000', NULL);
INSERT INTO `cms_log` VALUES (383, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/42', '修改文章内容', '2021-04-21 14:25:50.000', '2021-04-21 14:25:50.000', NULL);
INSERT INTO `cms_log` VALUES (384, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/42', '修改文章内容', '2021-04-21 14:26:02.000', '2021-04-21 14:26:02.000', NULL);
INSERT INTO `cms_log` VALUES (385, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/40', '修改文章内容', '2021-04-21 14:26:23.000', '2021-04-21 14:26:23.000', NULL);
INSERT INTO `cms_log` VALUES (386, 'root修改分类内容', 1, 'root', 201, 'PUT', '/v1/category/11', '修改分类内容', '2021-04-21 14:26:53.000', '2021-04-21 14:26:53.000', NULL);
INSERT INTO `cms_log` VALUES (387, 'root修改分类内容', 1, 'root', 201, 'PUT', '/v1/category/11', '修改分类内容', '2021-04-21 14:26:56.000', '2021-04-21 14:26:56.000', NULL);
INSERT INTO `cms_log` VALUES (388, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-04-21 14:27:00.000', '2021-04-21 14:27:00.000', NULL);
INSERT INTO `cms_log` VALUES (389, 'root删除分类', 1, 'root', 201, 'DELETE', '/v1/category/15', '删除分类', '2021-04-21 14:27:06.000', '2021-04-21 14:27:06.000', NULL);
INSERT INTO `cms_log` VALUES (390, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-04-21 14:27:49.000', '2021-04-21 14:27:49.000', NULL);
INSERT INTO `cms_log` VALUES (391, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/15', '修改听力练习内容', '2021-04-21 14:28:12.000', '2021-04-21 14:28:12.000', NULL);
INSERT INTO `cms_log` VALUES (392, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/15', '修改听力练习内容', '2021-04-21 14:28:33.000', '2021-04-21 14:28:33.000', NULL);
INSERT INTO `cms_log` VALUES (393, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/15', '删除听力练习', '2021-04-21 14:28:41.000', '2021-04-21 14:28:41.000', NULL);
INSERT INTO `cms_log` VALUES (394, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/40', '删除文章', '2021-05-04 14:52:00.000', '2021-05-04 14:52:00.000', NULL);
INSERT INTO `cms_log` VALUES (395, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/42', '删除文章', '2021-05-04 14:52:02.000', '2021-05-04 14:52:02.000', NULL);
INSERT INTO `cms_log` VALUES (396, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/14', '修改听力练习内容', '2021-05-07 17:12:06.000', '2021-05-07 17:12:06.000', NULL);
INSERT INTO `cms_log` VALUES (397, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/10', '修改听力练习内容', '2021-05-07 17:13:30.000', '2021-05-07 17:13:30.000', NULL);
INSERT INTO `cms_log` VALUES (398, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/9', '修改听力练习内容', '2021-05-07 17:13:43.000', '2021-05-07 17:13:43.000', NULL);
INSERT INTO `cms_log` VALUES (399, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/8', '修改听力练习内容', '2021-05-07 17:13:49.000', '2021-05-07 17:13:49.000', NULL);
INSERT INTO `cms_log` VALUES (400, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/7', '修改听力练习内容', '2021-05-07 17:15:36.000', '2021-05-07 17:15:36.000', NULL);
INSERT INTO `cms_log` VALUES (401, 'lzl修改听力练习内容', 3, 'lzl', 201, 'PUT', '/v1/listen/6', '修改听力练习内容', '2021-05-07 17:15:56.000', '2021-05-07 17:15:56.000', NULL);
INSERT INTO `cms_log` VALUES (402, 'root修改单词内容', 1, 'root', 201, 'PUT', '/v1/word/37', '修改单词内容', '2021-05-07 17:44:47.000', '2021-05-07 17:44:47.000', NULL);
INSERT INTO `cms_log` VALUES (403, 'root修改单词内容', 1, 'root', 201, 'PUT', '/v1/word/37', '修改单词内容', '2021-05-07 17:44:51.000', '2021-05-07 17:44:51.000', NULL);
INSERT INTO `cms_log` VALUES (404, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-05-07 17:54:48.000', '2021-05-07 17:54:48.000', NULL);
INSERT INTO `cms_log` VALUES (405, 'root修改单词内容', 1, 'root', 201, 'PUT', '/v1/word/1037', '修改单词内容', '2021-05-07 17:54:56.000', '2021-05-07 17:54:56.000', NULL);
INSERT INTO `cms_log` VALUES (406, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1037', '删除单词', '2021-05-07 17:54:59.000', '2021-05-07 17:54:59.000', NULL);
INSERT INTO `cms_log` VALUES (407, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-05-07 17:55:33.000', '2021-05-07 17:55:33.000', NULL);
INSERT INTO `cms_log` VALUES (408, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/43', '修改文章内容', '2021-05-07 17:55:50.000', '2021-05-07 17:55:50.000', NULL);
INSERT INTO `cms_log` VALUES (409, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-05-07 17:56:05.000', '2021-05-07 17:56:05.000', NULL);
INSERT INTO `cms_log` VALUES (410, 'root修改分类内容', 1, 'root', 201, 'PUT', '/v1/category/16', '修改分类内容', '2021-05-07 17:56:10.000', '2021-05-07 17:56:10.000', NULL);
INSERT INTO `cms_log` VALUES (411, 'root删除分类', 1, 'root', 201, 'DELETE', '/v1/category/16', '删除分类', '2021-05-07 17:56:12.000', '2021-05-07 17:56:12.000', NULL);
INSERT INTO `cms_log` VALUES (412, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-05-07 17:56:41.000', '2021-05-07 17:56:41.000', NULL);
INSERT INTO `cms_log` VALUES (413, 'root修改听力练习内容', 1, 'root', 201, 'PUT', '/v1/listen/16', '修改听力练习内容', '2021-05-07 17:56:47.000', '2021-05-07 17:56:47.000', NULL);
INSERT INTO `cms_log` VALUES (414, 'root删除听力练习', 1, 'root', 201, 'DELETE', '/v1/listen/16', '删除听力练习', '2021-05-07 17:56:51.000', '2021-05-07 17:56:51.000', NULL);
INSERT INTO `cms_log` VALUES (415, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-05-07 17:57:12.000', '2021-05-07 17:57:12.000', NULL);
INSERT INTO `cms_log` VALUES (416, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/18', '修改文章内容', '2021-05-07 17:58:09.000', '2021-05-07 17:58:09.000', NULL);
INSERT INTO `cms_log` VALUES (417, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-05-08 16:08:07.000', '2021-05-08 16:08:07.000', NULL);
INSERT INTO `cms_log` VALUES (418, 'root修改单词内容', 1, 'root', 201, 'PUT', '/v1/word/1038', '修改单词内容', '2021-05-08 16:08:15.000', '2021-05-08 16:08:15.000', NULL);
INSERT INTO `cms_log` VALUES (419, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1038', '删除单词', '2021-05-08 16:08:17.000', '2021-05-08 16:08:17.000', NULL);
INSERT INTO `cms_log` VALUES (420, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-05-08 16:08:40.000', '2021-05-08 16:08:40.000', NULL);
INSERT INTO `cms_log` VALUES (421, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1039', '删除单词', '2021-05-08 16:08:46.000', '2021-05-08 16:08:46.000', NULL);
INSERT INTO `cms_log` VALUES (422, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-05-08 16:10:00.000', '2021-05-08 16:10:00.000', NULL);
INSERT INTO `cms_log` VALUES (423, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1040', '删除单词', '2021-05-08 16:10:15.000', '2021-05-08 16:10:15.000', NULL);
INSERT INTO `cms_log` VALUES (424, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-05-08 16:11:58.000', '2021-05-08 16:11:58.000', NULL);
INSERT INTO `cms_log` VALUES (425, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1041', '删除单词', '2021-05-08 16:12:02.000', '2021-05-08 16:12:02.000', NULL);
INSERT INTO `cms_log` VALUES (426, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-05-08 16:13:47.000', '2021-05-08 16:13:47.000', NULL);
INSERT INTO `cms_log` VALUES (427, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/44', '删除文章', '2021-05-08 16:13:51.000', '2021-05-08 16:13:51.000', NULL);
INSERT INTO `cms_log` VALUES (428, 'root新增单词', 1, 'root', 201, 'POST', '/v1/word', '新增单词', '2021-05-08 16:20:04.000', '2021-05-08 16:20:04.000', NULL);
INSERT INTO `cms_log` VALUES (429, 'root修改单词内容', 1, 'root', 201, 'PUT', '/v1/word/1042', '修改单词内容', '2021-05-08 16:20:10.000', '2021-05-08 16:20:10.000', NULL);
INSERT INTO `cms_log` VALUES (430, 'root删除单词', 1, 'root', 201, 'DELETE', '/v1/word/1042', '删除单词', '2021-05-08 16:20:14.000', '2021-05-08 16:20:14.000', NULL);
INSERT INTO `cms_log` VALUES (431, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2021-05-08 16:20:43.000', '2021-05-08 16:20:43.000', NULL);
INSERT INTO `cms_log` VALUES (432, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:20:49.000', '2021-05-08 16:20:49.000', NULL);
INSERT INTO `cms_log` VALUES (433, 'root新增分类', 1, 'root', 201, 'POST', '/v1/category', '新增分类', '2021-05-08 16:21:01.000', '2021-05-08 16:21:01.000', NULL);
INSERT INTO `cms_log` VALUES (434, 'root新增听力练习', 1, 'root', 201, 'POST', '/v1/listen', '新增听力练习', '2021-05-08 16:21:38.000', '2021-05-08 16:21:38.000', NULL);
INSERT INTO `cms_log` VALUES (435, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-05-08 16:22:31.000', '2021-05-08 16:22:31.000', NULL);
INSERT INTO `cms_log` VALUES (436, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:23:47.000', '2021-05-08 16:23:47.000', NULL);
INSERT INTO `cms_log` VALUES (437, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:27:45.000', '2021-05-08 16:27:45.000', NULL);
INSERT INTO `cms_log` VALUES (438, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/43', '修改文章内容', '2021-05-08 16:27:56.000', '2021-05-08 16:27:56.000', NULL);
INSERT INTO `cms_log` VALUES (439, 'root删除文章', 1, 'root', 201, 'DELETE', '/v1/article/43', '删除文章', '2021-05-08 16:28:17.000', '2021-05-08 16:28:17.000', NULL);
INSERT INTO `cms_log` VALUES (440, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:28:32.000', '2021-05-08 16:28:32.000', NULL);
INSERT INTO `cms_log` VALUES (441, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:29:02.000', '2021-05-08 16:29:02.000', NULL);
INSERT INTO `cms_log` VALUES (442, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:29:17.000', '2021-05-08 16:29:17.000', NULL);
INSERT INTO `cms_log` VALUES (443, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/45', '修改文章内容', '2021-05-08 16:29:31.000', '2021-05-08 16:29:31.000', NULL);
INSERT INTO `cms_log` VALUES (444, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/46', '修改文章内容', '2022-04-05 13:03:32.000', '2022-04-05 13:03:32.000', NULL);
INSERT INTO `cms_log` VALUES (445, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/46', '修改文章内容', '2022-04-05 13:04:34.000', '2022-04-05 13:04:34.000', NULL);
INSERT INTO `cms_log` VALUES (446, 'root新增文章', 1, 'root', 201, 'POST', '/v1/article', '新增文章', '2022-04-05 13:13:01.000', '2022-04-05 13:13:01.000', NULL);
INSERT INTO `cms_log` VALUES (447, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/47', '修改文章内容', '2022-04-05 13:14:55.000', '2022-04-05 13:14:55.000', NULL);
INSERT INTO `cms_log` VALUES (448, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/47', '修改文章内容', '2022-04-05 13:16:42.000', '2022-04-05 13:16:42.000', NULL);
INSERT INTO `cms_log` VALUES (449, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/47', '修改文章内容', '2022-04-05 19:42:29.000', '2022-04-05 19:42:29.000', NULL);
INSERT INTO `cms_log` VALUES (450, 'root修改文章内容', 1, 'root', 201, 'PUT', '/v1/article/47', '修改文章内容', '2022-04-05 19:50:20.000', '2022-04-05 19:50:20.000', NULL);
INSERT INTO `cms_log` VALUES (451, 'lzl新增文章', 3, 'lzl', 201, 'POST', '/v1/article', '新增文章', '2022-04-05 20:11:27.000', '2022-04-05 20:11:27.000', NULL);
INSERT INTO `cms_log` VALUES (452, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2022-04-05 20:12:04.000', '2022-04-05 20:12:04.000', NULL);
INSERT INTO `cms_log` VALUES (453, 'lzl2新增文章', 13, 'lzl2', 201, 'POST', '/v1/article', '新增文章', '2022-04-05 20:14:18.000', '2022-04-05 20:14:18.000', NULL);

-- ----------------------------
-- Table structure for cms_permission
-- ----------------------------
DROP TABLE IF EXISTS `cms_permission`;
CREATE TABLE `cms_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称，例如：访问首页',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限所属模块，例如：人员管理',
  `mount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0：关闭 1：开启',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_permission
-- ----------------------------
INSERT INTO `cms_permission` VALUES (1, '查询所有日志', '日志', 1, '2020-12-22 00:39:26.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (2, '搜索日志', '日志', 1, '2020-12-22 00:39:27.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (3, '查询日志记录的用户', '日志', 1, '2020-12-22 00:39:27.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (4, '测试日志记录', '信息', 0, '2020-12-22 00:39:27.000', '2021-03-27 19:20:26.000', NULL);
INSERT INTO `cms_permission` VALUES (5, '查看lin的信息', '信息', 0, '2020-12-22 00:39:27.000', '2021-03-27 19:20:26.000', NULL);
INSERT INTO `cms_permission` VALUES (6, '删除图书', '图书', 1, '2020-12-22 00:39:27.000', '2021-04-13 20:45:40.986', '2021-04-13 20:45:38.000');
INSERT INTO `cms_permission` VALUES (7, '新增期刊内容', '内容管理', 0, '2021-01-02 11:54:52.000', '2021-03-21 22:10:43.000', NULL);
INSERT INTO `cms_permission` VALUES (8, '修改期刊内容', '内容管理', 0, '2021-01-02 12:01:40.000', '2021-03-21 22:10:43.000', NULL);
INSERT INTO `cms_permission` VALUES (9, '删除期刊内容', '内容管理', 0, '2021-01-02 12:02:24.000', '2021-03-21 22:10:43.000', NULL);
INSERT INTO `cms_permission` VALUES (10, '新增最新期刊', '最新期刊管理', 0, '2021-01-02 15:35:23.000', '2021-03-21 22:10:43.000', NULL);
INSERT INTO `cms_permission` VALUES (11, '编辑最新期刊', '最新期刊管理', 0, '2021-01-03 00:42:01.000', '2021-03-21 22:10:43.000', NULL);
INSERT INTO `cms_permission` VALUES (12, '最新期刊内容删除', '最新期刊管理', 0, '2021-01-03 00:55:04.000', '2021-03-21 22:10:43.000', NULL);
INSERT INTO `cms_permission` VALUES (13, '新增文章', '内容管理', 0, '2021-03-19 23:22:31.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (14, '删除文章', '内容管理', 0, '2021-03-19 23:52:04.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (15, '修改文章内容', '内容管理', 0, '2021-03-19 23:56:58.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (16, '新增分类', '内容管理', 0, '2021-03-21 15:11:51.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (17, '修改分类内容', '内容管理', 0, '2021-03-21 15:11:51.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (18, '删除分类', '内容管理', 0, '2021-03-21 15:11:51.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (19, '新增听力练习', '内容管理', 0, '2021-03-21 23:34:18.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (20, '修改听力练习内容', '内容管理', 0, '2021-03-21 23:34:18.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (21, '删除听力练习', '内容管理', 0, '2021-03-21 23:34:18.000', '2021-03-22 09:41:43.000', NULL);
INSERT INTO `cms_permission` VALUES (22, '新增文章', '文章管理', 1, '2021-03-22 09:41:42.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (23, '修改文章内容', '文章管理', 1, '2021-03-22 09:41:42.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (24, '删除文章', '文章管理', 1, '2021-03-22 09:41:42.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (25, '新增分类', '分类管理', 1, '2021-03-22 09:41:42.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (26, '修改分类内容', '分类管理', 1, '2021-03-22 09:41:43.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (27, '删除分类', '分类管理', 1, '2021-03-22 09:41:43.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (28, '新增听力练习', '听力练习管理', 1, '2021-03-22 09:41:43.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (29, '修改听力练习内容', '听力练习管理', 1, '2021-03-22 09:41:43.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (30, '删除听力练习', '听力练习管理', 1, '2021-03-22 09:41:43.000', '2021-04-13 21:10:53.000', NULL);
INSERT INTO `cms_permission` VALUES (31, '新增评论', '评论管理', 0, '2021-03-26 11:57:25.000', '2021-04-13 20:50:05.346', '2021-04-13 20:50:03.000');
INSERT INTO `cms_permission` VALUES (32, '修改评论内容', '评论管理', 0, '2021-03-26 11:57:25.000', '2021-04-13 20:50:14.061', '2021-04-13 20:50:11.000');
INSERT INTO `cms_permission` VALUES (33, '删除评论', '评论管理', 0, '2021-03-26 11:57:25.000', '2021-04-13 20:50:25.091', '2021-04-13 20:50:17.000');
INSERT INTO `cms_permission` VALUES (34, '新增文章收藏', '文章收藏管理', 0, '2021-03-27 22:35:38.000', '2021-03-27 23:53:45.000', NULL);
INSERT INTO `cms_permission` VALUES (35, '修改文章收藏内容', '文章收藏管理', 0, '2021-03-27 22:35:38.000', '2021-03-27 23:53:31.000', NULL);
INSERT INTO `cms_permission` VALUES (36, '删除文章收藏', '文章收藏管理', 0, '2021-03-27 22:35:38.000', '2021-04-19 19:31:07.000', NULL);
INSERT INTO `cms_permission` VALUES (37, '新增单词', '单词管理', 1, '2021-04-02 20:48:17.000', '2021-04-20 16:37:39.000', NULL);
INSERT INTO `cms_permission` VALUES (38, '修改单词内容', '单词管理', 1, '2021-04-02 20:48:17.000', '2021-04-20 16:37:39.000', NULL);
INSERT INTO `cms_permission` VALUES (39, '删除单词', '单词管理', 1, '2021-04-02 20:48:17.000', '2021-04-20 16:37:39.000', NULL);
INSERT INTO `cms_permission` VALUES (40, '删除图书', '图书', 1, '2021-04-13 20:48:41.000', '2021-04-13 20:52:51.871', '2021-04-13 20:52:49.000');
INSERT INTO `cms_permission` VALUES (41, '查询所有文章', '文章管理', 1, '2021-04-19 19:18:31.000', '2021-04-19 19:18:31.000', NULL);
INSERT INTO `cms_permission` VALUES (42, '查询所有分类', '分类管理', 1, '2021-04-19 19:28:03.000', '2021-04-20 11:16:52.000', NULL);
INSERT INTO `cms_permission` VALUES (43, '查看所有听力', '听力练习管理', 0, '2021-04-19 19:31:07.000', '2021-04-20 16:42:32.259', '2021-04-20 16:42:29.000');
INSERT INTO `cms_permission` VALUES (44, '查看所有听力练习', '听力练习管理', 1, '2021-04-19 19:31:50.000', '2021-04-19 19:31:50.000', NULL);
INSERT INTO `cms_permission` VALUES (45, '查询所有单词', '单词管理', 1, '2021-04-19 19:33:17.000', '2021-04-20 16:37:39.000', NULL);

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_del`(`username`, `delete_time`) USING BTREE,
  UNIQUE INDEX `email_del`(`email`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES (1, 'root', '超级管理员', '1647845960525.jpg', NULL, '2020-12-22 00:35:50.228', '2022-03-28 23:56:35.647', NULL);
INSERT INTO `cms_user` VALUES (2, '小明', NULL, NULL, NULL, '2021-01-02 11:41:14.000', '2021-01-02 11:41:14.000', NULL);
INSERT INTO `cms_user` VALUES (3, 'lzl', '内容管理员', '1618317784758.jpg', 'l13202350062@163.com', '2021-03-22 23:32:06.000', '2022-03-29 00:07:19.443', NULL);
INSERT INTO `cms_user` VALUES (4, 'ceshi', NULL, NULL, '944106568@qq.com', '2021-04-18 18:41:50.000', '2021-04-18 18:48:08.000', '2021-04-18 18:48:08.000');
INSERT INTO `cms_user` VALUES (5, 'ceshi', NULL, NULL, '944106568@qq.com', '2021-04-18 18:48:22.000', '2021-04-18 19:21:38.000', '2021-04-18 19:21:38.000');
INSERT INTO `cms_user` VALUES (6, 'ceshi', NULL, NULL, '944106568@qq.com', '2021-04-18 19:37:11.000', '2021-04-19 14:34:27.000', '2021-04-19 14:34:27.000');
INSERT INTO `cms_user` VALUES (7, 'ceshi', NULL, NULL, '944106568@qq.com', '2021-04-20 11:08:04.000', '2021-04-20 11:19:59.000', '2021-04-20 11:19:59.000');
INSERT INTO `cms_user` VALUES (8, 'ceshi', NULL, '1618917502849.jpeg', '944106568@qq.com', '2021-04-20 11:26:54.000', '2021-04-20 19:38:03.000', '2021-04-20 19:38:03.000');
INSERT INTO `cms_user` VALUES (9, 'ceshi1', 'leeAdmin', '1618918586232.jpeg', '944106569@qq.com', '2021-04-20 19:21:10.000', '2021-04-20 19:38:01.000', '2021-04-20 19:38:01.000');
INSERT INTO `cms_user` VALUES (10, 'ceshi11', NULL, NULL, '944106568@qq.com', '2021-04-21 14:23:11.000', '2021-05-04 14:53:05.000', '2021-05-04 14:53:05.000');
INSERT INTO `cms_user` VALUES (11, 'ceshi', NULL, NULL, '944106568@qq.com', '2021-05-07 17:57:12.000', '2021-05-08 16:22:19.000', '2021-05-08 16:22:19.000');
INSERT INTO `cms_user` VALUES (12, 'ceshi', NULL, NULL, '944106568@qq.com', '2021-05-08 16:22:30.000', '2021-05-08 16:22:30.000', NULL);
INSERT INTO `cms_user` VALUES (13, 'lzl2', '佚名22', NULL, NULL, '2022-04-05 20:12:04.000', '2022-04-05 20:25:23.000', NULL);

-- ----------------------------
-- Table structure for cms_user_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_group`;
CREATE TABLE `cms_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_group_id`(`user_id`, `group_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user_group
-- ----------------------------
INSERT INTO `cms_user_group` VALUES (1, 1, 1);
INSERT INTO `cms_user_group` VALUES (7, 2, 2);
INSERT INTO `cms_user_group` VALUES (16, 3, 4);
INSERT INTO `cms_user_group` VALUES (19, 12, 9);
INSERT INTO `cms_user_group` VALUES (21, 13, 8);

-- ----------------------------
-- Table structure for cms_user_identity
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_identity`;
CREATE TABLE `cms_user_identity`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等）',
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识（手机号 邮箱 用户名或第三方应用的唯一标识）',
  `credential` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码凭证（站内的保存密码，站外的不保存或保存token）',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_user_identity
-- ----------------------------
INSERT INTO `cms_user_identity` VALUES (1, 1, 'USERNAME_PASSWORD', 'root', 'sha1$13e6a034$1$29cee227b5b530e46b7ce547293546de93907e48', '2020-12-22 00:35:50.233', '2021-04-13 19:45:25.000', NULL);
INSERT INTO `cms_user_identity` VALUES (2, 2, 'USERNAME_PASSWORD', '小明', 'sha1$789526c4$1$4f58a9914565c53fc5014dd80252a30574d85bc2', '2021-01-02 11:41:14.000', '2021-01-02 11:41:14.000', NULL);
INSERT INTO `cms_user_identity` VALUES (3, 3, 'USERNAME_PASSWORD', 'lzl', 'sha1$2761d3c9$1$d71f44aaa5595c6f21638c36c50d5a02e9c3a182', '2021-03-22 23:32:07.000', '2022-04-05 20:10:48.000', NULL);
INSERT INTO `cms_user_identity` VALUES (4, 4, 'USERNAME_PASSWORD', 'ceshi', 'sha1$feb9e87d$1$346549cf3b9971200187db1206137ed354d8a33c', '2021-04-18 18:41:50.000', '2021-04-18 18:48:08.345', '2021-04-18 18:48:08.000');
INSERT INTO `cms_user_identity` VALUES (5, 5, 'USERNAME_PASSWORD', 'ceshi', 'sha1$a4200df9$1$ca990fc18c0baed40459cfd219337af44017b83b', '2021-04-18 18:48:22.000', '2021-04-18 19:21:38.447', '2021-04-18 19:21:38.000');
INSERT INTO `cms_user_identity` VALUES (6, 6, 'USERNAME_PASSWORD', 'ceshi', 'sha1$deee7a41$1$32eaaa0d4516f7a55ca429176322db3e7d049a81', '2021-04-18 19:37:11.000', '2021-04-19 14:34:27.297', '2021-04-19 14:34:27.000');
INSERT INTO `cms_user_identity` VALUES (7, 7, 'USERNAME_PASSWORD', 'ceshi', 'sha1$8e2216f7$1$27b9b94525eb83b4093e92e8f42146ab0801a5fd', '2021-04-20 11:08:04.000', '2021-04-20 11:19:59.777', '2021-04-20 11:19:59.000');
INSERT INTO `cms_user_identity` VALUES (8, 8, 'USERNAME_PASSWORD', 'ceshi', 'sha1$5316e4e1$1$dec6d19cf9c6d89e031a4efa2eaa050e591f4f62', '2021-04-20 11:26:54.000', '2021-04-20 19:38:03.359', '2021-04-20 19:38:03.000');
INSERT INTO `cms_user_identity` VALUES (9, 9, 'USERNAME_PASSWORD', 'ceshi1', 'sha1$05ce5467$1$3b296e9f9eadd403c31f6c47ddcd86f0a62571de', '2021-04-20 19:21:10.000', '2021-04-20 19:38:01.941', '2021-04-20 19:38:01.000');
INSERT INTO `cms_user_identity` VALUES (10, 10, 'USERNAME_PASSWORD', 'ceshi11', 'sha1$12fa7e74$1$eb2a8930c53598d59e6a96b95df3787365c73a89', '2021-04-21 14:23:11.000', '2021-05-04 14:53:05.697', '2021-05-04 14:53:05.000');
INSERT INTO `cms_user_identity` VALUES (11, 11, 'USERNAME_PASSWORD', 'ceshi', 'sha1$0037f5cf$1$2f078749a9058f7a1fb3897ed273d9a45f066fa4', '2021-05-07 17:57:12.000', '2021-05-08 16:22:19.166', '2021-05-08 16:22:19.000');
INSERT INTO `cms_user_identity` VALUES (12, 12, 'USERNAME_PASSWORD', 'ceshi', 'sha1$07327c6f$1$cb776fd6d0be1d3c2fead1f458e487e07b9c7df6', '2021-05-08 16:22:30.000', '2021-05-08 16:22:30.000', NULL);
INSERT INTO `cms_user_identity` VALUES (13, 13, 'USERNAME_PASSWORD', 'lzl2', 'sha1$183f0328$1$48dbb55bba57f5ba15943444286cf193cb5e7dc0', '2022-04-05 20:12:04.000', '2022-04-05 20:12:04.000', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `web_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `is_published` tinyint(1) NOT NULL COMMENT '是否公开',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '所属的文章id',
  `parent_comment_id` bigint(20) NULL DEFAULT NULL COMMENT '父评论id，-1为根评论',
  `like_num` bigint(20) NULL DEFAULT NULL COMMENT '评论点赞数量',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, '测试评论', 1, 18, -1, 0, '2021-03-26 11:32:29', '2022-03-28 14:52:22', NULL);
INSERT INTO `comment` VALUES (7, 5, '张同学你好[哈哈]', 1, 18, 1, 0, '2021-03-26 18:18:05', '2021-03-26 18:18:05', NULL);
INSERT INTO `comment` VALUES (8, 5, '测试赛', 1, 18, 26, 0, '2021-03-26 18:27:37', '2021-03-26 18:27:37', NULL);
INSERT INTO `comment` VALUES (31, 10, '屏蔽[微笑]', 1, 18, -1, 0, '2021-04-18 19:39:04', '2021-04-18 19:39:04', NULL);
INSERT INTO `comment` VALUES (30, 8, '学习了很多知识[嘻嘻]', 1, 29, -1, 0, '2021-04-18 18:39:09', '2021-04-18 18:39:09', NULL);
INSERT INTO `comment` VALUES (29, 8, '学到了get√[嘻嘻]', 1, 23, -1, 0, '2021-04-10 21:31:50', '2021-04-10 21:31:50', NULL);
INSERT INTO `comment` VALUES (28, 8, '沙发[嘻嘻]', 1, 23, -1, 0, '2021-04-10 21:31:29', '2021-04-10 21:31:29', NULL);
INSERT INTO `comment` VALUES (27, 8, '测试2222', 1, 18, 26, 0, '2021-03-31 01:02:21', '2021-03-31 01:02:21', NULL);
INSERT INTO `comment` VALUES (26, 8, '123', 1, 18, -1, 0, '2021-03-30 21:10:56', '2021-03-30 21:10:56', NULL);
INSERT INTO `comment` VALUES (25, 8, '你是？[微笑]', 1, 18, -1, 0, '2021-03-30 21:10:44', '2021-03-30 21:10:44', NULL);
INSERT INTO `comment` VALUES (24, 8, '测试评论123', 1, 18, 1, 0, '2021-03-26 11:32:29', '2021-03-26 11:32:32', NULL);
INSERT INTO `comment` VALUES (32, 8, '习惯真的太重要了[嘻嘻]', 1, 29, -1, 0, '2021-04-20 20:08:07', '2021-04-20 20:08:07', NULL);
INSERT INTO `comment` VALUES (33, 8, '不错，很帅！', 1, 32, -1, 0, '2021-04-20 20:10:28', '2022-03-28 23:38:10', NULL);
INSERT INTO `comment` VALUES (34, 8, '习惯真的可以改变生活！[嘻嘻]', 1, 29, -1, 0, '2021-04-20 20:11:05', '2021-04-20 20:11:05', NULL);
INSERT INTO `comment` VALUES (35, 8, '我们不能盲目的传播一些未经过证实的新闻。', 1, 21, -1, 0, '2021-04-20 20:18:00', '2021-04-20 20:18:00', NULL);
INSERT INTO `comment` VALUES (36, 8, '请问小编可以多更新一些慢速英语视频吗[嘻嘻]看上瘾了下饭神奇[哈哈]', 1, 21, -1, 0, '2021-04-20 20:18:43', '2021-04-20 20:18:43', NULL);
INSERT INTO `comment` VALUES (37, 8, '原来大片的英文是blockbuster啊。学到了哈哈哈[鼓掌]', 1, 31, -1, 0, '2021-04-20 21:08:29', '2021-04-20 21:08:29', NULL);
INSERT INTO `comment` VALUES (38, 8, '希望我国的抗疫攻坚战早日成功~[嘻嘻]', 1, 30, -1, 0, '2021-04-20 21:10:09', '2021-04-20 21:10:09', NULL);
INSERT INTO `comment` VALUES (39, 8, '压力越大，动力越大[给力]', 1, 28, -1, 0, '2021-04-20 21:11:48', '2021-04-20 21:11:48', NULL);
INSERT INTO `comment` VALUES (40, 8, '帅气的女足[哈哈]', 1, 27, -1, 0, '2021-04-20 21:13:25', '2021-04-20 21:13:25', NULL);
INSERT INTO `comment` VALUES (41, 8, '测试一下[嘻嘻]', 1, 23, -1, 0, '2021-04-21 14:18:46', '2021-04-21 14:18:46', NULL);
INSERT INTO `comment` VALUES (47, 10, '测试一下[嘻嘻]', 1, 45, -1, 0, '2021-05-08 16:42:18', '2021-05-08 16:42:18', NULL);
INSERT INTO `comment` VALUES (48, 10, '回复123', 1, 18, 8, 0, '2021-05-08 16:42:18', NULL, NULL);
INSERT INTO `comment` VALUES (49, 8, '123', 1, 18, 1, 0, '2022-03-24 16:09:17', '2022-03-24 16:09:17', NULL);
INSERT INTO `comment` VALUES (50, 8, '2222', 1, 18, 8, 0, '2022-03-24 16:10:04', '2022-03-24 16:10:04', NULL);
INSERT INTO `comment` VALUES (51, 8, '哈哈', 1, 18, 8, 0, '2022-03-24 16:10:27', '2022-03-24 16:10:27', NULL);
INSERT INTO `comment` VALUES (52, 8, '5555', 1, 18, 26, 0, '2022-03-24 16:14:29', '2022-03-24 16:14:29', NULL);
INSERT INTO `comment` VALUES (53, 8, '123456', 1, 18, 26, 0, '2022-03-24 16:14:45', '2022-03-24 16:14:45', NULL);
INSERT INTO `comment` VALUES (54, 8, '222111', 1, 18, 1, 0, '2022-03-24 16:14:57', '2022-03-24 16:14:57', NULL);
INSERT INTO `comment` VALUES (55, 8, '测试根评论', 1, 45, -1, 0, '2022-03-24 16:23:30', '2022-03-24 16:23:30', NULL);
INSERT INTO `comment` VALUES (56, 8, '你好', 1, 45, 47, 0, '2022-03-24 16:25:08', '2022-03-24 16:25:08', NULL);
INSERT INTO `comment` VALUES (57, 8, '测试1', 1, 45, 55, 0, '2022-03-24 16:30:50', '2022-03-24 16:30:50', NULL);
INSERT INTO `comment` VALUES (58, 8, '而是2', 1, 45, -1, 0, '2022-03-24 16:31:03', '2022-03-24 16:31:03', NULL);
INSERT INTO `comment` VALUES (59, 8, '测试4', 1, 45, 58, 0, '2022-03-24 16:31:25', '2022-03-24 16:31:25', NULL);
INSERT INTO `comment` VALUES (60, 8, '123', 1, 32, 33, 0, '2022-03-28 23:41:17', '2022-03-28 23:41:36', NULL);
INSERT INTO `comment` VALUES (61, 8, '测试', 1, 46, -1, 1, '2022-03-28 23:41:58', '2022-03-28 23:52:41', NULL);
INSERT INTO `comment` VALUES (62, 8, '测试', 1, 46, 61, 1, '2022-03-28 23:42:01', '2022-03-28 23:52:23', NULL);
INSERT INTO `comment` VALUES (63, 8, '测1', 1, 46, 62, 1, '2022-03-28 23:49:22', '2022-03-28 23:52:22', NULL);
INSERT INTO `comment` VALUES (64, 8, '测试666', 1, 46, 63, 1, '2022-03-28 23:49:42', '2022-03-28 23:52:21', NULL);
INSERT INTO `comment` VALUES (65, 8, '测试99', 1, 46, 64, 1, '2022-03-28 23:51:17', '2022-03-28 23:52:20', NULL);
INSERT INTO `comment` VALUES (66, 8, '测试10', 1, 46, 65, 1, '2022-03-28 23:52:03', '2022-03-28 23:52:20', NULL);
INSERT INTO `comment` VALUES (67, 8, '测试11', 1, 46, 66, 1, '2022-03-28 23:52:15', '2022-03-28 23:52:19', NULL);
INSERT INTO `comment` VALUES (68, 8, '测试', 1, 47, -1, 0, '2022-04-05 19:43:54', '2022-04-05 19:50:26', NULL);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `web_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, 49, 8, '2022-04-06 18:15:03', '2022-04-06 18:15:03', '2022-04-06 20:47:03');
INSERT INTO `history` VALUES (2, 48, 8, '2022-04-06 19:02:37', '2022-04-06 19:02:37', '2022-04-06 20:46:58');
INSERT INTO `history` VALUES (3, 49, 8, '2022-04-06 21:20:01', '2022-04-06 21:20:01', NULL);
INSERT INTO `history` VALUES (4, 48, 8, '2022-04-06 21:20:14', '2022-04-06 21:20:14', NULL);
INSERT INTO `history` VALUES (5, 45, 8, '2022-04-06 21:24:49', '2022-04-06 21:24:49', NULL);

-- ----------------------------
-- Table structure for listening
-- ----------------------------
DROP TABLE IF EXISTS `listening`;
CREATE TABLE `listening`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '听力练习标题',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '听力练习封面',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '听力练习描述',
  `questions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '听力练习问题，及对应答案',
  `is_published` tinyint(1) NOT NULL COMMENT '是否发布',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '听力mp3的url',
  `categoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `answer_analysis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '答案解释',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listening
-- ----------------------------
INSERT INTO `listening` VALUES (6, 'CET-4 2019-12 第1套', NULL, '大学英语2019年12月听力第一套题', '[{\"title\":\"What happened in New York\'s Prospect Park on Tuesday?\",\"op1\":\"Many facilities were destroyed by a wandering cow.\",\"op2\":\"A wandering cow knocked down one of its fences.\",\"op3\":\"Some tourists were injured by a wandering cow.\",\"op4\":\"A wandering cow was captured by the police.\",\"answer\":\"D\"},{\"title\":\"What do we learn about the cow from the end of the news report?\",\"op1\":\"It was shot to death by a police officer.\",\"op2\":\"It found its way back to the park\'s zoo.\",\"op3\":\"It became a great attraction for tourists.\",\"op4\":\"It was sent to the animal control department. \",\"answer\":\"D\"},{\"title\":\"What does the news report say about the fossil hall of the National Museum of Natural History?\",\"op1\":\"It is the largest of its kind.\",\"op2\":\"It is going to be expanded. \",\"op3\":\"It is displaying more fossil specimens.\",\"op4\":\"It is starting an online exhibition.\",\"answer\":\"B\"},{\"title\":\"What is on display this week in the museum\'s resident exhibition hall?\",\"op1\":\"A collection of bird fossils from Australia.\",\"op2\":\"Photographs of certain rare fossil exhibits.\",\"op3\":\"Some ancient wall paintings from Australia. \",\"op4\":\"Pictures by winners of a wildlife photo contest.\",\"answer\":\"C\"},{\"title\":\"What have six birds been trained to do at a French historical theme park?\",\"op1\":\"Pick up trash. \",\"op2\":\"Amuse visitors.\",\"op3\":\"Deliver messages.\",\"op4\":\"Play with children.\",\"answer\":\"A\"},{\"title\":\"Why were rooks chosen by the park manager?\",\"op1\":\"They are especially intelligent. \",\"op2\":\"They are children\'s favorite.\",\"op3\":\"They are quite easy to tame.\",\"op4\":\"They are clean and pretty.\",\"answer\":\"A\"},{\"title\":\"What is the concern of some parents?\",\"op1\":\"Children may be harmed by the rooks.\",\"op2\":\"Children may be tempted to drop litter. \",\"op3\":\"Children may contract bird diseases.\",\"op4\":\"Children may overfeed the rooks.\",\"answer\":\"B\"},{\"title\":\"What do we learn about the TV show Science Nation?\",\"op1\":\"It will be produced at Harvard University.\",\"op2\":\"It will be hosted by famous professors.\",\"op3\":\"It will cover different areas of science. \",\"op4\":\"It will focus on recent scientific discoveries.\",\"answer\":\"C\"},{\"title\":\"In what way will the TV show Science Nation differ from traditional documentaries?\",\"op1\":\"It will be more futuristic.\",\"op2\":\"It will be more systematic.\",\"op3\":\"It will be more entertaining.\",\"op4\":\"It will be easier to understand.\",\"answer\":\"C\"},{\"title\":\"Who will be the intended audience of the TV show Science Nation?\",\"op1\":\"People interested in science.  \",\"op2\":\"Youngsters eager to explore.\",\"op3\":\"Children in their early teens.\",\"op4\":\"Students majoring in science.\",\"answer\":\"A\"},{\"title\":\"What does the woman want the man to do for the TV show?\",\"op1\":\"Offer professional advice.\",\"op2\":\"Provide financial support.  \",\"op3\":\"Help promote it on the Internet.\",\"op4\":\"Make episodes for its first season.\",\"answer\":\"B\"}]', 1, '2021-04-04 19:00:26', '2021-05-07 17:15:55', NULL, '1617533983172.mp3', 4, '<p>[1] New York City police captured a cow on the loose in Prospect Park on Tuesday after the animal became an attraction for tourists while walking along the streets and enjoying the park facilities. The confused creature and camera-holding humans stared at each other through a fence for several minutes. At other times the cow wandered around the 526-acre park and the artificial grass field normally used for human sporting events. Officers used soccer goals to fence the animal in. However, the cow then moved through one of the nets, knocking down a police officer in the process. Police eventually trapped the cow between two vehicles parked on either side of a baseball field\'s bench area. An officer then shot an arrow to put it to sleep. Then officers waited for the drug to take effect. After it fell asleep they loaded the cow into a horse trailer. It was not clear where the cow came from or how it got lost. [2] Police turned it over to the animal control department after they caught it.</p>\n<p>[1] 周二，纽约警方在展望公园捕获了一头四处游荡的母牛，这头母牛在沿街散步和享受公园设施的过程中吸引了大量游客。这一茫然不知所措的生物和拿着相机拍照的人类隔着栅栏互相凝视了几分钟。其他时间，这头母牛在这家占地526英亩的公园里四处游荡，在通常用于举行体育赛事的人造草地上徘徊。警察们用足球门将母牛围了起来。然而，母牛随后穿过了其中一张网，期间撞倒了一名警察。警方最终将这头母牛困在了停在棒球场板凳区两边的两辆车之间。然后，一名警察射出一支麻醉箭使母牛入睡。随后，警察静等药物生效。待母牛睡着之后，他们把母牛抬上了运马拖车。目前尚不清楚母牛来自何处以及它是怎么迷路的。[2] 警察在抓到它后将其移交给了动物管理部门。</p>\n<p>&nbsp;</p>\n<p>[3] Starting April 28 of this year, the National Museum of Natural History will begin renovating its fossil hall. The fossil hall, which displays some of the world\'s oldest and largest fossil specimens, receives more than 2 million visitors each year. It\'s one of the museum\'s most famous attractions. As a result, the museum plans to expand the hall, as well as add to its ancient birds collection. Bird lovers, both young and old, have already responded with excitement at the news. The museum\'s social media account has been flooded with messages of support. In the meantime, the current collection will be closed. However, visitors will be compensated during the closure. Museum\'s special exhibition area will now be free of charge. [4] This week, the resident exhibition is a display of ancient wall paintings on loan from Australia. They celebrate the cultural heritage of the country and will be available to view until Sunday. Next week, the exhibition will be taken over by the Wildlife Photographer of the Year Competition. The winner of this year\'s competition will be awarded a preview of the new fossil hall, as well as a cash prize.</p>\n<p>[3]从今年4月28日起，国家自然历史博物馆将开始翻新其化石馆。化石馆陈列着世界上最古老、最大的一些化石标本，每年接待200多万名游客。它是博物馆最著名的景点之一。因此，博物馆计划扩建化石馆，并增加其古代鸟类收藏。鸟类爱好者们，无论老少，都已经对这个消息感到兴奋不已。该博物馆的社交媒体账户上充斥着支持的信息。同时，当前的收藏展示将会关闭。但是，参观者将在关展期间得到补偿。博物馆的特别展区现在将免费开放。[4] 本周的驻地展是一场从澳大利亚借来的古代壁画展。古代壁画颂扬他们国家的文化遗产，该展览将一直开放至周日。下周，本展览将由年度野生动物摄影师大赛展取代。今年大赛的获胜者将获得新化石馆的预览以及现金奖励。</p>\n<p>&nbsp;</p>\n<p>[5] Six birds have just been trained to pick up rubbish at a French historical theme park. According to the park\'s manager, Mr. Villiers, the goal is not just to clear up the park. He says visitors are already good at keeping things clean. Instead, he wants to show that nature itself can teach us to take care of the environment. [6] He says that rooks, the chosen birds, are considered to be particularly intelligent. In the right circumstances, they even like to communicate with humans and establish a relationship through play. The birds will be encouraged to clean the park through the use of a small box that delivers a small amount of bird food. Each time, the rook deposits a cigarette end or a small piece of rubbish. So far, visitors to the theme park have been excited to see the birds in action. [7] However, some parents are concerned that it encourages their children to drop litter so they can watch the birds to pick it up. Villiers is not concerned about this criticism. He maintains most of the feedback he has received has been overwhelmingly positive. He hopes now to train more birds.</p>\n<p>[5] 法国一家历史主题公园刚训练了六只捡垃圾的鸟。公园经理维利尔斯先生说，目标不仅仅是清理公园。他说，游客们在保持卫生方面已经做得很好了。相反，他想证明自然本身可以教我们保护环境。[6] 他表示，白嘴鸦，就是那些被选中的鸟，被认为是特别聪明的。在适当的情况下，它们甚至喜欢与人类交流，并通过做游戏的方式和人类建立关系。人们使用一个含有少量鸟食的小盒子来激励这些鸟清理公园。白嘴鸦每次都会把烟头或一小块垃圾放进盒子里。到目前为止，主题公园的参观者看到这些鸟在清理公园时都很兴奋。[7] 然而，一些家长担心这样会怂恿他们的孩子乱扔垃圾，这样他们就可以看到鸟儿捡垃圾了。维利尔斯并不担心这种批评。他坚持认为，他收到的大多数反馈都非常积极。他希望现在能训练更多的鸟。</p>\n<p>&nbsp;</p>\n<p>W: [8]The name of the TV show we wish to produce is Science Nation.<br />M: Please tell us more. What will Science Nation be about?<br />W: It\'ll be about science, all sorts of science. Each episode will focus on a different area of science, and tell us what we know, how we know it, and what we still don\'t know. The show will have one host only, and this will be Professor Susan Paul from Harvard University. She\'s a great public speaker.<br />M: So, just to be clear, will the show\'s format be like that of a documentary?<br />W: Kind of. It\'ll be like a documentary in the sense that it\'ll be non-fiction and fact-based. [9] However, our idea is for it to be also fun and entertaining, something which traditional documentaries aren\'t so much. Please keep in mind this will be a new TV show, like nothing ever done before.<br />M: [10] Okay, so it\'ll be both educational and entertaining, and your audience will be anyone interested in science, right?<br />W: That\'s correct, yes.<br />M: Right, thank you. So, I think we\'re more or less clear what the show will be like. Could you please tell us now, what exactly you want from us?<br />W: [11] Yes, of course. Basically, what we need from you is financial support. In order to go ahead with this idea, we need 2 million dollars. This will cover the cost of making all 12 shows in the first season for the first year. If the show is a success, we can then look at making a second season for the following year.</p>\n<p>女：[8]我们想要制作的电视节目名叫《科学国度》。<br />男：请多介绍一下。《科学国度》将呈现什么内容？<br />女：节目内容与科学有关，涉及各种科学知识。每期节目将侧重科学的一个不同领域，并讲述关于我们已知的，如何得知的以及我们仍然不知道的科学知识。该节目将只有一位主持人，就是哈佛大学的苏珊&middot;保罗教授。她是一位出色的公众演说家。<br />男：那么，我想明确一下，节目的形式会像纪录片那样吗？<br />女：有点儿像。从它不是虚构的且基于事实这个意义上而言，它确实像纪录片。[9]但是，我们的想法是让节目既有趣又有娱乐性，这是传统的纪录片所没有的。请记住，这将是一个全新的电视节目，以往的电视节目中没有类似的。<br />男：[10]好的，所以，你的节目既具有教育意义又具有娱乐性，你的观众是所有对科学感兴趣的人，对吗？<br />女：对的，是这样。<br />男：好的，谢谢。那么，我想大家或多或少了解了这个节目。你现在能告诉我们你到底想从我们这里得到什么吗？<br />女：[11]是的，当然。我们主要是需要你们的资金支持。为了推进这个想法，我们需要200万美元的资金。这笔资金会用来支付第一年第一季全部12期节目的制作费用。如果节目成功，我们可以考虑在第二年制作第二季。</p>\n<p>&nbsp;</p>\n<p>W: What\'s up with you? You don\'t look very happy.<br />M: [12] I feel like I\'m a failure. I can\'t seem to do anything very well.<br />W: I wouldn\'t say that. You do very well in a lot of things. That presentation you gave last week was excellent.<br />M: [13] Yes, but I have this urge to strive for perfection. [12]I really want to push harder and progress further.<br />W: Well, that\'s very admirable. But be careful. Over concern with being perfect can damage our confidence if we never achieve it.<br />M: Yes, I know. [12]I feel awful whenever I make a mistake in whatever I\'m trying to do.<br />W: Well, think about it. You can\'t make progress without making mistakes and learning from them. Thomas Edison, the famous inventor, once said, &ldquo;I\'ve not failed. I\'ve just found 10,000 ways that won\'t work.&rdquo;<br />M: You may well be right. I guess I should recognize my mistakes and learn the lessons they teach me and move forward.<br />W: Also, remember a successful ending is not the only thing worthy of a celebration. You need to recognize each step of progress you take towards achieving your goals. And no matter how tiny it is, it\'s still good news.<br />M: [14]I always feel down when I see others accomplishing things and I feel miserable about my own achievements. I\'m always trying to be as good as others, but I never seem to get there.<br />W: Listen. If you always compare yourself with others, you\'ll never feel good enough. [15]You\'re the only person you should be comparing yourself with. When you compare your current status with the starting point, you\'ll find you\'ve made progress, right? That\'s good enough.<br />M: That\'s great advice. Thank you. I\'m feeling better already.</p>\n<p>女：你怎么了？你看起来不太开心。<br />男：[12]我觉得我是个失败者。我似乎什么事情都做不好。<br />女：我可不这么觉得。你在很多方面都做得很好。上周你的演讲非常出色。<br />男：[13]是的，但是我有追求完美的渴求。[12]我真的很想更加努力，取得更大的进步。<br />女：嗯，这非常令人钦佩。不过还是要小心一些。如果我们永远无法实现完美，那么过分在意是否完美就可能有损我们的自信心。<br />男：是的，我知道。[12]每当我在尽力做的事情中犯错时，我都觉得糟透了。<br />女：嗯，想想吧。如果从不犯错，不从错误中吸取教训，你就无法取得进步。著名发明家托马斯&middot;爱迪生曾说：&ldquo;我从来没有失败过。我只是发现了一万种行不通的方法。&rdquo;<br />男：你可能是对的。我想我应该认识到自己的错误，并从中吸取教训，然后继续前进。<br />女：另外，记住一个成功的结局并不是唯一值得庆祝的事情。你需要认识到你为实现目标所取得的每一步进展。而且不管实现的目标有多小，都依然是个好消息。<br />男：[14]当我看到别人取得成功时，我总是感到沮丧，对自己的成就感到痛苦。我一直想和别人一样优秀，但我似乎永远都无法做到。<br />女：听着。如果你总是将自己与别人进行比较，那么你永远不会觉得自己优秀。[15]你唯一应该比较的人是你自己。当你把你现在的状态和起点比较一下，你就会发现你已经取得了进步，对吧？这就够了！<br />男：这真是个好建议。谢谢你。我已经感觉好多了。</p>\n<p>&nbsp;</p>\n<p>Single-sex education can have enormous benefits for female students. Numerous studies have shown that women who attend single-sex schools tend to have stronger self-confidence, better study habits and more ambitious career goals than women who attend coeducational schools. [16] Girls who graduate from single-sex schools are three times more likely to become engineers than those who attend coeducational schools. The reason is that all-girls schools encourage women to enter fields traditionally dominated by men, such as science, technology and engineering. In coeducational schools, girls are often expected to succeed only in the humanities or the arts. [17] Research has also shown that in coeducational settings, teachers are more likely to praise and give in-depth responses to a boy\'s comments in class. In contrast, they might only respond to a girl\'s comments with a nod. They are also more likely to encourage boys to work through problems on their own, while they tend to step in and help girls who struggle with a problem.<br />In an all-girls setting, girls are more likely to speak up frequently and make significant contributions to class than in a coeducational setting. Girls studying in a single-sex setting also earn higher scores on their College Board and Advanced Placement exams than girls who study in coeducational settings. [18]All girls schools tend to be smaller than coeducational schools, which means teachers will be able to tailor the materials to girl students\' personal learning styles and interest.</p>\n<p>对于女学生而言，单一性别教育有很多好处。大量研究表明，与男女同校就读的女生相比，就读于单一性别学校的女生往往更自信、拥有更好的学习习惯和更远大的职业目标。[16] 从单一性别学校毕业的女生成为工程师的可能性是从男女同校学校毕业的女生的三倍。其原因在于女子学校鼓励女生进入传统上由男生主导的领域，如科学、技术和工程领域。在男女同校的学校里，女生往往被期望仅在人文学科或艺术方面取得成功。[17]研究还表明，在男女同校环境中，老师们在课堂上更喜欢表扬男生，并对男生的评论给予深入的回应。相比之下，对于女生的评论，他们可能只会点点头以作回应。他们也更可能鼓励男生自己解决问题，但往往会介入并帮助那些遇到问题的女生。<br />与在男女同校的环境中相比，在全是女生的环境中女生更有可能频繁大胆地表达自己的观点，并对班级作出重要贡献。在单性别环境中学习的女生在大学理事会和大学预修课程中的考试分数也比在男女同校环境中学习的女生高。[18]所有的女子学校往往都比男女同校的学校小，这意味着老师们可以根据女生的个人学习风格和兴趣因材施教。</p>\n<p>&nbsp;</p>\n<p>[19]Today I found out that Seattle doesn\'t really get that much rain compared with most U.S. cities. In fact, Seattle ranks 44th among major U.S. cities in average annual rainfall. Cities that get more rainfall than Seattle include Huston, Memphis, Nashville, and pretty much every major city on the eastern coast, such as New York, Boston, and Miami. So, why does everyone think of Seattle as a rainy city? The primary root of this misconception lies in that Seattle has a relatively large number of days per year with rainfall compared with New York and Boston, which get an average of about 16% more rain per year than Seattle, but also average between them about 36 fewer days a year of rainfall. So it rains a lot less in Seattle. [20]And the rain is spread out over more days than those cities. This is why few locals in Seattle carry an umbrella generally. When it does rain, it tends to be a very light rain that isn\'t troublesome. It almost never really rains as most people think. On top of that, it never really storms in Seattle, either. Seattle gets an average of a mere 7 days a year with thunder. [21]So in short, if you like sunny but not too hot summers, mild winters but with lots of cloudy days, Seattle\'s the place to be. Anyway, if you visit Seattle, don\'t bring an umbrella. People will look at you, thinking you are funny.</p>\n<p>[19]今天我发现和大多数美国城市相比，西雅图并没有那么多雨。事实上，西雅图的年平均降雨量在美国主要城市中排第44位。降雨量超过西雅图的城市包括休斯顿、孟菲斯、纳什维尔，以及东部沿海区几乎所有的主要城市，比如纽约、波士顿和迈阿密。那么，为什么每个人都认为西雅图是一个多雨的城市呢？这种误解的主要根源在于，与纽约和波士顿相比，西雅图每年的降雨天数相对较多，纽约和波士顿的年平均降雨量比西雅图多大约16%，但平均每年降雨天数却比西雅图少大概36天。因此，西雅图降雨更少。[20]而且西雅图雨水蔓延的天数比那些城市多。这就是为什么在西雅图一般很少有当地人带着伞。西雅图真正下雨的时候，往往下的都是细雨，不会造成麻烦。西雅图几乎从没像大家所认为的那样下过雨。除此之外，西雅图也从未下过真正意义上的暴风雨。西雅图每年平均只有7天会打雷。[21]简言之，如果你喜欢晴朗但不太热的夏天，温和但多云的冬天，西雅图就是你的好去处。不管怎样，如果你去西雅图，就不要带伞。不然人们会看着你，觉得你很奇怪。</p>\n<p>&nbsp;</p>\n<p>After tough workout or a day full of physical activity, it\'s common to find your muscles aching, but where do these pains come from? [22]According to a German professor, the soreness comes from straining your muscles in an uncommon way, for example, jumping on a bicycle for a ride, because you haven\'t ridden in a long time. Soreness occurs since your leg muscles aren\'t used to that movement. When muscles perform an activity they aren\'t regularly exposed to, the tiny fibers that are inside them are being torn apart. As muscle soreness develops, the body has to work to repair the muscle tears, but this doesn\'t happen immediately. First, the body must realize the muscles are damaged. [23]When the body realizes the muscles are hurt, the response is to increase blood flow to the area and increase body heat. Damaged cells are then cleaned up and the body sends cells specially designed to break down the large muscle fiber fragments. Healing can take place after this. It takes about a day until these cells make it to your aching muscles. That\'s why there is most often a delay associated with muscle soreness. [24] Repair of damaged cells takes about two days, and afterwards the soreness disappears. [25]Unfortunately, there is little that can be done to relieve muscle soreness. Pain relieving creams don\'t work, but a hot shower, or warm bath can provide some relief.</p>\n<p>在剧烈运动或一整天的体力活动之后，通常你会发现自己肌肉酸痛，但是这些疼痛从何而来呢？[22]据一位德国教授称，这种酸痛源于以一种不寻常的方式拉伸肌肉，比如，骑自行车，因为你已经很久没有骑过了。因为你的腿部肌肉不习惯这种动作，所以会感到酸痛。当肌肉进行一项不经常接触的活动时，它们内部的微小纤维就会被撕裂。随着肌肉酸痛的发展，身体必须努力修复肌肉纤维的撕裂，但这种情况不会立即发生。首先，身体必须意识到肌肉受到了损伤。[23]当身体意识到肌肉受伤时，其反应是增加该部位的血流量和身体的热量。然后，受损细胞被清理干净，身体会输送专门用来分解大块肌肉纤维碎片的细胞。在此之后，开始愈合。这些细胞到达你酸痛的肌肉部位大概需要一天的时间。这就是为什么肌肉酸痛通常会持续一段时间。[24]受损细胞大概需要两天时间修复，随后酸痛才会消失。[25]遗憾的是，几乎没有什么方法可以减轻肌肉酸痛。缓解疼痛的药膏不起作用，但冲个热水澡或泡个热水澡可以起到一些缓解作用。</p>\n<p>&nbsp;</p>');
INSERT INTO `listening` VALUES (7, 'CET-4 2019-12 第2套', NULL, '大学英语2019年12月听力第二套题', '[{\"title\":\"What problem is Britain facing?\",\"op1\":\"The number of male nurses has gone down.\",\"op2\":\"There is discrimination against male nurses.\",\"op3\":\"There is a growing shortage of medical personnel.\",\"op4\":\"The number of nurses has dropped to a record low.\",\"answer\":\"A\"},{\"title\":\"What is the cause of the problem according to the UK Health Secretary?\",\"op1\":\"Working conditions.\",\"op2\":\"Educational system.\",\"op3\":\"Inadequate pay.\",\"op4\":\"Cultural bias.  \",\"answer\":\"D\"},{\"title\":\"What does the news reports say about the Libyan man?\",\"op1\":\"He fell out of a lifeboat.\",\"op2\":\"He was almost drowned.  \",\"op3\":\"He lost his way on a beach.\",\"op4\":\"He enjoyed swimming in the sea.\",\"answer\":\"B\"},{\"title\":\"What did Keith Porter say at an interview?\",\"op1\":\"The lifeboats patrol the area round the clock.\",\"op2\":\"The beach is a good place to watch the tide.\",\"op3\":\"The emergency services are efficient.  \",\"op4\":\"The beach is a popular tourist resort.\",\"answer\":\"C\"},{\"title\":\"What does the news report say about the raccoon, a small cat-like animal?\",\"op1\":\"It climbed 25 storeys at one go.\",\"op2\":\"It broke into an office room.\",\"op3\":\"It escaped from a local zoo.\",\"op4\":\"It became an online star.  \",\"answer\":\"D\"},{\"title\":\"What will the wildlife management company do with the captured raccoon?\",\"op1\":\"Release it into the wild.  \",\"op2\":\"Return it to its owner.\",\"op3\":\"Send it back to the zoo.\",\"op4\":\"Give it a physical checkup.\",\"answer\":\"A\"},{\"title\":\"What did one online post say?\",\"op1\":\"A raccoon can perform acts no human can.\",\"op2\":\"A raccoon can climb much higher than a cat.\",\"op3\":\"The raccoon did something no politician could.  \",\"op4\":\"The raccoon became as famous as some politicians.\",\"answer\":\"C\"},{\"title\":\"Why is the man making the phone call?\",\"op1\":\"To confirm an urgent appointment.\",\"op2\":\"To collect a package from the woman.\",\"op3\":\"To ask the woman to sign a document.\",\"op4\":\"To arrange the delivery of a package. \",\"answer\":\"D\"},{\"title\":\"Why can’t the woman meet the man today?\",\"op1\":\"She is doing shopping.\",\"op2\":\"She is visiting a friend.\",\"op3\":\"She is not at home. \",\"op4\":\"She is not feeling well.\",\"answer\":\"C\"},{\"title\":\"Why is the man unable to see the woman tomorrow?\",\"op1\":\"He will be off duty the whole day.\",\"op2\":\"He will be working somewhere else. \",\"op3\":\"He will have to have his car repaired.\",\"op4\":\"He will be too busy to spare any time.\",\"answer\":\"B\"},{\"title\":\"What should the woman do to receive her purchase?\",\"op1\":\"Sign her name. \",\"op2\":\"Confirm online. \",\"op3\":\"Pay a small fee.\",\"op4\":\"Show up in person.\",\"answer\":\"A\"}]', 1, '2021-04-04 19:45:51', '2021-05-07 17:15:36', NULL, '1617536749758.mp3', 4, '<div class=\"col-md-7 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<div class=\"col-md-7 englishtop\">&nbsp;</div>\n<div class=\"col-md-5 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<p>The British government has called for more men to consider a career in nursing. [1] Figures show the number of male nurses has fallen in the last three years. Now, the number of men working in the nursing sector has reached a seven-year low. Numbers of male nurses increased between 2011 and 2014, and reached a peak of 7168. This figure has dropped to only 6924 in 2017.<br />[2] The UK Health Secretary said this is clearly a cultural problem, and probably one that exists in many parts of the world. But we can make efforts to change that now. We want to persuade males to think about career options of going into nursing. There is absolutely no reason why men can\'t go into this profession. The Health Secretary said that the government already has plans to attract a more varied workforce into nursing. She stated, &ldquo;we are leading the way on workforce planning. We will become the first nation in Europe to publish a national health and care workforce plan.&rdquo;</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>英国政府呼吁更多的男性考虑从事护理工作。[1] 数据显示，在过去三年里男护士的人数有所下降。现在，从事护理行业的男性人数已降至七年以来的最低水平。 2011年至2014年间，男护士人数有所增加，达到7168人的高峰水平。2017年，这一数字降至仅6924人。<br />[2] 英国卫生部长表示，这显然是一个文化问题，这个问题可能世界上许多地方都存在。但是我们现在可以努力改变这种状况。我们想说服男性考虑选择护理这个职业。完全没有理由说男性不能从事该职业。卫生部长表示，政府已经拟定计划来吸引更多样化的劳动力从事护理行业。她称：&ldquo;我们在劳动力规划方面处于领先地位。我们将成为欧洲第一个发布国家医疗保健劳动力计划的国家。&rdquo;</p>\n</div>\n<p>&nbsp;</p>\n</div>\n<p>[3] A man from Libya was enjoying a walk along the sands at Southport beach. When he was about half a mile out from the dock, he felt a bit tired. So he lay down and fell asleep, but the tide swept in quickly at the beach. And the man was shocked to wake up and find the tide had come in and completely surrounded him, cutting him off from the shore. Fortunately for him, the beach lifeguards were quickly on the scene to stop him from drowning. They acted professionally to ensure the man was comfortable until an ambulance arrived. He was then taken to hospital. He is now in a stable condition. [4] When interviewed, Keith Porter of the Southport beach said, &ldquo;our beach is so flat that it\'s very common for the tide to come around the back of people and cut them off from the beach. Thankfully the emergency services have again worked well together to ensure a positive outcome and we wish the gentleman a speedy recovery. &rdquo;</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[3] 一名来自利比亚的男子在绍斯波特海滩的沙滩上散步。从码头走了约半英里后，他感到有些累。于是他躺下睡着了，但浪潮迅速席卷了海滩。男子惊醒之后，发现浪潮已经涌过来并完全包围了他，将他和海岸分离开来。他很幸运，海滩救生员迅速赶到事发地，以防止他溺水身亡。在救护车到来之前，他们采取了专业的行动，确保该男子处于舒适的状态。随后，该男子被送往医院。他现在的情况很稳定。[4] 绍斯波特海滩的基思&middot;波特在接受采访时说：&ldquo;我们的海滩太平坦了，潮水从人们背后涌来，将他们跟海滩分离开来，这是很常见的事情。值得庆幸的是，紧急救援部门再次通力协作，确保没有意外发生，我们希望这位先生早日康复。&rdquo;</p>\n<p>&nbsp;</p>\n</div>\n</div>\n<div class=\"col-md-5 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<p>[5] A raccoon, a small cat-like animal climbed to the top of a 25-storey skyscraper early on Wednesday. It was captured after becoming an online star across the world.<br />At a little before 3:00 am, the animal made it to the roof of the building after it took a long break on a 17th floor window edge. At the top of the building, animal control officers put cat food in traps and captured the raccoon. [6] A private wildlife management company will release the animal into the wild.<br />The raccoon\'s upward journey began on Monday. The brown animal was spotted stuck on a narrow window edge of the office tower. On Tuesday, the raccoon slowly climbed the building. It reached the 23rd floor, and its legend continued to grow on social media with every floor it climbed. As it went up, people gathered on the sidewalk below to take photos and cheer for its safety. Online office workers posted photos and videos of the raccoon, resting on window edges and climbing up the building\'s concrete exterior. [7] One online post said that the raccoon has succeeded in uniting the country the way no politician could.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[5] 一只浣熊，一种长得像猫的小动物，于周三凌晨爬到25层高的摩天大楼的顶部。它在成为全球网络明星之后被捕获。<br />那只浣熊在17层的窗边休息了很久，之后，快到凌晨三点时它便爬到了楼顶。在楼顶，动物管理人员将猫食放在捕捉器中，然后捕获了浣熊。[6] 一家私营野生动物管理公司将把浣熊放生到野外。<br />浣熊从周一开始向上爬行。有人发现，这只棕色的浣熊被卡在办公楼狭窄的窗户边上。周二，浣熊慢慢爬上了大楼。它爬到了23楼。每爬一层楼，它的传奇故事就会在社交媒体上持续发酵。在它爬行的过程中，人们聚集在下面的人行道上拍照，并为它的安全欢呼喝彩。网络办公人员把浣熊在窗边休息然后沿着大楼的混凝土外墙攀爬的照片和视频公布到了网上。[7] 网上有一篇帖子说，浣熊以政客们无法做到的方式成功地让整个国家团结起来。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>W: [8] I have really amazing news. I just got a text message from my bank, saying my salary has been deposited in my account.<br />M: Getting paid is good. But I don\'t understand why you\'re so excited. It happens every month.<br />W: Well, I\'ve been working for a few years. In fact, I worked all through university, but I only had part-time jobs then. [8]So this is the first time I\'ve ever been paid for a month of full-time work.<br />M: Wow, then you must feel great. [9]I mean, it\'s been two decades, but I can still remember when I got my first real salary. I was happy for days. And I felt like it was a small fortune, even though it wasn\'t.<br />W: Yeah. I\'ve never earned so much money before. And there\'re so many things I\'d like to do with it. What did you do with your first pay?<br />M: [10] I bought a new suit for work and took my parents to a nice restaurant to celebrate. Maybe you could do the same.<br />W: I have enough professional clothes. And my parents are across the country, so seeing them is impossible. But some people from the office are members of a gym I want to join. And my university classmates are arranging a trip to visit our old campus, and I\'d love to go with them, but I can\'t afford both.<br />M: [11] If I were you, I\'d join the gym because it\'s a good way to stay healthy, and it might help you build a stronger relationship with your colleagues. And good relationships are key to a successful career.<br />W: [11] Hmm. You\'re right. Thanks for the advice. I\'m taking it.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>女：[8] 我有个激动人心的好消息。我刚从银行收到一条短信，显示我的工资已经到账了。<br />男：发薪水当然很好了。但是我不明白你为什么这么兴奋。每个月都会发啊。<br />女：嗯，我已经工作了几年了。实际上，在整个大学期间我都在工作，但那时我只做兼职工作。[8]因此，这是我第一次拿一个月的全职工资。<br />男：哇，那你一定感觉棒极了。[9]我是说，虽然已经过去二十年了，但我仍然记得，当我拿到第一笔真正意义上的薪水时，我开心了好几天。我觉得那是一笔小小的财富，虽然实际上并没有多少钱。<br />女：是的。我以前从未赚过这么多钱。我想用这笔钱做很多事。你的第一笔薪水是怎么处置的？<br />男：[10]我买了一套工作时穿的新西装，并带我的父母去了一家不错的餐厅庆祝。也许你也可以这么做。<br />女：我的职业套装已经够多的了，而且我父母离我也特别远，所以，和他们相见是不可能的。但是办公室里有些同事是一家健身房的会员，我也想去这家健身房健身。另外，我的大学同学正在组织去参观我们之前的大学校园，我也很想和他们一起去，但是同时参加这两个活动我负担不起。<br />男：[11] 如果我是你，我会去健身房，因为这是保持健康的好方法，还可能有助于你与同事建立更牢固的关系。良好的人际关系是事业成功的关键。<br />女：[11] 嗯。你是对的。谢谢你的建议。我会采纳它的。</p>\n<div class=\"col-md-7 englishtop\">\n<p>W: What\'s going on with you lately? You seem so distracted. Like you aren\'t really listening to anything I say.<br />M: I know. I\'m sorry. [12]I can\'t seem to focus on anything, because I still haven\'t decided if I should accept the offer for that PhD program in London, or if I should take the job offer in New York.<br />W: Look, it\'s a tough decision, but you\'re running out of time, aren\'t you? I thought you said the company expected an answer by the end of the month.<br />M: Actually, it\'s the beginning of next month for the job, but the university needs a decision by the end of the week. So I have to act quickly.<br />W: [13]You definitely need advice for the important decision like this. So who have you talked to about it? What does your family think? And your advisor for your Master\'s program?<br />M: I\'ve asked their advice and that\'s part of the problem. [14]My parents want me to get the degree, but my advisor thinks it\'s time for me to get more work experience.<br />W: What do you mean by part of the problem? Oh, wait, it\'s your girlfriend, isn\'t it? You\'ve been dating since your first year of university, so that\'s six years now. She must have an opinion about all this. I mean isn\'t it time for you to think about getting married?<br />M: [15]Well, I do want to get married, but she thinks we need to wait until we\'ve launched our careers. Plus, she\'s not sure what she\'ll be doing next year. She\'s considering a job in England and one in Australia. And her parents are pushing for the latter.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>女：你最近怎么了？看上去有些心不在焉。好像你根本没在听我说话。<br />男：我知道。对不起。[12]我似乎对什么事都不能集中注意力，因为我还没有决定是应该接受伦敦的博士学位的录取，还是应该接受纽约的工作邀请。<br />女：听我说，这是一个艰难的决定，但你已经没有多少时间了，不是吗？我想你说过公司希望在本月底前得到答复呢。<br />男：实际上，需要下个月初答复，但是大学那边需要我在本周末之前做好决定，所以我必须迅速做决定。<br />女：[13]像这样重要的决定，你一定要听取一下他人的建议。你都和谁谈过这件事呢？你家人是什么想法？你的硕导是什么建议呢？<br />男：我咨询了他们的建议，但这就是问题的一部分。[14]我的父母希望我获得学位，但是我的导师认为我是时候获取更多的工作经验了。<br />女：问题的一部分是什么意思？哦，等等，是说你女朋友，对吗？从大一开始，你们就一直在谈恋爱，到现在已经六年了。她肯定对这件事有自己的想法。我的意思是，你们是不是该考虑结婚了？<br />男：[15]嗯，我确实想结婚，但她认为我们需要等到开始自己的职业生涯后再结婚。另外，她不确定明年要做什么。她正在考虑到英格兰工作还是到澳大利亚工作。她的父母正催她去澳大利亚工作呢。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>[16] Analytical skills are our ability to understand and solve problems using information we have available. These skills are extremely important for our professional, social, and intellectual lives. What are the best ways to improve them? One way is to expand your worldview. Unfortunately, this takes time. Ultimately, it will help you better evaluate information and analyze different ideas and outcomes. Travelling is a great way to expand your worldview, although it can be expensive.<br />[17] An entertaining way of enhancing your analytical skills is to engage them by playing &ldquo;brain games&rdquo;. These are games that challenge you to think deeply and to develop your analytical skills. These games will get you used to thinking in a certain way. As a result, they will help improve your ability to think. However, opinions vary on whether video games are effective. The general consensus is that the best ones avoid mindless violence, and instead, focus on strategy and challenge us to solve problems and achieve broad goals.<br />[18] Joining a debate or reading club or group is also a good idea. This provides people with the opportunity to come together and discuss ideas, literature and problems. Groups like these will help you refine your analytical skills and enable you to express yourself better. Any social group that encourages free exchange of ideas and pursuit of knowledge is beneficial. It helps you to actively develop your analytical skills.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[16]分析技能是我们利用现有的信息去理解和解决问题的能力。这些技能对我们的职业、社交和精神生活都是极其重要的。提高分析技能的最好方法有哪些呢? 其中一种方法是拓宽你的世界观。遗憾的是，这需要花费时间。最终，它将帮助你更好地评估信息，以及更好地分析不同的想法和结果。旅行也是拓宽视野的一种极好的方法，尽管它可能会很贵。<br />[17]提高分析技能的一种有趣的方法是通过玩&ldquo;益智游戏&rdquo;参与其中。这些游戏挑战你深入思考的能力，培养你的分析技能。这些游戏会让你习惯以某种方式去思考。因此，它们将有助于提高你的思考能力。然而，对于电子游戏是否有效，众说纷纭。普遍的共识是，最好的游戏是避免盲目的暴力，而专注于策略，并且考验我们解决问题和实现广泛的目标的能力。<br />[18] 参加辩论、加入读书俱乐部或阅读小组也是个好主意。这给人们提供了一个聚在一起讨论想法、文学和问题的机会。这样的小组有助于你完善分析技能，让你更好地表达自己。任何鼓励自由交流观点和追求知识的社会团体都是有益的。它有助于你积极地发展你的分析技能。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>There\'s an endless amount of scientific data proving that dogs can develop strong bonds with their owners. People aren\'t kidding when they say they &ldquo;love&rdquo; their dog or their dog &ldquo;loves&rdquo; them. [19] But we\'re rather ignorant about the nature of the relationships that form between dogs.<br />In an effort to understand the matter further, I spoke with Dr. Marc Bekoff, a researcher and former professor of animal behavior. [20] The doctor\'s response to the question of whether or not dogs can fall in love like humans do was a straight &ldquo;of course!&rdquo; He went on to say that if love is defined as a long-term commitment&mdash;meaning dogs seek one another out when they\'re apart, they\'re happy when they\'re reunited, they protect one another, they feed one another, they raise their children together&mdash;[20]then, of course, dogs love each other.<br />Now our furry friends don\'t really experience &ldquo;romantic&rdquo; love, like in the movies, but they can form deep and lasting bonds with their fellow dogs as well as humans. [21] In fact, evidence shows that most dogs stay with one partner their whole lives. In actuality, love between dogs can be even more intimate than human relationships. When they interact, they aren\'t afraid to smell each other and will express themselves clearly and honestly. Once again, it seems we have a lot to learn from dogs.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>有无数的科学数据证明：狗可以和它们的主人建立起牢固的关系。当人们说他们&ldquo;爱&rdquo;他们的狗或者他们的狗&ldquo;爱&rdquo;他们的时候，这些人不是在开玩笑。[19]但是，我们对狗和狗之间关系的本质却知之甚少。<br />为了进一步了解这个问题，我采访了马克&middot;贝科夫博士，他是一名动物行为研究人员和前动物行为学教授。[20]当被问及狗狗是否能和人类一样坠入爱河时，博士直接回答：&ldquo;当然!&rdquo;他接着说，如果爱被定义为一种长期的承诺&mdash;&mdash;这意味着狗狗们在分开的时候会互相寻找，团聚的时候会很开心，它们互相保护，互相喂食，一起抚养它们的幼崽&mdash;&mdash; [20]那么狗狗们当然就是彼此相爱的。<br />现在，我们的毛茸茸的朋友们并不像电影里演的那样真正去经历&ldquo;浪漫的&rdquo;爱情，但它们可以和它们的同伴以及人类建立深厚而持久的关系。[21]事实上，有证据表明，大多数狗终生都和一个伴侣在一起。实际上，狗和狗之间的爱甚至比人和人之间的关系还要亲密。当它们互动的时候，它们不会害怕去闻对方的味道，并且它们会清晰而真诚地表达自己。我再说一次，似乎有很多东西需要我们向狗狗们学习。</p>\n<div class=\"col-md-7 englishtop\">\n<p>A piece of history has been found thanks to a boy tripping on a rare, 1.2-million-year-old animal fossil. In November 2016, Jude Sparks, now 10, was on an outing with his family near their New Mexico home, [22] when he tripped over what he thought was a cow bone.<br />[23] Now, researchers at New Mexico State University are preserving this discovery, which was identified as an ancient elephant-like animal.<br />Kyle Sparks, father of Jude, said he let his son decide what to do with the fossil. So Jude reached out to Peter Houde, a professor at New Mexico State University, who had experience with the same type of fossil in the past.<br />The next day, Houde came out to see the fossil for himself. [24] Houde told ABC News that he was quite excited about the find. &ldquo;It was fortunate that the family didn\'t try to dig up the fossil because that could destroy the specimen. They did the right thing by calling someone who would know what to do. It\'s great for the community, because now everybody can appreciate it,&rdquo; he added.<br />Houde and his fellow faculty members dug up the fossil in late May. [25] They hope to return to the site with geologists for an additional search as there could be more fossils near the site. Jude and his family had been invited by the researchers to see the fossil being preserved at the university.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>一个男孩在一块120万年的罕见动物化石上绊倒，由此揭开了一段历史。2016年11月，现年10岁的裘德&middot;斯帕克斯和他的家人在新墨西哥州的家附近游玩，[22]突然，他被他当时认为是一块牛骨头的东西绊倒了。<br />[23]现在，新墨西哥州立大学的研究人员正在保护这一发现，他们认定那是一种类似大象的古代动物。<br />裘德的父亲凯尔&middot;斯帕克斯说，他让儿子自己来决定如何处理这块化石。于是裘德联系了新墨西哥州立大学的教授彼得&middot;霍德，他曾经接触过同一类型的化石。<br />第二天，霍德亲自来看这块化石。[24] 霍德告诉美国广播公司，他对这一发现感到非常兴奋。&ldquo;幸运的是，这家人没有试图挖出这块化石，因为那样会破坏这一标本。他们给一个知道该怎么做的人打电话，这种做法是正确的。这对社区来说很好，因为现在每个人都能欣赏它。&rdquo;他补充道。<br />霍德和他的同事们在五月底挖出了这块化石。[25]他们希望和地质学家一起回到现场做进一步的搜寻，因为在现场附近可能会有更多的化石。裘德和他的家人应研究人员之邀，到大学里参观了这块保存完好的化石。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>W: Hi, Emma speaking, who&rsquo;s this?<br />M: Hi, Emma. I&rsquo;m Paul from Hermes Delivery Service. [8]Here&rsquo;s a package for you. Are you at home to collect it?<br />W: Oh, sorry, Paul. I am out at the moment. Can you put it in my mailbox?<br />M: I am afraid I can&rsquo;t do that. Sorry. The package is too big and it needs a signature to confirm you have received it. So I would need to deliver it at the time when you&rsquo;re in.<br />W: [9]Okay, well, I&rsquo;m out all day today. But I should be in tomorrow morning before I go out for lunch. And then I&rsquo;ll be at home again late in the afternoon. Will either of those times be convenient for you?<br />M: They are not, unfortunately. I&rsquo;m sorry. [10]I won&rsquo;t be in the area tomorrow, as I have some other deliveries to make on the other side of the town. I could come the day after, if that suits you.<br />W: Okay, yes, that should be fine. I have a friend coming round in the afternoon, but I&rsquo;ll be at home, so the day after tomorrow will be great. Do I need to pay for the package?<br />M: No, you don&rsquo;t. It says here that you paid for it when you ordered it online.<br />W: Oh, yes, I did. I got mixed up.<br />M: [11]So you just need to sign the form to say you&rsquo;ve received it.<br />W: Okay, great. See you the day after tomorrow then.<br />M: Yes, see you then.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>女：嗨，我是爱玛，您是哪位？<br />男：嗨，爱玛，我是来自爱马仕快递服务公司的保罗。[8]我这里有您的一个包裹。您现在能在家收货吗？<br />女：哦，对不起，保罗，我现在不在家。你能把它放在我的信箱里吗？<br />男：恐怕我放不了，很抱歉。包裹太大了，而且还需要您签名确认您已收到包裹。所以我需要您在家的时候给您递送包裹。<br />女：[9]好的，我今天一整天都在外面。但是明天上午出门吃午饭之前我都应该在家。然后我会在下午晚些时候回家。在这两个时间段你方便送包裹吗？<br />男：很遗憾，都不行。不好意思。[10]我明天不在这个区域，因为我在城市另一边还有其他一些包裹需要递送。如果您方便，我可以后天来。<br />女：好的，可以，后天应该没问题。后天下午我有一个朋友过来，但我会待在家里，所以后天是个不错的时间。我需要付包裹的钱吗？<br />男：不，不需要。包裹上面写着您在网上下单的时候已经付过钱了。<br />女：哦，是的，我付过钱了。我弄混了。<br />男：[11]所以您只需要在表格上签名，表示收到货了。<br />女：好的，太好了。那后天见。<br />男：好的，到时候见。</p>\n<p>&nbsp;</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>');
INSERT INTO `listening` VALUES (8, 'CET-6 2019-12 第1套', NULL, '大学英语2019年12月六级听力第一套题', '[{\"title\":\"What do we learn about the woman’s store?\",\"op1\":\"It focuses exclusively on jazz. \",\"op2\":\"It sponsors major jazz concerts.\",\"op3\":\"It has several branches in London.\",\"op4\":\"It displays albums by new music talents.\",\"answer\":\"A\"},{\"title\":\"What does the man say about Jazz music?\",\"op1\":\"It originated with cowboys.\",\"op2\":\"Its market has now shrunk.  \",\"op3\":\"Its listeners are mostly young people.\",\"op4\":\"It remains as widespread as hip hop music.\",\"answer\":\"B\"},{\"title\":\"What does the woman say about Jazz?\",\"op1\":\"Its definition is varied and complicated.  \",\"op2\":\"It is still going through experimentation.\",\"op3\":\"It is frequently accompanied by singing.\",\"op4\":\"Its style has remained largely unchanged.\",\"answer\":\"A\"},{\"title\":\"What should you do to appreciate different styles of Jazz according to the woman?\",\"op1\":\"Learn to play them.\",\"op2\":\"Take music lessons.\",\"op3\":\"Listen to them yourself.  \",\"op4\":\"Consult jazz musicians.\",\"answer\":\"C\"},{\"title\":\"What did the woman do this morning?\",\"op1\":\"She paid her mortgage.\",\"op2\":\"She called on the man.\",\"op3\":\"She made a business plan.\",\"op4\":\"She went to the bank. \",\"answer\":\"D\"}]', 1, '2021-04-04 19:51:33', '2021-04-21 13:01:24', NULL, '1617537091552.mp3', 8, '<div class=\"col-md-7 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<p>M: [5] How did it go at the bank this morning?<br />W: Not well. My proposal was rejected.<br />M: Really? But why?<br />W: [6] Bunch of reasons. For starters, they said my credit history was not good enough.<br />M: Do they say how you could improve that?<br />W: Yes. They said that after five more years of paying my mortgage, then I would become a more viable candidate for a business loan. But right now it\'s too risky for them to lend me money. They fear I will default on any business loan I\'m given.<br />M: Well, that doesn\'t sound fair. Your business idea is amazing. Did you show them your business plan? What did they say?<br />W: They didn\'t really articulate any position regarding the actual business plan. They simply looked at my credit history and determined it was not good enough. They said the bank has strict guidelines and requirements as to who they can lend money to. And I simply don\'t meet their financial threshold.<br />M: What if you asked for a smaller amount? [8] Maybe you could gather capital from other sources. Smaller loans from more lenders?<br />W: You don\'t get it. It doesn\'t matter the size of the loan I ask for, or the type of business I propose. That\'s all inconsequential. The first thing every bank will do is study how much money I have and how much debt I have before they decide whether or not to lend me any more money. [7] If I want to continue ahead with this dream of owning my own business, I have no other choice but to build up my own finances. I need around 20% more in personal savings and 50% less debt. That\'s all there is to it.<br />M: I see now. Well, it\'s a huge pity that they rejected your request, but don\'t lose hope. I still think that your idea is great and that you would turn it into a phenomenal success.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>男：[5]今天上午去银行，事情进展如何？<br />女：不太好。我的申请被驳回了。<br />男：真的吗？但是为什么呢？<br />女：[6]有很多原因。首先，他们说我的信用记录不够好。<br />男：他们说你该如何改进了吗？<br />女：说了。他们说，在我还完五年的抵押贷款之后，才更可能有资格申请商业贷款。但是如果现在贷款给我，对他们来说风险太大了。他们担心我会无法偿还发放给我的商业贷款。<br />男：嗯，那听起来很不公平。你的创业想法令人赞叹。你给他们看你的商业计划书了吗？他们是怎么说的？<br />女：对于实际的商业计划，他们没有明确表达任何立场。他们只是看了看我的信用记录，认为我的信用记录不够好。他们表示，对于向谁放贷，银行有严格的准则和要求。而我连他们财务指标的初级要求都未满足。<br />男：如果你申请贷更少数额的钱呢？[8]也许你可以从其他渠道筹集资金。比如从更多的贷款机构那里获得小额贷款？<br />女：你没明白问题所在。这与我申请的贷款金额大小或提交的商业类型无关。这些都无关紧要。在他们决定是否放贷给我之前，每家银行首先要做的就是审查我有多少存款以及有多少债务。[7]如果我想继续实现自己创业的这个梦想，我别无选择，只能积累资产。我需要在个人储蓄账户上再存大约20%的存款，且债务要减少50%。这样就符合申请贷款的要求了。<br />男：我现在明白了。嗯，非常遗憾他们拒绝了你的请求，但不要失去希望。我仍然认为你的想法很棒，你能让它转化为巨大的成功。</p>\n</div>\n<p>M: Excuse me. Where\'s your rock music section?<br />W: Rock music? I\'m sorry, [1] we\'re a Jazz store. We don\'t have any rock and roll.<br />M: Oh, you only have Jazz music? Nothing else?<br />W: That\'s right. We\'re the only record store in London dedicated exclusively to Jazz. Actually, we\'re more than just a record store. We have a cafe and library upstairs and a ticket office down the hall where you can buy tickets to all the major Jazz concerts in the city. Also, we have our own studio next door, where we produce albums for up-and-coming artists. We are committed to fostering new music talent.<br />M: Wow! That\'s so cool. [2] I guess there\'s not much of a Jazz scene anymore, not like they used to be. But here you\'re trying to promote this great music genre.<br />W: Yes, indeed. Nowadays most people like to listen to pop and rock music. Hip hop music from America is also getting more and more popular. [3] So, as a result, there are fewer listeners of Jazz, which is a great shame because it\'s an incredibly rich genre. But that\'s not to say there isn\'t any good new Jazz music being made out there anymore, far from it. [2] It\'s just a much smaller market today.<br />M: So how would you define Jazz?<br />W: Well, interestingly enough, [3] there\'s no agreed-upon definition of Jazz. Indeed, there are many different styles of Jazz. Some have singing, but most don\'t. Some are electric and some aren\'t. Some contain live experimentation, but not always. While there\'s no simple definition for it, and while there are many different styles of Jazz, you simply know it when you hear it. [4] Honestly, the only way to know what Jazz is, is listen to it yourself. As a great trumpet player, Louis Armstrong said, &ldquo;if you gotta ask, you\'ll never know.&rdquo;</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>男：打扰一下。你们的摇滚乐（唱片）售卖区在哪？<br />女：摇滚乐？不好意思，[1]我们是一家爵士乐唱片店。我们店里没有摇滚乐唱片。<br />男：哦，你们这只有爵士乐唱片吗？没有其他的音乐唱片吗？<br />女：是的。我们是伦敦唯一一家爵士乐唱片专卖店。实际上，我们不仅仅是一家唱片店。我们楼上有咖啡馆和图书馆，而且在下面的大厅里有售票处，在那里你可以买到市里所有大型爵士音乐会的门票。另外，隔壁还有我们自己的工作室，我们在那里为有前途的艺术家们制作专辑。我们致力于培养新的音乐人才。<br />男：哇！这太酷了。[2]我想现在爵士乐的圈子已经不大了，不像它们过去那样。但你们还在努力推广这一重要的音乐流派。<br />女：是的，的确是这样。现在，大多数人喜欢听流行乐和摇滚乐。来自美国的嘻哈音乐也越来越受欢迎。[3]所以，结果就是，听爵士乐的人更少了，这真是太遗憾了，因为爵士乐是内容极其丰富的音乐流派。但这并不是说现在已经没有好的新爵士乐被创作出来，事实远非如此。[2]只是它现在的市场要小得多。<br />男：那么你会如何定义爵士乐？<br />女：嗯，足够有趣的是，[3]关于爵士乐，尚无大众一致认可的定义。事实上，爵士乐有很多不同的风格。有些伴随着歌唱，但大多数没有。有些有电音，有些则没有。有些包含现场实验，但也并非总是如此。虽然爵士乐没有简单的定义，并且尽管爵士乐有很多不同的风格，当你听到它的时候，就知道它是爵士乐。[4]说真的，鉴赏爵士乐的唯一方法就是亲自去听。正如伟大的小号手路易斯&middot;阿姆斯特朗所说：&ldquo;如果你只是问，你将永远不会知道。&rdquo;</p>\n<p>&nbsp;</p>\n</div>');
INSERT INTO `listening` VALUES (9, 'CET-6 2019-12 第2套', NULL, '大学英语2019年12月六级听力第二套题', '[{\"title\":\"What is the woman’s profession?\",\"op1\":\"Magazine reporter.\",\"op2\":\"Fashion designer.\",\"op3\":\"Website designer.\",\"op4\":\"Features editor. \",\"answer\":\"D\"},{\"title\":\"What is one of the woman’s main responsibilities?\",\"op1\":\"Designing sports clothing.\",\"op2\":\"Consulting fashion experts.\",\"op3\":\"Answering daily emails.  \",\"op4\":\"Interviewing job-seekers.\",\"answer\":\"C\"},{\"title\":\"What do many people think about the woman’s job?\",\"op1\":\"It is challenging.\",\"op2\":\"It is fascinatin\",\"op3\":\"It is tiresome.\",\"op4\":\"It is fashionable.\",\"answer\":\"B\"},{\"title\":\"What helped the woman to get her current position?\",\"op1\":\"Her persistence.  \",\"op2\":\"Her experience.\",\"op3\":\"Her competence.\",\"op4\":\"Her confidence.\",\"answer\":\"A\"},{\"title\":\"What does the man think of the satire Frankie he recently watched?\",\"op1\":\"It is enjoyable. \",\"op2\":\"It is educational.\",\"op3\":\"It is divorced from real life. \",\"op4\":\"It is adapted from a drama.\",\"answer\":\"A\"},{\"title\":\"What does the man say is special about the satire Frankie?\",\"op1\":\"All the roles are played by famous actors and actresses.\",\"op2\":\"It is based on the real-life experiences of some celebrities.\",\"op3\":\"Its plots and events reveal a lot about Frankie’s actual life.\",\"op4\":\"It is written, directed, edited and produced by Frankie himself.  \",\"answer\":\"D\"},{\"title\":\"What does the woman say she is going to do with the satire Frankie?\",\"op1\":\"Go to the theater and enjoy it.\",\"op2\":\"Recommend it to her friends.\",\"op3\":\"Watch it with the man.\",\"op4\":\"Download and watch it.  \",\"answer\":\"D\"},{\"title\":\"What does the woman say about the comedy The Big Bang Theory?\",\"op1\":\"It has drawn criticisms from scientists.\",\"op2\":\"It has been showing for over a decade.  \",\"op3\":\"It is a ridiculous piece of satire.\",\"op4\":\"It is against common sense.\",\"answer\":\"B\"},{\"title\":\"What does the speaker say about players of contact sports?\",\"op1\":\"They are likely to get hurt when moving too fast.\",\"op2\":\"They believe in team spirit.\",\"op3\":\"They need to keep moving to avoid getting hurt.  \",\"op4\":\"They have to learn how to avoid body contact.\",\"answer\":\"C\"},{\"title\":\"What do longevity statistics reveal about the average person?\",\"op1\":\"They do not have many years to live after retirement. \",\"op2\":\"They tend to live longer with early retirement.\",\"op3\":\"They do not start enjoying life until full retirement.\",\"op4\":\"They keep themselves busy even after retirement.\",\"answer\":\"A\"}]', 1, '2021-04-04 19:53:08', '2021-05-07 17:13:43', NULL, '1617537158490.mp3', 8, '<div class=\"col-md-7 englishtop\">\n<p>M: Today our guest is Rosie Melinda, [1] who works as a features editor for a fashion magazine. Hi, Rosie. You\'re a features editor at one of the most widely-read women\'s magazines in the UK. What kind of responsibilities does that job entail?<br />W: We spend our days looking at ideas from journalists, writing copy for the magazine and website and editing. We do random things like asking people in the street questions and testing sports clothing. We also do less tangible things like understanding what our readers want. It\'s certainly varied and sometimes bizarre.<br />M: During your working day what kind of work might you typically do?<br />W: [2] My day mainly incorporates responding to emails, writing and editing stories and coming up with new feature ideas.<br />M: How does the job of features editor differ from that of fashion editor or other editorial positions?<br />W: The features team deals with articles such as careers, reports, confidence and confessions, everything except fashion and beauty.<br />M: [3] A lot of people believe that working at a magazine is a glamorous job. Is this an accurate representation of what you do?<br />W: I\'d say it\'s glamorous to an extent, but not in the way it\'s portrayed in films. We do have our moments such as interviewing celebrities and attending parties, which is a huge thrill. Ultimately though, we\'re the same as our readers, but working in a job we\'re all very lucky to have.<br />M: Did you have to overcome any difficulties to reach this point in your career? How did you manage to do this?<br />W: [4] I had to be really persistent and it was very hard work. After three years of working in a petrol station and doing unpaid work I still hadn\'t managed to get an entry level job. I was lucky that my last desperate attempt led to a job. I told myself that all experiences make you a better journalist in the long run and luckily, I was right.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>男：今天我们的嘉宾是罗西&middot;梅琳达，[1] 她是一家时尚杂志的专题编辑。你好，罗西。作为英国发行量最大的女性杂志之一的专题编辑，你做这份工作需要承担什么样的职责?<br />女：我们每天都在研究记者的想法，为杂志和网站撰写稿件，并进行编辑。我们会随机做一些事情，比如询问街上的行人一些问题，或者测试运动服装。我们也会做一些不那么明显的事情，比如了解读者的需求。需求当然是多种多样的，有时甚至很离奇。<br />男：在你的工作时间里，你通常做什么工作?<br />女：[2]我一天的工作主要是回复邮件，撰写和编辑故事，想一些新的专题构想。<br />男：专题编辑的工作与时尚编辑或其他编辑职位有什么不同呢?<br />女：我们这个专题团队负责处理职业、报告、信心和一些自白类的文章。几乎是除了时尚和美丽之外的所有类的文章。<br />男：[3]很多人认为杂志社的工作是一份富有魅力的工作。这是对你工作的准确描述吗?<br />女：我想说它在某种程度上是迷人的，但并不像电影里描绘的那样。我们确实有这样的时刻，比如采访名人和参加派对，这是令人兴奋的经历。但是最终，我们和我们的读者是一样的，不过拥有这份工作我们都觉得很幸运。<br />男：在你的职业生涯中，你必须克服一切困难才能达到目前这个阶段吗? 你是怎么做到的?<br />女：[4]我必须非常执着，这是一份非常辛苦的工作。我在加油站工作了三年，又做了一些没有报酬的工作之后，还是没有找到一份入门级的工作。我很幸运，最后一次孤注一掷的尝试终于找到了工作。我告诉自己，从长远来看，所有的经历都会让你成为一名更好的新闻工作者。幸运的是，我是对的。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>W: Are you watching any good shows these days?<br />M: Actually, yes. [5] I\'m watching a great satire called Frankie. I think you\'d like it.<br />W: Really? What\'s it about?<br />M: It\'s about a real guy named Frankie. He is a famous comedian in New York and the show is a mixture of comedy and drama loosely depicting his life.<br />W: I\'m sorry. Do you mean to say, it\'s a real-life series about a real person? It\'s non-fiction, is it?<br />M: No&hellip; Not really, no. It\'s fiction, as what happens in every episode is made up. However, the lead role is a comedian by the name of Frankie, and he plays himself. So Frankie in both real life and in the TV show lives in New York City, is a comic, is divorced, and has two little daughters. All those things are true, but aside from him, all his friends and family are played by actors. And the plots and the events that take place are also invented.<br />W: Oh, I think I see now. That sounds like a very original concept.<br />M: Yes, it is. In fact, [6] the whole show is written, directed, edited and produced by him, and [5] is very funny and has won many awards.<br />W: That\'s cool. [7] I will try to download it. I\'m watching a comedy called The Big Bang Theory. It\'s a huge hit around the world.<br />M: Oh, yes. I\'ve heard of it, but never actually watched it.<br />W: Well, then you should check it out. It\'s also very funny. It\'s about four male scientists and a female waitress. The men are very socially awkward but very bright. And this is contrasted by the lady\'s social skills and common sense. [8] The show has been running for over ten years, and some of the actors are practically global superstars. Now that they are such famous celebrities.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>女：这些天你在看什么好节目吗?<br />男：事实上，是的。[5]我正在看一部超棒的讽刺剧，名叫《弗兰基》。我想你会喜欢的。<br />女：真的吗? 它是关于什么的?<br />男：是关于一个现实中名叫弗兰基的男人的。他是纽约一位著名的喜剧演员，这部剧是喜剧和戏剧的结合体，大致描绘了他的生活。<br />女：抱歉，你的意思是说，这是一部关于真人的真实系列剧吗? 它是非小说类的纪实片，对吧?<br />男：不，不，也不完全是。它是虚构的，因为每一集发生的事情都是虚构的。但是，主角是一位名叫弗兰基的喜剧演员，他就扮演他自己。所以呢，弗兰基在现实生活中和电视节目中都住在纽约，是一位喜剧演员，离过婚，有两个年纪尚小的女儿。所有这些事情都是真的，但除了他，他所有的朋友和家人都是由演员扮演的。所有的情节和发生的事件也都是虚构的。<br />女：哦，我想我现在明白了。听起来很有创意。<br />男：是的，确实是。事实上，[6]整部剧都是由他编写、导演、剪辑和制作的，[5]而且非常有趣，也赢得了许多奖项。<br />女：太酷了。[7]我会试着下载它。我在看喜剧片《生活大爆炸》。这部剧在全世界大受欢迎。<br />男：噢，是的。我听说过，但还没真正看过呢。<br />女：哦，那你应该去看看。这部剧也很有趣。它讲的是四个男科学家和一个女服务员的故事。这些男人很不善交际，但他们都非常聪明。这就和女士的社交技巧和常识形成了鲜明对比。[8]这部剧已经连续更新了十多年，其中一些演员实际上已经成了全球超级明星。现在他们都是名人了。</p>\n<p>&nbsp;</p>\n</div>\n</div>');
INSERT INTO `listening` VALUES (10, 'CET-4 2019-6 第1套', NULL, '大学英语2019年6月四级听力第一套题', '[{\"title\":\"What did the boy from central California do according to the report?\",\"op1\":\"He set a record by swimming to and from an island. \",\"op2\":\"He celebrated the ninth birthday on a small island.\",\"op3\":\"He visited a prison located on a faraway island.\",\"op4\":\"He swam around an island near San Francisco.\",\"answer\":\"A\"},{\"title\":\"What did the father do to encourage his son?\",\"op1\":\"He doubled the reward.  \",\"op2\":\"He cheered him on all the way.\",\"op3\":\"He set him an example.\",\"op4\":\"He had the event covered on TV.\",\"answer\":\"A\"},{\"title\":\"What was the purpose of the annual leave bonus in China?\",\"op1\":\"To end the one-child policy.\",\"op2\":\"To encourage late marriage.  \",\"op3\":\"To increase working efficiency.\",\"op4\":\"To give people more time to travel.\",\"answer\":\"B\"},{\"title\":\"What do we learn about the new regulations?\",\"op1\":\"They will not be welcomed by young people.\",\"op2\":\"They will help to popularize early marriage.\",\"op3\":\"They will boost China’s economic growth.\",\"op4\":\"They will not come into immediate effect.  \",\"answer\":\"D\"},{\"title\":\"What is the news report mainly about?\",\"op1\":\"Cleaning service in great demand all over the world.\",\"op2\":\"Two ladies giving up well-paid jobs to do cleaning.\",\"op3\":\"A new company to clean up the mess after partie\",\"op4\":\"Cleaners gainfully employed at nights and weekends.\",\"answer\":\"C\"},{\"title\":\"What is a common problem with a house party?\",\"op1\":\"It takes a lot of time to prepare.\",\"op2\":\"It leaves the house in a mess\",\"op3\":\"It makes party goers exhausted.\",\"op4\":\"It creates noise and misconduct.\",\"answer\":\"B\"},{\"title\":\"What are Rebecca Foley and Catherine Arthurs planning to do?\",\"op1\":\"Hire an Australian lawyer.\",\"op2\":\"Visit the US and Canada.\",\"op3\":\"Settle a legal dispute.\",\"op4\":\"Expand their business.  \",\"answer\":\"D\"},{\"title\":\"What did the man do yesterday?\",\"op1\":\"He had a driving lesson.\",\"op2\":\"He got his driver’s license.\",\"op3\":\"He took the driver’s theory exam. \",\"op4\":\"He passed the driver’s road test.\",\"answer\":\"C\"},{\"title\":\"Why did he fail the exam the first time?\",\"op1\":\"He was not well prepared. \",\"op2\":\"He did not get to the exam in time.\",\"op3\":\"He was not used to the test format.\",\"op4\":\"He did not follow the test procedure.\",\"answer\":\"A\"},{\"title\":\"What does the man say about his driving lessons?\",\"op1\":\"They are tough.\",\"op2\":\"They are costly.  \",\"op3\":\"They are helpful.\",\"op4\":\"They are too short.\",\"answer\":\"B\"}]', 1, '2021-04-04 19:56:02', '2021-05-07 17:13:30', NULL, '1617537332306.mp3', 4, '<div class=\"col-md-7 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<p>[1]A nine-year-old central California boy braved strong currents and cold water to swim from San Francisco to Alcatraz Island and back. A California television station in Fresno reported Tuesday that James Savage set a record as the youngest swimmer to make the journey to the former prison. The TV station reported that by completing the swim the fourth-grade student from Los Banos broke a record previously held by a ten-year-old boy. James said that waves in the San Francisco Bay hitting him in the face 30 minutes into his swim made him want to give up. His father said he had offered his son 100 dollars as a reward. [2]To encourage his struggling son he doubled it to 200 dollars. James pushed forward, making it to Alcatraz Island and back in a little more than two hours. Alcatraz is over a mile from the mainland.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[1]一位来自加利福尼亚中部地区的9岁男孩勇敢地面对湍急的水流和冰冷的海水，在旧金山和阿尔卡特拉斯岛（曾设有恶魔岛联邦监狱）之间游了一个来回。位于夫勒斯诺市的一家加州电视台周二报道，詹姆斯&middot;萨维奇创造了一项纪录，成为游向这座曾是监狱的地方的最年轻的游泳者。据该电视台报道，这位来自洛斯巴诺斯（加州的一个城市）的四年级学生游完全程，打破了此前由一名10岁男孩保持的纪录。詹姆斯说，在他游了30分钟后，旧金山湾的海浪击打着他的脸，让他想要放弃。他父亲说，他给了儿子100美元作为奖励。[2]为了鼓励努力坚持游完全程的儿子，他把奖励提高了一倍，增加到了200美元。詹姆斯不断超越自我，在两个小时多一点的时间里，成功地游到了阿尔卡特拉斯岛，又顺利地游了回来。阿尔卡特拉斯岛距离大陆一英里多。</p>\n<p>&nbsp;</p>\n</div>\n<p>On the first of January, new regulations will come into effect which eliminate an annual leave bonus for people who put off marrying until the age of 23 for women and 25 for men, the South China Morning Post reports. [3]The holiday bonus was designed to encourage young people to delay getting married in line with China&rsquo;s one-child policy. But with that policy now being abolished, this holiday incentive is no longer necessary, the government says. In Shanghai, a young couple at a marriage registration office told the paper that they decided to register their marriage as soon as possible to take advantage of the existing policy because an extra holiday was a big deal for them. In Beijing, one registration office had about 300 couples seeking to get married the day after the changes were announced, rather than the usual number of between 70 and 80. [4]But one lawyer tells the paper that the changes still have to be adopted by local governments and these procedures take time. So people who are rushing to register for marriage can relax.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>据《南华早报》报道，一项新规定将取消女性推迟到23岁结婚、男性推迟到25岁结婚的人的年假福利，这项新规定将于明年1月1日起生效。[3]这一假期福利旨在鼓励年轻人晚婚，以契合中国的独生子女政策。但政府称，随着这项政策现在被废除，这一假期激励措施不再有必要。 在上海，婚姻登记处的一对年轻情侣向《南华早报》表示，他们决定尽快登记结婚以利用现有政策的福利，因为额外的假期对他们来说意义非凡。在北京，政策变化宣布之后第二天，大约有300对情侣到一所婚姻登记处登记结婚，而往常每天来登记的只有70到80对情侣。[4]不过，一名律师对该报表示，这一政策变化有待地方政府实施，实施过程需要时间。所以，那些急于登记结婚的人可以放松下来。</p>\n<p>&nbsp;</p>\n</div>\n</div>\n<div class=\"col-md-5 englishtop\">\n<div class=\"col-md-7 englishtop\">\n<p>[6]Everyone loves a good house party, but the cleaning-up the next morning isn&rsquo;t as enjoyable. Now, however, a New Zealand-based startup company aims to bring messy homes&mdash;and even splitting headaches&mdash;back to normal. The properly-named startup &ldquo;Morning-After Maids&rdquo;, was launched about a month ago in Auckland by roommates Rebecca Foley and Catherine Arthurs. Aside from cleaning-up, the two will also cook breakfast, and even get coffee and painkillers for recovering merrymakers. Although they are both gainfully employed, they fit cleaning jobs into their nights and weekends, which is when their service is in most demand any way. Besides being flooded with requests from across the country, Foley and Arthurs have also received the requests from the U.S. and Canada to provide services there. [7]They are reportedly meeting with lawyers to see how best to take the business forward.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[6]人人都喜欢美好的家庭派对，但是第二天早上的清理工作却不那么令人愉快。不过，现有一家位于新西兰的创业公司旨在帮助人们把凌乱不堪（甚至令人抓狂）的家恢复原状。这家名字恰如其分、叫做&ldquo;次日女佣&rdquo;的创业公司于一个月前在奥克兰创立，创始人是瑞贝卡&middot;弗雷和凯瑟琳&middot;阿瑟斯，她们是室友。除了清理工作之外，她们两人还会为客户做早餐，甚至为了让在派对中纵情欢乐的人恢复精力，两人还会为他们买咖啡和头痛药。尽管她们提供服务会获得报酬，不过她们还是把清理工作安排在晚上和周末，也就是业务最集中的时间。除了接到国内的大量订单之外，弗雷和阿瑟斯还收到了去美国和加拿大提供服务的邀请。[7]据报道，她们两人正在跟律师会面，商讨如何更好地推进其业务。</p>\n</div>\n<p>&nbsp;</p>\n</div>');
INSERT INTO `listening` VALUES (11, '测试听力', NULL, '123', '[{\"title\":\"1\",\"op1\":\"aaa\",\"op2\":\"asdas\",\"op3\":\"bbb\",\"op4\":\"ccc\",\"answer\":\"A\"}]', 1, '2021-04-20 00:17:19', '2021-04-20 00:20:52', '2021-04-20 00:21:02', '1618849011539.mp3', 4, '<p>测试</p>');
INSERT INTO `listening` VALUES (12, '测试听力', NULL, '测试', '[{\"title\":\"1\",\"op1\":\"A\",\"op2\":\"B\",\"op3\":\"C\",\"op4\":\"D\",\"answer\":\"A\"}]', 1, '2021-04-20 16:45:03', '2021-04-20 16:45:25', '2021-04-20 16:45:48', '1618908282503.mp3', 8, '<p>ces&nbsp;</p>\n<p>&nbsp;</p>');
INSERT INTO `listening` VALUES (13, 'ceshi', '1618917192012.png', '123', '[{\"title\":\"123\",\"op1\":\"123\",\"op2\":\"123\",\"op3\":\"123\",\"op4\":\"123\",\"answer\":\"A\"}]', 1, '2021-04-20 19:13:38', '2021-04-20 19:13:38', '2021-04-20 19:16:33', '1618917207899.mp3', 4, '<p>123123</p>');
INSERT INTO `listening` VALUES (14, 'CET-4 2020-12 第1套', NULL, '大学英语2020年12月四级听力第一套题', '[{\"title\":\"What is reported in the news?\",\"op1\":\"A deadly fish has been spotted in the Mediterranean waters.\",\"op2\":\"Invasive species are driving away certain native species.\",\"op3\":\"The Mediterranean is a natural habitat of Devil Firefish.\",\"op4\":\"Many people have been attacked by Devil Firefish.\",\"answer\":\"A\"},{\"title\":\"What is the environmentalists\' concern about the spread of Devil Firefish in the Mediterranean?\",\"op1\":\"It could add to greenhouse emissions.\",\"op2\":\"It could disrupt the food chains there.\",\"op3\":\"It could pose a threat to other marine species.\",\"op4\":\"It could badly pollute the surrounding waters.\",\"answer\":\"C\"},{\"title\":\"What will happen on World Car-Free Day in Paris?\",\"op1\":\"Cars will not be allowed to enter the city.\",\"op2\":\"About half of its city center will be closed to cars.\",\"op3\":\"Buses will be the only vehicles allowed on its streets.\",\"op4\":\"Pedestrians will have free access to the city.\",\"answer\":\"B\"},{\"title\":\"What motivated the mayor of Paris to promote the first World Car-Free Day in her city?\",\"op1\":\"The rising air pollution in Paris.\",\"op2\":\"The worsening global warming.\",\"op3\":\"The ever-growing cost of petrol.\",\"op4\":\"The unbearable traffic noise.\",\"answer\":\"A\"},{\"title\":\"What happened to the Philippine fisherman one day?\",\"op1\":\"Many of his possessions were stolen.\",\"op2\":\"His house was burnt down in a fire. \",\"op3\":\"His fishing boat got wrecked on a rock.\",\"op4\":\"His good luck charm sank into the sea.\",\"answer\":\"B\"},{\"title\":\"What was the fisherman forced to do?\",\"op1\":\"Change his fishing locations.\",\"op2\":\"Find a job in a travel agency.\",\"op3\":\"Spend a few nights on a small island.\",\"op4\":\"Sell the pearl he had kept for years. \",\"answer\":\"D\"},{\"title\":\"What did the fisherman learn from the tourist agent?\",\"op1\":\"His pearl could be displayed in a museum.\",\"op2\":\"His monstrous pearl was extremely valuable. \",\"op3\":\"The largest pearl in the world weighs 14 pounds.\",\"op4\":\"A New York museum has the world\'s biggest pearl.\",\"answer\":\"B\"},{\"title\":\"What do we learn about the woman\'s company?\",\"op1\":\"It boasts a fairly long history.\",\"op2\":\"It produces construction materials.\",\"op3\":\"It has 75 offices around the world.\",\"op4\":\"It has over 50 business partners.\",\"answer\":\"A\"},{\"title\":\"What does the man say about his own company?\",\"op1\":\"It has about 50 employees.\",\"op2\":\"It was started by his father.\",\"op3\":\"It is a family business. \",\"op4\":\"It is over 100 years old.\",\"answer\":\"C\"},{\"title\":\"What is the main problem with the man\'s company?\",\"op1\":\"Shortage of raw material supply.\",\"op2\":\"Legal disputes in many countries.\",\"op3\":\"Outdated product design.\",\"op4\":\"Loss of competitive edge.\",\"answer\":\"D\"},{\"title\":\"What does the woman suggest doing to help the man\'s company?\",\"op1\":\"Conducting a financial analysis for it. \",\"op2\":\"Providing training for its staff members.\",\"op3\":\"Seeking new ways to increase its exports.\",\"op4\":\"Introducing innovative marketing strategies.\",\"answer\":\"A\"},{\"title\":\"What do we learn about the woman from the conversation?\",\"op1\":\"She is a real expert at house decorations.\",\"op2\":\"She is well informed about the design business.\",\"op3\":\"She is attracted by the color of the sitting room.\",\"op4\":\"She is really impressed by the man\'s house. \",\"answer\":\"D\"},{\"title\":\"Where did the man get his ideas for the project?\",\"op1\":\"From his younger brother Greg.\",\"op2\":\"From home design magazines. \",\"op3\":\"From a construction businessman.\",\"op4\":\"From a professional interior designer.\",\"answer\":\"B\"},{\"title\":\"What did the man say about the project he recently completed?\",\"op1\":\"The effort was worthwhile.\",\"op2\":\"The style was fashionable.\",\"op3\":\"The cost was affordable. \",\"op4\":\"The effect was unexpected.\",\"answer\":\"C\"},{\"title\":\"Why does the woman invite the man to her house next week?\",\"op1\":\"She\'d like him to talk with Jonathan about a new project.\",\"op2\":\"She wants him to share his renovation experience with her.  \",\"op3\":\"She wants to discuss the house decoration budget with him.\",\"op4\":\"She\'d like to show him around her newly-renovated house.\",\"answer\":\"B\"},{\"title\":\"What does England spend an annual 3 million pounds on?\",\"op1\":\"Providing routine care for small children.\",\"op2\":\"Paying hospital bills for emergency cases.\",\"op3\":\"Doing research on ear, nose and throat diseases.\",\"op4\":\"Removing objects from patients\' noses and ears.  \",\"answer\":\"D\"},{\"title\":\"What do we learn from England\'s Hospital Episode Statistics?\",\"op1\":\"Many children like to smell things they find or play with.\",\"op2\":\"Many children like to put foreign objects in their mouths.\",\"op3\":\"Five- to nine-year-olds are the most likely to put things in their ears.  \",\"op4\":\"Children aged one to four are often more curious than older children.\",\"answer\":\"C\"}]', 1, '2021-04-21 10:51:47', '2021-05-07 17:12:06', NULL, '1618973418582.mp3', 4, '<div class=\"col-md-7 englishtop\">\n<p>[1] A poisonous fish which has a sting strong enough to kill a human is invading the Mediterranean, warn scientists. The International Union for the Conservation of Nature has raised concerns after the poisonous fish was spotted in the waters around Turkey, Cyprus and the eastern Mediterranean. Native to the South Pacific and Indian Ocean, the potentially deadly fish has poisonous hooks&mdash;a painful sting capable of killing people. Although fatalities are rare, the stings can cause extreme pain and stop people breathing. The fish, often known as Devil Firefish, is a highly invasive species. [2] And environmentalists fear its arrival could endanger other types of marine life. After being spotted in the Mediterranean, a marine scientist says the fish is spreading, and that\'s a cause for concern.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[1]科学家警告称，一种有毒的鱼正在入侵地中海，这种鱼带有毒刺，足以毒死一个人。在土耳其、塞浦路斯和地中海东部海域发现这种有毒鱼类后，国际自然保护联盟对此表示担忧。这种可能致命的鱼原产于南太平洋和印度洋，它有带毒的钩子&mdash;&mdash;一种令人痛苦的毒刺，能杀死人。虽然这种鱼导致死亡的情况很罕见，但被毒刺蜇后会让人感到剧痛不已，并让人窒息。这种鱼，通常被称为恶魔火鱼，是一种具有高度入侵性的物种。[2]环保人士担心，它的到来会危及其他种类的海洋生物。在地中海发现这种鱼后，一位海洋科学家表示，这种鱼正在扩散，这是引起担忧的一个原因。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>[3] Almost half the center of Paris will be accessible only by foot or bicycle this Sunday to mark World Car-Free Day. [4] This is in response to rising air pollution that made Paris the most polluted city in the world for a brief time. Mayor Anne Hidalgo promoted the first World Car-Free Day last year.<br />Hidalgo also has supported a &ldquo;Paris Breathes&rdquo; day. On the first Sunday of every month, Paris clears traffic from eight lanes of the main road. About 400 miles of streets will be closed to cars. It is expected to bring significant reduction in pollution levels. Last year\'s car-free day showed a 40% drop in pollution levels in some parts of the city, according to an independent air pollution monitor, reports The Guardian, and sound levels dropped by 50% in the city\'s center.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[3]本周日，为了纪念世界无车日，巴黎市中心近一半地区将只能步行或骑自行车进入。[4]空气污染的加重曾使巴黎短暂地成为世界上污染最严重的城市，因此该举措是对这一问题做出的回应。安妮&middot;伊达尔戈市长去年发起了首个世界无车日。<br />伊达尔戈还支持&ldquo;巴黎呼吸日&rdquo;。每个月的第一个周日，巴黎都会疏散主干道八个车道上的车辆。大约400英里的街道将禁止汽车通行。预计这将显著降低污染水平。《卫报》报道称，根据一家独立的空气污染监测机构的数据，去年的（世界）无车日显示，该市一些地区的污染水平下降了40%，而市中心的噪音水平下降了50%。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>[5] A Philippine fisherman was feeling down on his luck when a house fire forced him to clear out his possessions and change locations. Then a good luck charm that he had kept under his bed changed his life. The unidentified man had fished out a giant pearl from the ocean when his anchor got stuck on the rock while sailing off a coastal island in the Philippines ten years ago. [6] When he was forced to sell it, [7] the shocked tourist agent at Puerto Princesa told him that the 77-pound giant pearl that he had kept hidden in his rundown wooden house was the biggest pearl in the world, which was valued at ￡ 76 million.<br />The Pearl of Allah, which is currently on display in a New York museum, only weighs 14 pounds. That is five times smaller than the pearl that the fisherman just handed in. The monstrous pearl measured at 1 foot wide and 2.2 feet long, is going to be verified by local experts and international authorities before hopefully going on display to attract more tourists in the little town.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[5]一位菲律宾渔民时运不济，一场房屋火灾迫使他清理了自己的财物并更换了住处。后来，他藏在床下的一个幸运符改变了他的生活。10年前，当这名身份不明的男子在菲律宾一个沿海岛屿附近航行，而船锚卡在了岩石上时，他从海里捞出了一颗巨大的珍珠。[6]当他被迫出售那颗珍珠时，[7]普林塞萨港的一个旅行代理商震惊地告诉他，他藏在破旧木屋里的那颗77磅重的巨型珍珠是世界上最大的珍珠，价值7600万英镑。<br />目前在纽约一家博物馆展出的&ldquo;真主之珠&rdquo;只有14磅重。也就是渔民刚刚交上来的那颗珍珠的五分之一那么大。这颗大得吓人的珍珠宽1英尺，长2.2英尺，将经过当地专家和国际权威机构的验证，然后有望进行展示，以吸引更多的游客到小镇来。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>W: Mr. Smith, it\'s a pleasure meeting you!<br />M: Nice to meet you, too. What can I do for you?<br />W: Well, I\'m here to show you what our firm can do for you. Astro Consultants has branches in over fifty countries, offering different business services. [8] We\'re a global company with 75 years of history. And our clients include some of the world\'s largest companies.<br />M: Thank you, Mrs. Houston. I know Astro Consultants is a famous company. But you said you would show me what you could do for me. Well, what exactly can your firm do for my company?<br />W: We advise businesses on all matters, from market analysis to legal issues. Anything a business like yours could need, our firm offers expert advice. Could I ask you, Mr. Smith, to tell me a little about your company and the challenges you face? That way, I could better respond as to how we can help you.<br />M: OK, sure. [9] This is a family business started by my grandfather in 1950. We employ just over 100 people. We manufacture an export stone for buildings and other constructions. Our clients usually want a special kind of stone cut in a special design. And that\'s what we do in our factory. [10] Our main challenge is that our national currency is rising, and we\'re losing competitive advantage to stone producers in India.<br />W: I see. That\'s very interesting. [11] I will suggest that you let us first conduct a financial analysis of your company, together with the analysis of your competitors in India. That way, we could offer the best advice on different ways forward for you.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>女：史密斯先生，很高兴见到您！<br />男：我也很高兴见到您。我能为您做些什么？<br />女：嗯，我来这里是向您介绍我们公司能为您提供的服务。阿斯特罗咨询公司在50多个国家设立了分公司，提供不同的业务服务。[8]我们是一家拥有75年历史的全球化公司。我们的客户包括一些世界上最大的公司。<br />男：谢谢您，休斯敦女士。我知道阿斯特罗咨询公司是一家很有名的公司。但您刚才说要向我介绍贵公司能为我提供哪些服务。那么，具体是哪些服务呢？<br />女：我们就所有问题向公司提供咨询，从市场分析到法律事务，一应俱全。像你们公司这样的企业可能需要咨询的任何事情，我们公司都可以提供专业的建议。史密斯先生，可以请您稍微介绍一下贵公司的情况以及贵公司所面临的挑战吗？这样的话，我就能更好地说明我们该如何帮助您。<br />男：好的，当然可以。[9]这家公司是我的祖父在1950年创立的家族企业。我们仅雇用了100多名员工。我们生产出口用于修建楼房和其他建筑的石材。我们的客户通常需要一种特殊的石头，并且石头需要被切割成特殊的工艺形状。这就是我们公司的业务。[10]我们的主要挑战是，国家货币正在升值，而且，对于印度的石材商我们正在失去竞争优势。<br />女：我明白了。这种情况非常令人关注。[11]我建议您让我们先对贵公司的财务进行分析，同时分析贵公司在印度的竞争对手。这样，我们就可以从不同的角度为您提供最好的建议了。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>W: Wow, congratulations, Simon! The place looks absolutely amazing!<br />M: Really? You think so?<br />W: Of course. I love it. It looks like you had a professional interior designer. But you didn\'t, did you?<br />M: No. I did it all by myself with a little help from my brother, Greg. He\'s actually in the construction business, which was really helpful.<br />W: [12] I, honestly, I\'m impressed! I know I can probably repaint the walls in my house over a weekend or something, but not a full renovation. Where did you get your ideas? I wouldn\'t know where to start.<br />M: [13] Well, for a while now, I\'ve been regularly buying home design magazines. Every now and then, I\'d saved the pictures I liked. Believe it or not, I had a full notebook of magazine pages. Since my overall style was quite minimal, I thought and hoped a whole renovation wouldn\'t be too difficult. And sure enough, with Greg\'s help, it was very achievable.<br />W: Was it very expensive? I have imagined a project like this could be.<br />M: [14] Actually, it was surprisingly affordable. I managed to sell a lot of my old furniture and put that extra money towards the new material. Greg was also able to get some discount materials from a recent project he was working on as well.<br />W: Great! If you don\'t mind, I\'d like to pick your brain a bit more. Jonathan and I are thinking of renovating our sitting room, not the whole house, not yet anyway. [15] And we\'d love to get some inspiration from your experience. Are you free to come over for a coffee early next week?</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>女：哇，祝贺你，西蒙！这地方看起来太棒了！<br />男：真的吗？你真的这样认为吗？<br />女：当然。我十分喜欢。它看起来就像是你请了专业的室内设计师设计出来的。但你没有找设计师，对吧？<br />男：没错。我亲力亲为，我弟弟格雷格也帮了点忙。实际上，他是从事建筑行业的，这可帮了大忙。<br />女：[12]说实话，我真的非常喜欢！我知道可能我可以在周末或其他时间将我家的墙也重新粉刷一遍，但不是完全翻新。你的灵感是从哪里来的？我不知道从哪儿开始。<br />男：[13]哦，有那么一段时间，我一直定期购买家居设计杂志。我有时会保存一些我喜欢的图片。信不信由你，我从杂志上剪下来的图片贴满了整整一个笔记本呢。由于我的整体设计风格非常简约，我想整个装修过程不会太困难，我同时也希望如此。果然，在格雷格的帮助下，这是很容易实现的。<br />女：装修费很贵吧？我想过这样一个工程可能会很贵。<br />男：[14]实际上，装修费非常容易承担。我设法卖掉了很多旧家具，把额外得到的钱用于购买新材料。格雷格也能从最近在做的一个项目中买一些打折的材料。<br />女：太棒了！如果你不介意的话，我想再向你请教一下。乔纳森和我正在考虑翻新我们的客厅，至少现在我们还不考虑翻新整栋房子。[15]我们希望从你的经验中得到一些启发。下周早些时候你有空过来喝杯咖啡吗？</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>[16] Removing foreign objects from ears and noses costs England almost 3 million pounds a year, a study suggests. Children were responsible for the vast majority of cases &mdash; 95% of objects removed from noses and 85% from ears.<br />Every year, an average of 1,218 nose and 2,479 ear removals took place between 2010 and 2016. According to England\'s Hospital Episode Statistics, [17] children aged one to four were the most likely to need help from doctors for a foreign object in their nose. Five- to nine-year-olds come to the hospital with something in their ears the most.<br />Jewelry items accounted for up to 40% of cases in both the ears and noses of children. Paper and plastic toys were the items removed next most from noses. Cotton buds and pencils were also found in ears. [18] According to the study, the occurrence of foreign objects in children is generally attributed to curiosity.<br />Children have an impulse to explore their noses and ears. This results in the accidental entry of foreign objects. Any ear, nose and throat surgeon has many weird stories about wonderful objects found in the noses and ears of children and adults. Batteries can pose a particular danger. In all cases, prevention is better than cure. This is why many toys contain warnings about small parts. Recognizing problems early and seeking medical attention is important.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>[16]一项研究表明，从耳朵和鼻子里移除异物每年要花费英国近300万英镑。绝大多数都是儿童病例，95%的异物是从鼻子里移除，而85%的异物是从耳朵中移除的。<br />从2010年到2016年，每年平均有1218个异物从鼻子中移除，有2479个异物从耳朵里移除。根据英国医院病例统计，[17] 1到4岁的儿童，最有可能因为鼻子里有异物而需要得到医生的帮助。5到9岁的儿童因为耳朵中有异物而来医院的情况最多。<br />在这些病例中，珠宝类物品出现在孩子的耳朵和鼻子中所占的比例高达40%。纸和塑料玩具是从鼻子里移除的异物中第二多的。棉签和铅笔也在耳朵中被发现过。[18]根据这项研究，儿童体内出现异物通常归因于好奇。<br />孩子们有探索自己鼻子和耳朵的冲动。这就导致了异物的意外进入。任何耳鼻喉外科医生都有许多关于在儿童和成年人的鼻子和耳朵里发现奇妙物品的奇怪故事。电池会造成特别的危险。在所有情况下，预防胜于治疗。这就是为什么许多玩具包装盒上面都有关于小部件的警告。及早发现问题并寻求医疗帮助很重要。 整体预测</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>Good morning. [21] Today, I would like to talk to you about my charity ReBicycle. But before that, let me introduce someone. This is Leila Rahimi. She was so scared when she first moved to New Zealand that she struggled to leave the house and would spend days working up the courage to walk to the supermarket for basic supplies.<br />After a few months of being quite down and unhappy, she was invited to join a local bike club. [19] At this time, ReBicycle got involved and gave Leila a second-hand bicycle. Within weeks, her depression had begun to ease as she cycled. The bicycle totally changed her life, giving her hope and a true feeling of freedom.<br />To date, ReBicycle has donated more than 200 bikes to those in need. [20] And it is now expanding bike-riding lessons as demand soars. With a bike, newcomers here can travel farther, but for almost no cost. The three hours a day they used to spend walking to and from English language lessons has been reduced to just one hour.<br />[21] Our bike-riding lessons are so successful that we are urgently looking for more volunteers. Learning to ride a bike is almost always more difficult for an adult, and this can take days and weeks rather than hours. So, if any of you have some free time during the weekend, please come join us at ReBicycle and make a difference in someone\'s life.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>早上好。[21]今天，我想和大家谈谈我的慈善机构ReBicycle。但在那之前，让我先介绍一个人。这位是莱拉&middot;拉希米。刚搬到新西兰的时候，她感到非常害怕，以至于很难走出家门，会花好几天时间才鼓起勇气去超市买一些基本用品。<br />经历了几个月的消沉和不开心，她受邀加入了当地的一个自行车俱乐部。[19]这时，ReBicycle也参与进来，给了莱拉一辆二手自行车。在几周内，随着她进行骑行活动，她的抑郁情绪开始缓解。自行车彻底改变了她的生活，给了她希望和一种真正的自由感。<br />到目前为止，ReBicycle已经向那些有需要的人捐赠了200多辆自行车。[20]现在，随着需求猛增，慈善机构正在增加其骑行课程。有了自行车，新来的人可以去更远的地方，却几乎不用花钱。过去，他们每天来回要花3个小时步行去上英语课，现在（有了自行车）已经减少到只需1个小时。<br />[21]我们的自行车骑行课程非常成功，所以我们迫切需要寻找更多的志愿者。对一个成年人来说，学习骑自行车通常总是更困难一些，可能需要花费几天或几周，而不是几个小时。所以，如果你们当中的任何一个人在周末有空闲时间，请加入我们ReBicycle，让别人的生活变得不同。</p>\n<p>&nbsp;</p>\n<div class=\"col-md-7 englishtop\">\n<p>Thanks to the International Space Station, we know quite a bit about the effects of low gravity on the human body, but NASA scientists want to learn more. [22] To that end, they have been studying how other species deal with low gravity, specifically focusing on mice. The results are both interesting and humorous. The scientists first sent some mice in a specially designed cage to the International Space Station. The cage allowed them to study the behavior of the mice remotely from Earth via video. As you\'ll notice in the video, [23] the mice definitely seem uncomfortable at the beginning of the experiment. They move around clumsily, drifting within the small confines of the cage, and do their best to figure out which way is up, but without success.<br />However, it\'s not long before the mice begin to catch on. They adapt remarkably well to their new environment and even use the lack of gravity to their advantage as they push themselves around the cage.<br />That\'s when things really get wild. [24] The 11th day of the experiment shows the mice are not just dealing with the gravity change, but actually seem to be enjoying it. Several of the mice are observed running around the cage walls.<br />[25] The scientists wanted to see whether the mice would continue doing the same kinds of activities they were observed doing on Earth. The study showed that the mice kept much of the routines intact, including cleaning themselves and eating when hungry.</p>\n</div>\n<div class=\"col-md-5 englishtop\">\n<p>多亏了国际空间站，我们了解了很多关于低重力对人体的影响，但是美国宇航局的科学家们想要了解更多。[22]为此，他们一直在研究其他物种是如何应对低重力环境的，特别是在老鼠身上。结果既有趣，又充满幽默。科学家们首先把一些老鼠装进一个特别设计的笼子里并送到国际空间站。这个笼子使得他们能够通过视频从地球上远程研究老鼠的行为。正如你将在视频中注意到的，[23]在实验开始的时候，老鼠看起来显然很不舒服。它们在笼子狭小的空间里笨拙地移动，悬浮在空中，并且竭力想知道哪条路是向上的，却无济于事。<br />然而，老鼠很快就明白过来。它们很好地适应了新环境，甚至充分利用失重的优势推动自己在笼子里打转。<br />那才是事情真正变得疯狂的时候。[24]实验的第11天表明，老鼠们不仅在应对重力变化，而且实际上似乎很享受。科学家们观察到有几只老鼠沿着笼子的四壁跑来跑去。<br />[25]科学家们想看看这些老鼠是否会继续做人们在地球上观察到它们所做的那些活动。研究表明，老鼠的日常活动基本保持不变，包括清洁自己和饥饿时进食。</p>\n<p>&nbsp;</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>');
INSERT INTO `listening` VALUES (16, '测试', NULL, '123', '[{\"title\":\"AAAAA\",\"op1\":\"A\",\"op2\":\"B\",\"op3\":\"C\",\"op4\":\"D\",\"answer\":\"A\"}]', 0, '2021-05-07 17:56:41', '2021-05-07 17:56:47', '2021-05-07 17:56:51', '1620381387326.mp3', 4, '<p>解析</p>');
INSERT INTO `listening` VALUES (17, '测试听力', NULL, '测试', '[{\"title\":\"AAAA\",\"op1\":\"A\",\"op2\":\"B\",\"op3\":\"C\",\"op4\":\"D\",\"answer\":\"A\"}]', 1, '2021-05-08 16:21:38', '2021-05-08 16:21:38', NULL, '1620462086869.mp3', 17, '<p>测试</p>');
INSERT INTO `listening` VALUES (15, '测试', NULL, '测试', '[{\"title\":\"题目111111\",\"op1\":\"A\",\"op2\":\"B\",\"op3\":\"C\",\"op4\":\"D\",\"answer\":\"A\"}]', 0, '2021-04-21 14:27:49', '2021-04-21 14:28:33', '2021-04-21 14:28:41', '1618986449684.mp3', 4, '<p>解释</p>');

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `from_user_id` bigint(20) NOT NULL COMMENT '发起用户id',
  `to_user_id` bigint(20) NOT NULL COMMENT '接收用户id',
  `rel_type` int(1) NOT NULL COMMENT '关注/不关注/拉黑 ，1代表关注，2代表不关注，3代表拉黑',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES (1, 8, 1, 1, '2022-03-28 10:30:43', '2022-04-05 20:09:54', NULL);
INSERT INTO `relation` VALUES (2, 8, 14, 3, '2022-03-28 11:07:14', '2022-03-28 11:14:23', NULL);
INSERT INTO `relation` VALUES (5, 8, 8, 2, '2022-03-28 23:19:59', '2022-03-28 23:53:07', NULL);
INSERT INTO `relation` VALUES (6, 8, 3, 1, '2022-03-29 00:01:36', '2022-03-29 00:01:36', NULL);

-- ----------------------------
-- Table structure for user_article_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_article_collection`;
CREATE TABLE `user_article_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_article_collection
-- ----------------------------
INSERT INTO `user_article_collection` VALUES (1, 8, 18, '2021-03-27 23:08:33', NULL, '2021-03-27 23:23:19');
INSERT INTO `user_article_collection` VALUES (2, 8, 18, '2021-03-27 23:43:34', '2021-03-27 23:43:34', '2021-03-28 15:59:30');
INSERT INTO `user_article_collection` VALUES (3, 8, 18, '2021-03-28 16:39:40', '2021-03-28 16:39:40', '2021-03-28 16:40:01');
INSERT INTO `user_article_collection` VALUES (4, 8, 18, '2021-03-28 16:40:08', '2021-03-28 16:40:08', '2021-04-17 16:50:57');
INSERT INTO `user_article_collection` VALUES (5, 8, 20, '2021-04-10 17:29:08', '2021-04-10 17:29:08', '2021-04-17 16:50:58');
INSERT INTO `user_article_collection` VALUES (6, 8, 21, '2021-04-10 17:29:12', '2021-04-10 17:29:12', '2021-04-17 16:50:58');
INSERT INTO `user_article_collection` VALUES (7, 8, 22, '2021-04-10 17:29:16', '2021-04-10 17:29:16', '2021-04-17 16:50:58');
INSERT INTO `user_article_collection` VALUES (8, 8, 23, '2021-04-10 17:29:19', '2021-04-10 17:29:19', '2021-04-17 16:50:59');
INSERT INTO `user_article_collection` VALUES (9, 8, 26, '2021-04-10 17:29:23', '2021-04-10 17:29:23', '2021-04-17 16:50:59');
INSERT INTO `user_article_collection` VALUES (10, 8, 24, '2021-04-10 17:29:28', '2021-04-10 17:29:28', '2021-04-17 16:50:59');
INSERT INTO `user_article_collection` VALUES (11, 8, 25, '2021-04-10 17:29:39', '2021-04-10 17:29:39', '2021-04-17 16:50:59');
INSERT INTO `user_article_collection` VALUES (12, 9, 29, '2021-04-18 18:39:15', '2021-04-18 18:39:15', NULL);
INSERT INTO `user_article_collection` VALUES (13, 10, 18, '2021-04-18 19:40:13', '2021-04-18 19:40:13', NULL);
INSERT INTO `user_article_collection` VALUES (14, 8, 18, '2021-04-20 11:06:16', '2021-04-20 11:06:16', '2022-03-22 15:52:19');
INSERT INTO `user_article_collection` VALUES (15, 8, 23, '2021-04-21 14:18:39', '2021-04-21 14:18:39', '2022-03-22 15:53:50');
INSERT INTO `user_article_collection` VALUES (16, 9, 45, '2021-05-08 16:30:16', '2021-05-08 16:30:16', NULL);
INSERT INTO `user_article_collection` VALUES (17, 10, 45, '2021-05-08 16:42:32', '2021-05-08 16:42:32', NULL);
INSERT INTO `user_article_collection` VALUES (18, 8, 46, '2022-03-22 15:08:25', '2022-03-22 15:08:25', '2022-03-22 15:16:25');
INSERT INTO `user_article_collection` VALUES (19, 11, 46, '2022-03-22 15:09:25', '2022-03-22 15:09:25', '2022-03-22 15:16:48');
INSERT INTO `user_article_collection` VALUES (20, 8, 45, '2022-03-22 16:03:57', '2022-03-22 16:03:57', '2022-03-22 16:22:45');
INSERT INTO `user_article_collection` VALUES (21, 8, 45, '2022-03-22 16:22:47', '2022-03-22 16:22:47', '2022-03-22 16:22:48');
INSERT INTO `user_article_collection` VALUES (22, 8, 45, '2022-03-22 16:22:54', '2022-03-22 16:22:54', NULL);
INSERT INTO `user_article_collection` VALUES (23, 8, 46, '2022-03-28 23:21:25', '2022-03-28 23:21:25', '2022-03-28 23:21:26');
INSERT INTO `user_article_collection` VALUES (24, 8, 46, '2022-03-28 23:52:48', '2022-03-28 23:52:48', '2022-04-06 21:24:33');
INSERT INTO `user_article_collection` VALUES (25, 8, 48, '2022-04-06 21:24:39', '2022-04-06 21:24:39', NULL);
INSERT INTO `user_article_collection` VALUES (26, 8, 49, '2022-04-06 21:24:42', '2022-04-06 21:24:42', NULL);

-- ----------------------------
-- Table structure for user_listening_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_listening_collection`;
CREATE TABLE `user_listening_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `listening_id` bigint(20) NOT NULL COMMENT '听力练习id',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_listening_collection
-- ----------------------------
INSERT INTO `user_listening_collection` VALUES (1, 8, 2, '2021-03-27 23:08:44', NULL, '2021-03-27 23:23:40');
INSERT INTO `user_listening_collection` VALUES (2, 8, 2, '2021-03-27 23:43:53', '2021-03-27 23:43:53', '2021-03-28 15:53:15');
INSERT INTO `user_listening_collection` VALUES (3, 8, 3, '2021-03-27 23:43:58', '2021-03-27 23:43:58', '2021-03-28 15:52:14');
INSERT INTO `user_listening_collection` VALUES (4, 8, 4, '2021-03-27 23:47:34', '2021-03-27 23:47:34', '2021-03-28 15:51:56');
INSERT INTO `user_listening_collection` VALUES (5, 8, 3, '2021-03-28 15:56:13', '2021-03-28 15:56:15', '2021-03-28 15:59:42');
INSERT INTO `user_listening_collection` VALUES (6, 8, 4, '2021-03-28 15:56:19', '2021-03-28 15:56:22', '2021-03-28 15:59:23');
INSERT INTO `user_listening_collection` VALUES (7, 8, 2, '2021-03-31 21:02:41', '2021-03-31 21:02:41', '2021-04-10 15:38:57');
INSERT INTO `user_listening_collection` VALUES (8, 8, 3, '2021-03-31 21:03:01', '2021-03-31 21:03:01', '2021-04-04 17:54:47');
INSERT INTO `user_listening_collection` VALUES (9, 8, 6, '2021-04-10 21:41:18', '2021-04-10 21:41:18', '2021-04-17 16:51:00');
INSERT INTO `user_listening_collection` VALUES (10, 9, 6, '2021-04-18 18:39:39', '2021-04-18 18:39:39', NULL);
INSERT INTO `user_listening_collection` VALUES (11, 8, 9, '2021-04-20 11:06:09', '2021-04-20 11:06:09', NULL);
INSERT INTO `user_listening_collection` VALUES (12, 8, 14, '2021-04-21 14:19:34', '2021-04-21 14:19:34', '2021-04-21 14:21:11');
INSERT INTO `user_listening_collection` VALUES (13, 8, 15, '2021-04-21 14:28:01', '2021-04-21 14:28:01', '2021-04-21 14:28:41');
INSERT INTO `user_listening_collection` VALUES (14, 8, 14, '2021-05-07 17:07:16', '2021-05-07 17:07:16', NULL);
INSERT INTO `user_listening_collection` VALUES (15, 9, 17, '2021-05-08 16:30:56', '2021-05-08 16:30:56', '2021-05-08 16:31:41');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `id` int(30) NOT NULL,
  `count` int(30) NOT NULL COMMENT '网站访问数',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES (1, 132, '2021-04-20 20:45:47', '2021-05-08 17:34:37', NULL);

-- ----------------------------
-- Table structure for web_user
-- ----------------------------
DROP TABLE IF EXISTS `web_user`;
CREATE TABLE `web_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` int(1) NOT NULL COMMENT '性别：1代表男，2代表女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_del`(`username`, `deleted_at`) USING BTREE,
  UNIQUE INDEX `email_del`(`email`, `deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_user
-- ----------------------------
INSERT INTO `web_user` VALUES (1, 'root', 'Lee', '1647848525744.jpg', NULL, 1, '1998-01-01', '2020-12-22 00:35:50.228', '2022-03-21 15:43:11.115', NULL);
INSERT INTO `web_user` VALUES (2, '小明', '小明', '1616584592322.jpg', NULL, 1, '1998-01-01', '2021-01-02 11:41:14.000', '2022-03-21 11:09:12.485', NULL);
INSERT INTO `web_user` VALUES (5, '13106579195', '胖同学', '1616584592322.jpg', NULL, 2, '1998-01-01', '2021-03-18 20:38:07.000', '2022-03-21 11:09:12.486', NULL);
INSERT INTO `web_user` VALUES (6, '15015701422', '15616516516', 'avatar.png', NULL, 1, '1998-01-01', '2021-03-26 23:30:21.000', '2022-03-21 11:09:12.487', NULL);
INSERT INTO `web_user` VALUES (8, '13202350062', '哈哈哈', '1647851046978.jpg', '944106568@qq.com', 1, '1999-02-01', '2021-03-27 10:22:06.000', '2022-04-06 21:26:00.000', NULL);
INSERT INTO `web_user` VALUES (10, '15622741369', '我是修改', 'avatar.png', NULL, 1, '1998-01-01', '2021-05-08 16:42:10.000', '2022-03-21 11:09:12.489', NULL);
INSERT INTO `web_user` VALUES (11, '13202350063', '1647784923838', 'avatar.png', NULL, 1, '1998-01-01', '2022-03-20 22:54:57.000', '2022-03-21 11:09:12.490', NULL);
INSERT INTO `web_user` VALUES (12, '13202350064', '1647784923838', 'avatar.png', NULL, 1, '1998-01-01', '2022-03-20 22:57:53.000', '2022-03-21 11:09:12.491', NULL);
INSERT INTO `web_user` VALUES (13, '13202350065', '1647784923838', 'avatar.png', NULL, 1, '1998-01-01', '2022-03-20 22:58:12.000', '2022-03-21 11:09:12.491', NULL);
INSERT INTO `web_user` VALUES (14, '13202350066', '1647833460383', 'avatar.png', NULL, 1, NULL, '2022-03-21 11:53:38.000', '2022-03-21 11:53:38.000', NULL);

-- ----------------------------
-- Table structure for web_user_identity
-- ----------------------------
DROP TABLE IF EXISTS `web_user_identity`;
CREATE TABLE `web_user_identity`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `credential` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_user_identity
-- ----------------------------
INSERT INTO `web_user_identity` VALUES (1, 1, 'USERNAME_PASSWORD', 'root', 'sha1$c419e500$1$84869e5560ebf3de26b6690386484929456d6c07', '2020-12-22 00:35:50.233', '2020-12-22 00:35:50.233', NULL);
INSERT INTO `web_user_identity` VALUES (2, 2, 'USERNAME_PASSWORD', '小明', 'sha1$789526c4$1$4f58a9914565c53fc5014dd80252a30574d85bc2', '2021-01-02 11:41:14.000', '2021-01-02 11:41:14.000', NULL);
INSERT INTO `web_user_identity` VALUES (5, 5, 'USERNAME_PASSWORD', '13106579195', 'sha1$288e68a2$1$9896ed4140966d33b4913a2ff232c040bafa301f', '2021-03-18 20:38:07.000', '2021-03-27 14:53:10.000', NULL);
INSERT INTO `web_user_identity` VALUES (6, 6, 'USERNAME_PASSWORD', '15015701422', 'sha1$c3004c7b$1$a5bbda1ee0cdba7e955cd23678d7276071ac1252', '2021-03-26 23:30:21.000', '2021-03-26 23:30:21.000', NULL);
INSERT INTO `web_user_identity` VALUES (8, 8, 'USERNAME_PASSWORD', '13202350062', 'sha1$d94f3c85$1$741334ad3cf5e621359a24cb364eb83076619565', '2021-03-27 10:22:06.000', '2021-03-27 10:22:06.000', NULL);
INSERT INTO `web_user_identity` VALUES (10, 10, 'USERNAME_PASSWORD', '15622741369', 'sha1$afab0f1c$1$b87ab67c6b0339721471a9562da09b730c7cbe6e', '2021-05-08 16:42:10.000', '2021-05-08 16:42:10.000', NULL);
INSERT INTO `web_user_identity` VALUES (11, 11, 'USERNAME_PASSWORD', '13202350063', 'sha1$3f26ad90$1$117797be4bc57687216b22d293a982020b4345e5', '2022-03-20 22:54:57.000', '2022-03-20 22:54:57.000', NULL);
INSERT INTO `web_user_identity` VALUES (12, 12, 'USERNAME_PASSWORD', '13202350064', 'sha1$3678ef46$1$6709e149b03d23923416aec0cccde2709299a0a4', '2022-03-20 22:57:53.000', '2022-03-20 22:57:53.000', NULL);
INSERT INTO `web_user_identity` VALUES (13, 13, 'USERNAME_PASSWORD', '13202350065', 'sha1$96335bbc$1$4553c602bcd58e0f21494e70e7a8cb997c0bc858', '2022-03-20 22:58:12.000', '2022-03-20 22:58:12.000', NULL);
INSERT INTO `web_user_identity` VALUES (14, 14, 'USERNAME_PASSWORD', '13202350066', 'sha1$e0efa6de$1$08eba7ac021b686cc57a261e8589fe9dc03f9905', '2022-03-21 11:53:38.000', '2022-03-21 11:53:38.000', NULL);

-- ----------------------------
-- Table structure for web_user_listening
-- ----------------------------
DROP TABLE IF EXISTS `web_user_listening`;
CREATE TABLE `web_user_listening`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webUserId` bigint(20) NOT NULL COMMENT '用户id',
  `listeningId` bigint(20) NOT NULL COMMENT '听力练习id',
  `history_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户答题历史记录',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_user_listening
-- ----------------------------
INSERT INTO `web_user_listening` VALUES (4, 1, 1, '[\'A\',\'C\',\'C\']', '2021-03-25 18:41:56', '2021-03-25 18:46:56', '2021-03-25 18:46:56');
INSERT INTO `web_user_listening` VALUES (5, 8, 1, '[\'A\',\'C\',\'C\']', '2021-03-25 18:41:56', '2021-03-25 18:46:56', '2021-03-28 16:29:51');
INSERT INTO `web_user_listening` VALUES (6, 8, 2, '[\"B\"]', '2021-03-28 22:10:17', '2021-03-28 22:22:40', '2021-04-10 15:40:35');
INSERT INTO `web_user_listening` VALUES (7, 8, 10, '[\"A\"]', '2021-04-10 15:41:54', '2021-04-10 15:41:54', NULL);
INSERT INTO `web_user_listening` VALUES (8, 8, 6, '[\"B\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', '2021-04-10 21:10:57', '2021-04-12 00:55:10', NULL);
INSERT INTO `web_user_listening` VALUES (9, 8, 7, '[\"B\"]', '2021-04-10 21:15:28', '2021-04-10 21:16:54', NULL);
INSERT INTO `web_user_listening` VALUES (10, 9, 6, '[\"A\",\"A\",\"A\",\"A\",\"B\",\"B\",\"B\",\"B\",\"B\"]', '2021-04-18 18:39:32', '2021-04-18 18:39:32', NULL);
INSERT INTO `web_user_listening` VALUES (11, 10, 6, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', '2021-04-18 19:39:23', '2021-04-18 19:39:23', '2021-05-08 17:34:44');
INSERT INTO `web_user_listening` VALUES (12, 8, 9, '[\"A\"]', '2021-04-20 11:06:11', '2021-04-20 11:06:11', NULL);
INSERT INTO `web_user_listening` VALUES (13, 8, 14, '[\"B\",\"C\",\"C\",\"C\",\"B\",\"C\",\"C\",\"C\",\"B\",\"C\",\"C\",\"C\",\"D\",\"D\",\"D\",\"D\",\"D\"]', '2021-04-21 14:19:26', '2021-05-07 17:06:45', NULL);
INSERT INTO `web_user_listening` VALUES (14, 10, 14, '[\"B\",\"B\",\"B\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\",\"C\"]', '2021-05-08 16:43:42', '2021-05-08 16:43:42', '2021-05-08 17:34:42');
INSERT INTO `web_user_listening` VALUES (15, 10, 17, '[\"C\"]', '2021-05-08 16:45:25', '2021-05-08 16:46:52', NULL);

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word`  (
  `word_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词id',
  `word_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单词名称',
  `translate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单词解释',
  `pronunciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单词音标',
  `mp3_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单词mp3',
  `categoryId` bigint(20) NOT NULL COMMENT '分类id',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`word_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1043 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES (22, 'spill', 'v. 溢出，洒，使...流出，泄漏 n. 溢出，流 n. 木片，小杆', '[spil]', NULL, 4, '2021-04-15 11:05:41', '2021-04-15 11:05:41', NULL);
INSERT INTO `word` VALUES (21, 'burst', ' vt.使爆裂 vi.&amp;n.爆炸', '/bə:st/', NULL, 4, '2021-04-15 10:52:52', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (11, 'alone', 'adj. 单独的，孤单的，独自一人的 adv. 独自地', '[ə\'ləun]', NULL, 4, '2021-04-12 10:21:36', '2021-04-13 20:01:56', NULL);
INSERT INTO `word` VALUES (12, 'alarm', ' n.惊恐，忧虑;警报', '/ə’la:m/', NULL, 4, '2021-04-12 10:24:17', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (76, 'alter', ' vt.改变，变更;改做', '/‘ɔ:ltə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (13, 'airline', 'n. 航线，航空公司', '[\'ɛəlain]', NULL, 8, '2021-04-12 10:24:38', '2021-04-20 17:18:53', NULL);
INSERT INTO `word` VALUES (14, 'airport', 'n. 机场，航空站', '[\'eəpɔ:t]', NULL, 4, '2021-04-12 10:24:56', '2021-04-12 10:24:56', NULL);
INSERT INTO `word` VALUES (15, 'allow', 'v.允许；准许；给予；承认', '[ə\'lau]', NULL, 4, '2021-04-12 10:25:12', '2021-04-12 10:25:12', NULL);
INSERT INTO `word` VALUES (16, 'alike', ' a.同样的，相同的', '/ə’laik/', NULL, 4, '2021-04-12 10:25:28', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (17, 'aircraft', ' n.飞机，飞行器', '/‘eəkra:ft/', NULL, 4, '2021-04-12 10:25:44', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (157, 'back', ' ad.在后;回原处;回', '/bæk/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (156, 'baby', ' n.婴儿;孩子气的人', '/‘beibi/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (27, 'abandon', ' vt.丢弃;放弃，抛弃', '/ə’bændən/', NULL, 4, '2021-04-21 13:45:11', '2021-04-21 13:45:11', NULL);
INSERT INTO `word` VALUES (28, 'absolute', ' a.绝对的;纯粹的', '/‘æbsəlu:t/', NULL, 4, '2021-04-21 13:45:11', '2021-04-21 13:45:11', NULL);
INSERT INTO `word` VALUES (29, 'aboard', ' ad.在船(车)上;上船', '/ə’bɔ:d/', NULL, 4, '2021-04-21 13:45:11', '2021-04-21 13:45:11', NULL);
INSERT INTO `word` VALUES (30, 'absolutely', ' ad.完全地;绝对地', '/‘æbsəlu:tli/', NULL, 4, '2021-04-21 13:45:11', '2021-04-21 13:45:11', NULL);
INSERT INTO `word` VALUES (31, 'absorb', ' vt.吸收;使专心', '/əb’sɔ:b/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (32, 'abstract', ' n.摘要', '/’æbstrækt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (33, 'abundant', ' a.丰富的;大量的', '/ə’bΛndənt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 14:24:02', NULL);
INSERT INTO `word` VALUES (34, 'abuse', ' vt.滥用;虐待 n.滥用', '/ə’bju:z, ə’bju:s/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (35, 'academic', ' a.学院的;学术的', '/ækə’demik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (36, 'accelerate', ' vt.(使)加快;促进', '/æk’seləreit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (37, 'access', ' n.接近;通道，入口', '/‘ækses/', NULL, 4, '2021-04-21 13:45:53', '2021-05-07 17:44:51', NULL);
INSERT INTO `word` VALUES (38, 'accidental', ' a.偶然的;非本质的', '/æksi’dentl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (39, 'accommodate ', 'vt.容纳;供应，供给', '/ә’kɔmәdeit/', NULL, 8, '2021-04-21 13:45:53', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (40, 'accommodation', ' n.招待设备;预定铺位', '/ə,kɔmə’deiʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (41, 'accompany', ' vt.陪伴，陪同;伴随', '/ə’kΛmpəni/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (42, 'accomplish', ' vt.达到(目的);完成', '/ə’kɔmpliʃ/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (43, 'accordance', ' n.一致;和谐;授予', '/ə’kɔr:dəns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (44, 'accordingly', ' ad.因此，所以;照着', '/ə’kɔr:diŋli/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (45, 'account', ' n.记述;解释;帐目', '/ə’kaunt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (46, 'accumulate', ' vt.积累 vi.堆积', '/ə’kju:mjuleit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (47, 'accuracy', ' n.准确(性);准确度', '/‘ækjurəsi/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (48, 'accurate', ' a.准确的，正确无误的', '/‘ækjurit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (49, 'accustomed', ' a.惯常的;习惯的', '/ə’kΛstəmd/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (50, 'acid', ' n.酸;酸的，酸性的', '/‘æsid/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (51, 'acquaintance', ' n.认识;了解;熟人', '/ə’kweintəns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (52, 'acre', ' n.英亩(=6.07亩)', '/‘eikə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (53, 'adapt', ' vt.使适应;改编', '/ə’dæpt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (54, 'addition', ' n.加，加法;附加物', '/ə’diʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (55, 'additional', ' a.附加的，追加的', '/ə’diʃənl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (56, 'address ', ' n.地址;演说;谈吐', '/ə’dres/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (57, 'adequate', ' a.足够的;可以胜任的', '/‘ædikwit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (58, 'adjust', ' vt.调整，调节;校正', '/ə’dʒΛst/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (59, 'administration ', ' n.管理;管理部门', '/ədminis’treiʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (60, 'admission', ' n.允许进入;承认', '/əd’miʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (61, 'admit', ' vt.承认;准许…进入', '/əd’mit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (62, 'advanced', ' a.先进的;高级的', '/əd’va:nst/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (63, 'advance', ' vi.前进;提高 n.进展', '/əd’va:ns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (64, 'adventure', ' n.冒险;惊险活动', '/əd’ventʃə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (65, 'advisable', ' n.明智的;可取的', '/əd’vaizəbl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (66, 'affair', ' n.事情，事件;事务', '/ə’feə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (67, 'affect', ' vt.影响;感动', '/ə’fekt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (68, 'affection', ' n.慈爱，爱;爱慕', '/ə’fekʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (69, 'afford', ' vt.担负得起…;提供', '/ə’fɔr:d/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (70, 'afterward', ' ad.后来，以后', '/‘a:ftəwəd(z)/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (71, 'age', ' vt.变老', '/eidʒ/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (72, 'aggressive', ' a.侵略的;好斗的', '/ə’gresiv/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (73, 'alcohol', ' n.酒精，乙醇', '/‘ælkəhɔl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (74, 'alloy', ' n.合金;(金属的)成色', '/‘ælɔi, ə’lɔi/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (75, 'alphabet', ' n.字母表，字母系统', '/‘ælfəbit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (77, 'alternative', ' n.替换物;取舍，抉择', '/ɔ:l’tə:nətiv/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (78, 'altitude', ' n.高，高度;高处', '/‘æltitju:d/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (79, 'aluminium', ' n.铝', '/ælju’minjəm/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (80, 'amaze', ' vt.使惊奇，使惊愕', '/ə’meiz/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (81, 'ambulance', ' n.救护车;野战医院', '/‘æmbjuləns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (82, 'amongst', ' prep在…之中(=among)', '/ə’mΛŋst/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (83, 'amuse', ' vt.逗…乐;给…娱乐', '/ə’mju:z/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (84, 'analyse', ' vt.分析，分解，解析', '/‘ænəlaiz/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (85, 'analysis', ' n.分析，分解，解析', '/ə’næləsis/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (86, 'ancestor', ' n.祖宗，祖先', '/‘ænsistə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (87, 'anchor', ' n.锚 vi.抛锚，停泊', '/‘æŋkə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (88, 'ancient', ' a.古代的，古老的', '/‘einʃənt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (89, 'ankle', ' n.踝，踝节部', '/‘æŋkl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (90, 'announce', ' vt.宣布，宣告，发表', '/ə’nauns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (91, 'annoy', ' vt.使恼怒;打搅', '/ə’nɔi/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (92, 'annual', ' a.每年的 n.年报', '/‘ænjuəl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (93, 'anticipate', ' vt.预料，预期，期望', '/æn’tisipeit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (94, 'anxiety', ' n.焦虑，忧虑;渴望', '/æŋg’zaiəti/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (95, 'anxious', ' a.忧虑的;渴望的', '/‘æŋkʃəs/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (96, 'apart', ' ad.相隔;分开;除去', '/ə’pa:t/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (97, 'apologize', ' vi.道歉，谢罪，认错', '/ə’pɔlədʒaiz/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (98, 'apparatus', ' n.器械，仪器;器官', '/,æpə’reitəs/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (99, 'appeal', ' vi.&amp;n.呼吁;申述', '/ə’pi:l/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (100, 'appetite', ' n.食欲，胃口;欲望', '/‘æpitait/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (101, 'appliance', ' n.用具，器具，器械', '/ə’plaiəns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (102, 'applicable', ' a.能应用的;适当的', '/‘æplikəbl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (103, 'application', ' n.请求，申请;施用', '/æpli’keiʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (104, 'appɔint', ' vt.任命，委任;约定', '/ə’pɔint/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (105, 'appreciate', ' vt.欣赏;领会;感谢', '/ə’pri:ʃieit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (106, 'approval', ' n.赞成，同意;批准', '/ə’pru:vəl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (107, 'approve', ' vt.赞成，称许;批准', '/ə’pru:v/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (108, 'approximate', ' a.近似的 vt.近似', '/ə’prɔksimit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (109, 'arbitrary', ' a.随心所欲的;专断的', '/‘a:bitrəri/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (110, 'architecture', ' n.建筑学;建筑式样', '/‘a:kitektʃə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (111, 'argue', ' vi.争论，争辩，辩论', '/‘a:gju:/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (112, 'argument', ' n.争论，辩论;理由', '/‘a:gju:mənt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (113, 'arise', ' vi.出现;由…引起', '/ə’raiz/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (114, 'arithmetic', ' n.算术，四则运算', '/ə’riθmətik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (115, 'arouse', ' vt.引起，唤起;唤醒', '/ə’rauz/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (116, 'article', ' n.条款;物品', '/‘a:tikl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (117, 'artificial', ' a.人工的;娇揉造作的', '/a:ti’fiʃəl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (118, 'artistic', ' a.艺术的;艺术家的', '/a:’tistik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (119, 'ash', ' n.灰，灰末;骨灰', '/æʃ/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (120, 'ashamed', ' a.惭愧(的);羞耻(的)', '/ə’ʃeimd/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (121, 'aspect', ' n.方面;样子，外表', '/‘æspekt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (122, 'assemble', ' vt.集合，召集;装配', '/ə’sembl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (123, 'assembly', ' n.集合;集会;装配', '/ə’sembli/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (124, 'assess', ' vt.对(财产等)估价', '/ə’ses/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (125, 'assign', ' vt.指派;分配;指定', '/ə’sain/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (126, 'assist', ' vt.援助，帮助;搀扶', '/ə’sist/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (127, 'assistance', ' n. 协助,援助', '/ə’sistəns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (128, 'associate', ' vi.交往 n.伙伴，同事', '/ə’səuʃieit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (129, 'association', ' n.协会，团体;联合', '/əsəusi’eiʃən/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (130, 'assume', ' vt.假定;承担;呈现', '/ə’sju:m/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (131, 'assure', ' vt.使确信;向…保证', '/ə’ʃuə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (132, 'astonish', ' vt.使惊讶，使吃惊', '/əs’tɔniʃ/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (133, 'astronaut', ' n.宇宙航行员，宇航员', '/‘æstʃəunɔ:t/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (134, 'ætlantic', ' a.大西洋的 n.大西洋', '/ət’læntik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (135, 'atom', ' n.原子;微粒;微量', '/‘ætəm/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (136, 'atomic', ' a.原子的;原子能的', '/ə’tɔmik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (137, 'attach', ' vt.缚，系，贴;附加', '/ə’tætʃ/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (138, 'attain', ' vt.达到，获得，完成', '/’tein/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (139, 'attempt', ' vt.尝试，试图 n.企图', '/ə’tempt/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (140, 'attend', ' vt.出席;照顾，护理', '/ə’tend/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (141, 'attribute', ' vt.把…归因于 n.属性', '/‘ætribju:t/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (142, 'audience', ' n.听众，观众，读者', '/‘ɔ:djəns/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (143, 'authority', ' n.当局，官方;权力', '/ɔ:’θɔriti/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (144, 'automatic', ' a.自动的;机械的', '/ɔ:tə’mætik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (145, 'automobile', ' n.汽车，机动车', '/‘ɔ:təməbi:l/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (146, 'auxiliary', ' a.辅助的;附属的', '/ɔ:g’ziljəri/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (147, 'available', ' a.可利用的;通用的', '/ə’veiləbl/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (148, 'avenue', ' n.林荫道，道路;大街', '/‘ævinju:/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (149, 'await', ' vt.等候，期待', '/ə’weit/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (150, 'awake', ' a.醒着的 vt.唤醒', '/ə’weik/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (151, 'award', ' n.奖，奖品;判定', '/ə’wɔ:d/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (152, 'aware', ' a.知道的，意识到的', '/ə’weə/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (153, 'awful', ' a.令人不愉快的', '/‘ɔ:ful/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (154, 'awkward', ' a.笨拙的;尴尬的', '/‘ɔ:kwəd/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (155, 'ax', ' n.斧子', '/æks/', NULL, 4, '2021-04-21 13:45:53', '2021-04-21 13:45:53', NULL);
INSERT INTO `word` VALUES (158, 'background', ' n.背景，后景，经历', '/‘bækgraund/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (159, 'bacteria', ' n.细菌', '/bæk’tiəriə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (160, 'badly', ' ad.坏，差;严重地', '/‘bædli/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (161, 'bad', ' a.坏的，恶的;严重的', '/bæd/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (162, 'backward', ' a.向后的;倒的 ad.倒', '/‘bækwəd/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (163, 'bag', ' n.袋，包，钱包，背包', '/bæg/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (164, 'baggage', ' n.行李', '/‘bægidʒ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (165, 'bake', ' vt.烤，烘，焙;烧硬', '/beik/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (166, 'balance', ' vt.使平衡;称 n.天平', '/‘bæləns/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (167, 'ball', ' n.球，球状物;舞会', '/bɔ:l/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (168, 'balloon', ' n.气球，玩具气球', '/bə’lu:n/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (169, 'banana', ' n.香蕉;芭蕉属植物', '/bə’na:nə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (170, 'band', ' n.乐队;带;波段', '/bænd/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (171, 'bang', ' n.巨响，枪声;猛击', '/bæŋ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (172, 'bank', ' n.银行;库;岩，堤', '/bæŋk/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (173, 'bar', ' n.酒吧间;条，杆;栅', '/ba:/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (174, 'barber', ' n.理发师', '/‘ba:bə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (175, 'bare', ' a.赤裸的;仅仅的', '/beə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (176, 'bargain', ' n.交易 vi.议价;成交', '/‘ba:gin/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (177, 'barrel', ' n.桶;圆筒;枪管', '/‘bærəl/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (178, 'barrier', ' n.栅栏，屏障;障碍', '/‘bæriə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (179, 'base', ' n.基础，底层;基地', '/beis/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (180, 'basic', ' a.基本的，基础的', '/‘beisik/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (181, 'basically', ' ad.基本上', '/‘beisikəli/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (182, 'basin', ' n.盆，洗脸盆;盆地', '/‘beisn/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (183, 'basis', ' n.基础，根据', '/‘beisis/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (184, 'basket', ' n.篮，篓，筐', '/‘ba:skit/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (185, 'basketball', ' n.篮球;篮球运动', '/‘ba:skitbɔ:l/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (186, 'bathe', ' vt.给…洗澡;弄湿', '/beið/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (187, 'bath', ' n.浴，洗澡;浴缸', '/ba:θ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (188, 'bathroom', ' n.浴室;盥洗室', '/‘ba:θrum/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (189, 'battery', ' n.电池;一套，一组', '/‘bætəri/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (190, 'battle', ' n.战役;斗争 vi.作战', '/‘bætl/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (191, 'bay', ' n.湾;山脉中的凹处', '/bei/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (192, 'be', ' aux.v.&amp;vi.是，在，做', '/bi:/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (193, 'beach', ' n.海滩，湖滩，河滩', '/bi:tʃ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (194, 'beam', ' n.梁;横梁;束，柱', '/bi:m/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (195, 'bean', ' n.豆，蚕豆', '/bi:n/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (196, 'bear', ' n.熊;粗鲁的人', '/beə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (197, 'bear', ' vt.容忍;负担;生育', '/beə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (198, 'beard', ' n.胡须，络腮胡子', '/biəd/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (199, 'beast', ' n.兽，野兽;牲畜', '/bi:st/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (200, 'beat', ' vt.&amp;vi.打，敲;打败', '/bi:t/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (201, 'beautiful', ' a.美的，美丽的', '/‘bju:tiful/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (202, 'beauty', ' n.美，美丽;美人', '/‘bju:ti/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (203, 'because', ' conj.由于，因为', '/bi’kɔz/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (204, 'become', ' vi.变成;成为，变得', '/bi’kΛm/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (205, 'bed', ' n.床，床位;圃;河床', '/bed/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (206, 'bee', ' n.蜂，密蜂;忙碌的人', '/bi:/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (207, 'beef', ' n.牛肉;菜牛', '/bi:f/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (208, 'beer', ' n.啤酒', '/biə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (209, 'before', ' prep.在…以前;向…', '/bi’fɔ:/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (210, 'beg', ' vt.&amp;vi.乞求;请求', '/beg/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (211, 'begin', ' vi.开始 vt.开始', '/bi’gin/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (212, 'beginning', ' n.开始，开端;起源', '/bi’giniŋ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (213, 'behalf', ' n.利益，维护，支持', '/bi’ha:f/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (214, 'behave', ' vi.表现，举止;运转', '/bi’heiv/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (215, 'behavior', ' n.行为，举止，态度', '/bi’heivjə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (216, 'behind', ' prep.在…后面', '/bi’haind/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (217, 'being', ' n.存在;生物;生命', '/‘bi:iŋ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (218, 'belief', ' n.信任，相信;信念', '/bi’li:f/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (219, 'believe', ' vt.相信;认为', '/bi’li:v/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (220, 'bell', ' n.钟，铃，门铃;钟声', '/bel/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (221, 'belong', ' vi.属于，附属', '/bi’lɔŋ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (222, 'below', ' prep.在…下面(以下)', '/bi’ləu/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (223, 'belt', ' n.带，腰带;皮带;区', '/belt/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (224, 'bench', ' n.长凳，条凳;工作台', '/bentʃ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (225, 'bend', ' vt.使弯曲 vi.弯曲', '/bend/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (226, 'beneath', ' prep.在…下方', '/bi’ni:θ/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (227, 'beneficial', ' a.有利的，有益的', '/beni’fiʃəl/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (228, 'benefit', ' n.利益;恩惠;津贴', '/‘benifit/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (229, 'beside', ' prep.在…旁边', '/bi’said/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (230, 'besides', ' ad.而且prep.除…之外', '/bi’saidz/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (231, 'best', ' a.最好的;最大的', '/best/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (232, 'bet', ' vt.&amp;vi.&amp;n.打赌', '/bet/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (233, 'better', ' a.较好的 ad.更好地', '/‘betə/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (234, 'between', ' prep.在…中间', '/bi’twi:n/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (235, 'beyond', ' prep.在…的那边', '/bi’jɔnd/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (236, 'Bible', ' n.基督教《圣经》', '/‘baibl/', NULL, 4, '2021-04-21 13:47:16', '2021-04-21 13:47:16', NULL);
INSERT INTO `word` VALUES (237, 'bicycle', ' n.自行车，脚踏车', '/‘baisikl/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (238, 'big', ' a.大的，巨大的', '/big/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (239, 'bike', ' n.自行车 vi.骑自行车', '/baik/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (240, 'bill', ' n.账单;招贴;票据', '/bil/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (241, 'billion', ' num.万亿(英)', '/‘biljən/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (242, 'bind', ' vt.捆绑;包扎;装钉', '/baind/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (243, 'biology', ' n.生物学;生态学', '/bai’ɔlədʒi/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (244, 'bird', ' n.鸟，禽', '/bə:d/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (245, 'birth', ' n.分娩，出生;出身', '/bə:θ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (246, 'birthday', ' n.生日，诞生的日期', '/‘bə:θdi/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (247, 'biscuit', ' n.(英)饼干;(美)软饼', '/‘biskit/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (248, 'bit', ' n.一点，一些，小片', '/bit/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (249, 'bite', ' vt.咬，叮，螫;剌穿', '/bait/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (250, 'bitter', ' a.痛苦的;严寒的', '/‘bitə/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (251, 'black', ' a.黑色的;黑暗的', '/blæk/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (252, 'blackboard', ' n.黑板', '/‘blækbɔ:d/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (253, 'blade', ' n.刀刃，刀片;叶片', '/bleid/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (254, 'blame', ' vt.责备，把…归咎于', '/bleim/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (255, 'blank', ' a.空白的 n.空白', '/blæŋk/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (256, 'blanket', ' n.毛毯，毯子，羊毛毯', '/‘blæŋkit/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (257, 'blast', ' n.爆炸，冲击波 vt.炸', '/bla:st/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (258, 'bleed', ' vi.出血，流血;泌脂', '/bli:d/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (259, 'blend', ' vt.&amp;vi.&amp;n.混和', '/blend/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (260, 'blind', ' a.瞎的;盲目的', '/blaind/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (261, 'block', ' n.街区 vt.堵塞，拦阻', '/blɔk/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (262, 'blood', ' n.血，血液;血统', '/blΛd/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (263, 'bloom', ' n.花;开花，开花期', '/blu:m/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (264, 'blow', ' vi.吹，吹动;吹响', '/bləu/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (265, 'blue', ' a.蓝色的 n.蓝色', '/blu:/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (266, 'board', ' n.板 vt.上(船、车等)', '/bɔ:d/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (267, 'boast', ' vi.自夸 vt.吹嘘', '/bəust/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (268, 'boat', ' n.小船，艇;渔船', '/bəut/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (269, 'body', ' n.身体;主体;尸体', '/‘bɔdi/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (270, 'bold', ' a.大胆的;冒失的', '/bəuld/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (271, 'bolt', ' n.螺栓;插销 vt.闩门', '/bəult/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (272, 'bomb', ' n.炸弹 vt.轰炸', '/bɔm/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (273, 'bond', ' n.联结，联系;公债', '/bɔnd/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (274, 'bone', ' n.骨，骨骼', '/bəun/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (275, 'book', ' n.书，书籍 vt.预定', '/buk/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (276, 'boot', ' n.靴子，长统靴', '/bu:t/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (277, 'border', ' n.边，边缘;边界', '/‘bɔ:də/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (278, 'bore', ' vt.使厌烦;钻，挖', '/bɔ:/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (279, 'born', ' a.天生的;出生的', '/bɔ:n/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (280, 'borrow', ' vt.借，借用，借人', '/‘bɔrəu/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (281, 'boss', ' n.老板，上司 vt.指挥', '/bɔs/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (282, 'both', ' pron.两者(都)', '/bəuθ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (283, 'bother', ' vt.烦扰，迷惑 n.麻烦', '/‘bɔðə/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (284, 'bottle', ' n.瓶，酒瓶;一瓶', '/‘bɔtl/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (285, 'bottom', ' n.底，底部，根基', '/‘bɔtəm/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (286, 'bounce', ' vi.反跳，弹起;跳起', '/bauns/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (287, 'bound', ' a.一定的;有义务的', '/baund/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (288, 'boundary', ' n.分界线，办界', '/‘baundəri/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (289, 'bow', ' n.弓;蝴蝶结;鞠躬', '/bau/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (290, 'bowl', ' n.碗，钵;碗状物', '/bəul/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (291, 'box', ' n.箱，盒;包箱', '/bɔks/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (292, 'box', ' vi. 拳击，打拳', '/bɔks/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (293, 'boy', ' n.男孩，少年;家伙', '/bɔi/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (294, 'brain', ' n.脑，脑髓;脑力', '/brein/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (295, 'brake', ' n.闸，刹车 vi.制动', '/breik/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (296, 'branch', ' n.树枝;分部;分科', '/bra:ntʃ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (297, 'brand', ' n.商品;烙印 vt.铭刻', '/brænd/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (298, 'brass', ' n.黄铜;黄铜器', '/bra:s/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (299, 'brave', ' a.勇敢的，华丽的', '/breiv/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (300, 'bread', ' n.面包;食物，粮食', '/bred/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (301, 'breadth', ' n.宽度，幅度;幅面', '/bredð/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (302, 'break', ' vt.打破;损坏;破坏', '/breik/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (303, 'breakfast', ' n.早饭，早餐', '/‘brekfəst/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (304, 'breast', ' n.乳房;胸脯，胸膛', '/brest/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (305, 'breath', ' n.气息，呼吸;气味', '/breθ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (306, 'breathe', ' vi.呼吸 vt.呼吸', '/bri:ð/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (307, 'breed', ' n.品种 vt.使繁殖', '/bri:d/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (308, 'breeze', ' n.微风，和风', '/bri:z/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (309, 'brick', ' n.砖，砖块;砖状物', '/brik/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (310, 'bride', ' n. 新娘', '/braid/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (311, 'bridge', ' n.桥，桥梁;桥牌', '/bridʒ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (312, 'brief', ' a.简短的;短暂的', '/bri:f/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (313, 'bright', ' a.明亮的;聪明的', '/brait/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (314, 'brilliant', ' a.光辉的;卓越的', '/‘briljənt/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (315, 'bring', ' vt.带来;引出;促使', '/briŋ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (316, 'British', ' a.不列颠的，英联邦的', '/‘britiʃ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (317, 'broad', ' a.宽的，阔的;广泛的', '/brɔ:d/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (318, 'broadcast', ' n.广播，播音', '/‘brɔ:dka:st/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (319, 'brother', ' n.兄弟;同事，同胞', '/‘brΛðə/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (320, 'brow', ' n.额;眉，眉毛', '/brau/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (321, 'brown', ' n.褐色，棕色', '/braun/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (322, 'brush', ' n.刷子，毛刷;画笔', '/brΛʃ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (323, 'bubble', ' n.泡 vi.冒泡，沸腾', '/‘bΛbl/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (324, 'bucket', ' n.水桶;吊桶;铲斗', '/‘bΛkit/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (325, 'build', ' vt.建筑;建立;创立', '/bild/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (326, 'building', ' n.建筑物，大楼;建筑', '/‘bildiŋ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (327, 'bulb', ' n.电灯泡;球状物', '/bΛlb/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (328, 'bulk', ' n.物体，容积，大批', '/bΛlk/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (329, 'bullet', ' n.枪弹，子弹，弹丸', '/‘bulit/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (330, 'bundle', ' n.捆，包，束;包袱', '/‘bΛndl/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (331, 'burden', ' n.担子，重担;装载量', '/‘bə:dn/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (332, 'bureau', ' n.局，司，处;社，所', '/‘bjuərəu/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (333, 'burn', ' vi.烧，燃烧 n.烧伤', '/bə:n/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (334, 'bury', ' vt.埋葬，葬;埋藏', '/‘beri/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (335, 'bus', ' n.公共汽车', '/bΛs/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (336, 'bush', ' n.灌木，灌木丛，矮树', '/buʃ/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (337, 'business', ' n.商业，生意;事务', '/‘biznis/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (338, 'busy', ' a.忙的，繁忙的', '/‘bizi/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (339, 'but', ' conj.但是，可是', '/bΛt/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (340, 'butter', ' n.黄油;奶油', '/‘bΛtə/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (341, 'button', ' n.扣子;按钮 vt.扣紧', '/‘bΛtn/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (342, 'buy', ' vt.买，购买 vi.买', '/bai/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (343, 'by', ' prep.在…旁;被，由', '/bai/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (344, 'bɔil', ' vi.沸腾;汽化vt.煮沸', '/bɔil/', NULL, 4, '2021-04-21 13:47:17', '2021-04-21 13:47:17', NULL);
INSERT INTO `word` VALUES (345, 'cabbage', ' n.洋白菜，卷心菜', '/‘kæbidʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (346, 'cabin', ' n.小屋;船舱，机舱', '/‘kæbin/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (347, 'cabinet', ' n.橱，柜;内阁', '/‘kæbinit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (348, 'cafe', ' n.咖啡馆;小餐厅', '/‘kæfei, kə’fei/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (349, 'cable', ' n.缆，索;电缆;电报', '/‘keibl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (350, 'cage', ' n.笼;鸟笼，囚笼', '/keidʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (351, 'cake', ' n.饼，糕，蛋糕', '/keik/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (352, 'calculate', ' vt.计算;估计;计划', '/‘kælkjuleit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (353, 'calculator', ' n.计算器，计算者', '/‘kælkjuleitə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (354, 'calendar', ' n. 日历，历书;历法', '/‘kælində/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (355, 'call', ' vt.把…叫做;叫，喊', '/kɔ:l/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (356, 'calm', ' a.静的，平静的', '/ka:m/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (357, 'camel', ' n.骆驼', '/‘kæməl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (358, 'camera', ' n.照相机，摄影机', '/‘kæmərə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (359, 'camp', ' n.野营，营地，兵营', '/kæmp/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (360, 'campaign', ' n.战役;运动', '/kæm’pein/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (361, 'campus', ' n.校园，学校场地', '/‘kæmpəs/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (362, 'can', ' aux.v.能，会，可能', '/kæn/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (363, 'can', ' n.罐头，听头;容器', '/kæn/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (364, 'Canadian', ' a.加拿大的', '/kə’neidjən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (365, 'canal', ' n.运河;沟渠;管', '/kə’næl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (366, 'cancel', ' vt.取消，撤消;删去', '/‘kænsəl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (367, 'cancer', ' n.癌，癌症，肿瘤', '/‘kænsə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (368, 'candidate', ' n.候选人;投考者', '/‘kændidit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (369, 'candle', ' n.蜡烛;烛形物;烛光', '/‘kændl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (370, 'cap', ' n.帽子，便帽;帽状物', '/kæp/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (371, 'capable', ' a.有能力的，有才能的', '/‘keipəbl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (372, 'capacity', ' n.容量;能力;能量', '/kə’pæsiti/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (373, 'capital', ' n.资本，资金;首都', '/‘kæpitl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (374, 'captain', ' n.陆军上尉;队长', '/‘kæptin/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (375, 'capture', ' vt.捕获，俘获;夺得', '/‘kæptʃə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (376, 'car', ' n.汽车，小汽车，轿车', '/ka:/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (377, 'carbon', ' n.碳', '/‘ka:bən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (378, 'card', ' n.卡，卡片，名片', '/ka:d/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (379, 'care', ' vi.关心，介意 n.小心', '/keə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (380, 'career', ' n.生涯，职业，经历', '/kə’riə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (381, 'careful', ' a.仔细的;细致的', '/‘keəful/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (382, 'careless', ' a.粗心的，漫不经心的', '/‘keəlis/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (383, 'cargo', ' n.船货，货物', '/‘ka:gəu/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (384, 'carpenter', ' n.木工，木匠', '/‘ka:pintə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (385, 'carpet', ' n.地毯，毡毯，毛毯', '/‘ka:pit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (386, 'carriage', ' n.客车厢;四轮马车', '/‘kæridʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (387, 'carrier', ' n.运输工具;运载工具', '/‘kæriə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (388, 'carry', ' vt.携带;运载;传送', '/‘kæri/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (389, 'cart', ' n.二轮运货马车', '/ka:t/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (390, 'case', ' n.情况;事实;病例', '/keis/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (391, 'case', ' n.箱(子)，盒(子)，套', '/keis/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (392, 'cash', ' n.现金，现款', '/kæʃ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (393, 'cassette', ' n.盒式录音带;盒子', '/ka:’set/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (394, 'cast', ' vt.投，扔，抛;浇铸', '/ka:st/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (395, 'castle', ' n.城堡;巨大建筑物', '/‘ka:sl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (396, 'casual', ' a.偶然的;随便的', '/‘kæʒjuəl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (397, 'cat', ' n.猫，猫科，猫皮', '/kæt/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (398, 'catalog', ' n.目录，目录册', '/‘kætəlɔg/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (399, 'catch', ' vt.捉住;赶上;领会', '/kætʃ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (400, 'cause', ' n.原因，理由;事业', '/kɔ:z/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (401, 'cave', ' n.山洞，洞穴，窑洞', '/keiv/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (402, 'cease', ' vi.&amp;vi.&amp;n.停止，停息', '/si:s/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (403, 'ceiling', ' n. 天花板，顶蓬', '/‘si:liŋ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (404, 'cattle', ' n.牛;牲口，家畜', '/‘kætl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (405, 'celebrate', ' vt.庆祝;歌颂，赞美', '/‘selibreit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (406, 'cell', ' n.细胞;小房间', '/sel/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (407, 'cement', ' n.水泥;胶泥 vt.粘结', '/si’ment/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (408, 'cent', ' n.分;分币;百', '/sent/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (409, 'centimetre', ' n.公分，厘米', '/‘sentimi:tə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (410, 'central', ' a.中心的;主要的', '/‘sentrəl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (411, 'centre', ' n.中心;中枢 vt.集中', '/‘sentə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (412, 'century', ' n.世纪，百年', '/‘sentʃuri/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (413, 'ceremony', ' n.典礼，仪式;礼节', '/‘seriməni/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (414, 'certain', ' a.确实的;肯定的', '/‘sə:tən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (415, 'certainly', ' ad.一定，必定;当然', '/‘sə:tənli/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (416, 'certificate', ' n.证书，证件，执照', '/sə’tifikit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (417, 'chain', ' n.链，链条，项圈', '/tʃein/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (418, 'chair', ' n.椅子;主席', '/tʃeə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (419, 'chairman', ' n.主席;议长，会长', '/‘tʃeəmən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (420, 'chalk', ' n.白垩;粉笔', '/tʃɔ:k/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (421, 'challenge', ' n.挑战;要求，需要', '/‘tʃæləndʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (422, 'chamber', ' n.会议室;房间;腔', '/‘tʃeimbə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (423, 'champion', ' n.冠军，得胜者', '/‘tʃæmpjən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (424, 'chance', ' n.机会，机遇;可能性', '/tʃa:ns/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (425, 'change', ' n.改变，变化;零钱', '/tʃeindʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (426, 'channel', ' n.海峡;渠道;频道', '/‘tʃænl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (427, 'chapter', ' n.章，回，篇', '/‘tʃæptə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (428, 'character', ' n.性格;特性;角色', '/‘kæriktə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (429, 'characteristic', ' a.特有的 n.特性', '/kæriktə’ristik/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (430, 'charge', ' vt.索价;控告 n.费用', '/tʃa:dʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (431, 'chart', ' n.图，图表;海图', '/tʃa:t/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (432, 'chase', ' n.追逐，追赶，追求', '/tʃeis/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (433, 'cheap', ' a.廉价的;劣质的', '/tʃi:p/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (434, 'cheat', ' vt.骗取;哄 vi.行骗', '/tʃi:t/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (435, 'check', ' vt.检查;制止 n.检查', '/tʃek/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (436, 'cheek', ' n.面颊，脸蛋', '/tʃi:k/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (437, 'cheer', ' vt.使振作;欢呼', '/tʃiə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (438, 'cheerful', ' a.快乐的，愉快的', '/‘tʃiəful/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (439, 'cheese', ' n.乳酪，干酪', '/tʃi:z/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (440, 'chemical', ' a.化学的 n.化学制品', '/‘kemikl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (441, 'chemist', ' n.化学家;药剂师', '/‘kemist/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (442, 'chemistry', ' n.化学', '/‘kemistri/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (443, 'cheque', ' n.支票', '/tʃek/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (444, 'chess', ' n.棋;国际象棋', '/tʃes/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (445, 'chest', ' n.胸腔，胸膛;箱子', '/tʃest/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (446, 'chew', ' vt.咀嚼，嚼碎', '/tʃu:/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (447, 'chicken', ' n.小鸡，小鸟;鸡肉', '/‘tʃikin/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (448, 'chief', ' a.主要的;首席的', '/tʃi:f/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (449, 'child', ' n.小孩，儿童;儿子', '/tʃaild/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (450, 'childhood', ' n.童年，幼年;早期', '/‘tʃaildhud/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (451, 'chill', ' vt.使变冷 n.寒冷', '/tʃil/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (452, 'chimney', ' n.烟囱，烟筒;玻璃罩', '/‘tʃimni/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (453, 'chin', ' n.颏，下巴', '/tʃin/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (454, 'China', ' n.中国', '/‘tʃainə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (455, 'china', ' n.瓷器，瓷料', '/‘tʃainə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (456, 'Chinese', ' a.中国的 n.中国人', '/‘tʃai’ni:z/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (457, 'chocolate', ' n.巧克力;巧克力糖', '/‘tʃɔkəlit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (458, 'chɔice', ' n.选择，抉择', '/tʃɔis/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (459, 'choke', ' vt.使窒息;塞满', '/tʃəuk/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (460, 'choose', ' vt.选择，挑选;情愿', '/tʃu:z/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (461, 'chop', ' vt.砍，劈;切细vi.砍', '/tʃɔp/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (462, 'Christian', ' n.基督教徒;信徒', '/‘kristiən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (463, 'Christmas', ' n.圣诞节', '/‘krisməs/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (464, 'church', ' n.教堂，礼拜堂;教会', '/tʃə:tʃ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (465, 'cigarette', ' n.香烟，纸烟，卷烟', '/sigə’ret/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (466, 'cinema', ' n.电影院;电影，影片', '/‘sinimə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (467, 'circle', ' n.圆，圆周;圈子', '/‘sə:kl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (468, 'circuit', ' n.电路;环行;巡行', '/‘sə:kit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (469, 'circular', ' a.圆的;循环的', '/‘sə:kjulə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (470, 'circulate', ' vt.使循环 vi.循环', '/‘sə:kjuleit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (471, 'circumference', ' n.圆周，周长，圆周线', '/sə’kΛmfərəns/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (472, 'circumstance', ' n.情况，条件;境遇', '/‘sə:kəmstəns/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (473, 'citizen', ' n.公民;市民，居民', '/‘sitizn/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (474, 'city', ' n.城市，都市', '/‘siti/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (475, 'civil', ' a.公民的;文职的', '/‘sivl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (476, 'civilization', ' n.文明，文化;开化', '/sivilai’zeiʃən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (477, 'civilize', ' vt.使文明;教育', '/‘sivilaiz/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (478, 'claim', ' vt.声称，主张;索取', '/kleim/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (479, 'clap', ' vi.拍手 vt.拍，轻拍', '/klæp/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (480, 'clarify', ' vt.澄清，阐明', '/‘klærifai/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (481, 'class', ' n.班，班级;阶级', '/kla:s/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (482, 'classical', ' a.古典的;经典的', '/‘klæsikəl/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (483, 'classification', ' n.分类;分级;分类法', '/klæsifi’keiʃən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (484, 'classify', ' vt.把…分类', '/‘klæsifai/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (485, 'classmate', ' n.同班同学', '/‘kla:smeit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (486, 'classroom', ' n.教室，课堂', '/‘kla:srum/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (487, 'claw', ' n.爪，脚爪，螯', '/klɔ:/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (488, 'clay', ' n.粘土，泥土;肉体', '/klei/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (489, 'clean', ' a.清洁的;纯洁的', '/kli:n/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (490, 'clear', ' a.清晰的 vt.清除', '/kliə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (491, 'clerk', ' n.店员;办事员，职员', '/kla:k, klə:k/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (492, 'clever', ' a.聪明的;机敏的', '/‘klevə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (493, 'cliff', ' n.悬崖，峭壁', '/klif/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (494, 'climate', ' n.气候;风土，地带', '/‘klaimit/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (495, 'climb', ' vi.攀登，爬 vt.爬', '/klaim/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (496, 'clock', ' n.钟，仪表', '/klɔk/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (497, 'close', ' vt.关，闭;结束', '/kləuz, kləus/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (498, 'cloth', ' n.布;衣料;桌布', '/klɔ:θ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (499, 'clothe', ' vt.给…穿衣服', '/kləuð/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (500, 'clothes', ' n.衣服，服装;被褥', '/kləuðz/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (501, 'clothing', ' n.衣服，被褥', '/‘kləuðiŋ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (502, 'cloud', ' n.云;云状物;阴影', '/klaud/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (503, 'cloudy', ' a.多云的;云一般的', '/klaudi/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (504, 'club', ' n.俱乐部，夜总会', '/klΛb/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (505, 'clue', ' n.线索，暗示，提示', '/klu:/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (506, 'clumsy', ' a.笨拙的;愚笨的', '/‘klΛmzi/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (507, 'coach', ' n.长途公共汽车', '/kəutʃ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (508, 'coal', ' n.煤，煤块', '/kəul/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (509, 'coarse', ' a.粗的，粗糙的', '/kɔ:s/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (510, 'coast', ' n.海岸，海滨(地区)', '/kəust/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (511, 'coat', ' n.外套，上衣;表皮', '/kəut/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (512, 'cock', ' n.公鸡;雄禽;旋塞', '/kɔk/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (513, 'code', ' n.准则;法典;代码', '/kəud/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (514, 'coffee', ' n.咖啡，咖啡茶', '/‘kɔfi/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (515, 'cɔil', ' n.(一)卷;线圈 vt.卷', '/kɔil/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (516, 'cɔin', ' n.硬币;铸造(硬币)', '/kɔin/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (517, 'cold', ' a.冷的;冷淡的 n.冷', '/kəuld/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (518, 'collapse', ' vi.倒坍;崩溃，瓦解', '/kə’læps/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (519, 'collar', ' n.衣领，项圈', '/‘kɔlə/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (520, 'colleague', ' n.同事，同僚', '/‘kɔli:g/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (521, 'collect', ' vt.收集 vi.收款', '/kə’lekt/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (522, 'collection', ' n.搜集，收集;收藏品', '/kə’lekʃən/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (523, 'collective', ' a.集体的;集合性的', '/kə’lektiv/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (524, 'college', ' n.学院;大学', '/‘kɔlidʒ/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (525, 'collision', ' n.碰撞;冲突', '/kə’liʒ(ə)n/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (526, 'colony', ' n.殖民地;侨居地', '/‘kɔləni/', NULL, 4, '2021-04-21 13:50:10', '2021-04-21 13:50:10', NULL);
INSERT INTO `word` VALUES (527, 'color', ' n.颜色，彩色;颜料', '/‘kΛlə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (528, 'column', ' n.柱，支柱，圆柱', '/‘kɔləm/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (529, 'comb', ' n.梳子 vt.梳理', '/kəum/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (530, 'combination', ' n.结合，联合;化合', '/kɔmbi’neiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (531, 'combine', ' vt.使结合;兼有', '/kəm’bain/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (532, 'come', ' vi.来，来到;出现', '/kΛm/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (533, 'comfort', ' n.舒适;安慰 vt.安慰', '/‘kΛmfət/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (534, 'comfortable', ' a.舒适的，安慰的', '/‘kΛmfətəbl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (535, 'command', ' vt.命令，指挥;控制', '/kə’ma:nd/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (536, 'commander', ' n.司令官，指挥员', '/kə’ma:ndə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (537, 'comment', ' n.评论，意见;注释', '/‘kɔment/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (538, 'commerce', ' n.商业，贸易;社交', '/‘kɔmə(:)s/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (539, 'commercial', ' a.商业的;商品化的', '/kə’mə:ʃəl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (540, 'commission', ' n.委任状;委员会', '/kə’miʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (541, 'commit', ' vt.犯(错误);干(坏事)', '/kə’mit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (542, 'committee', ' n.委员会;全体委员', '/kə’miti/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (543, 'common', ' a.普通的;共同的', '/‘kɔmən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (544, 'communicate', ' vi.通讯;传达;传播', '/kə’mju:nikeit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (545, 'communication', ' n.通讯;传达;交通', '/kə’mju:nikeiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (546, 'communism', ' n.共产主义', '/‘kɔmjunizəm/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (547, 'communist', ' n.共产党员', '/‘kɔmjunist/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (548, 'community', ' n.社区;社会;公社', '/kə’mju:niti/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (549, 'companion', ' n.同伴;共事者;伴侣', '/kəm’pæniən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (550, 'company', ' n.公司，商号;同伴', '/‘kΛmpəni/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (551, 'comparative', ' a.比较的，相对的', '/kəm’pærətiv/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (552, 'compare', ' vt.比较，对照;比作', '/kəm’peə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (553, 'comparison', ' n.比较，对照;比似', '/kəm’pærisn/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (554, 'compass', ' n.罗盘，指南针;圆规', '/‘kΛmpəs/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (555, 'compel', ' vt.强迫，迫使屈服', '/kəm’pel/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (556, 'compete', ' vi.比赛;竞争;对抗', '/kəm’pi:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (557, 'competent', ' a.有能力的;应该做的', '/‘kɔmpitənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (558, 'competition', ' n.竞争，比赛', '/kɔmpə’tiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (559, 'complain', ' vi.抱怨，拆苦;控告', '/kəm’plein/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (560, 'complaint', ' n.抱怨;怨言;控告', '/kəm’pleint/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (561, 'complete', ' a.完整的;完成的', '/kəm’pli:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (562, 'complex', ' a.结合的;复杂的', '/‘kɔmpleks/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (563, 'complicated', ' a.复杂的，难懂的', '/‘kɔmplikeitid/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (564, 'component', ' n.组成部分;分;组件', '/kəm’pəunənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (565, 'compose', ' vt.组成，构成;创作', '/kəm’pəuz/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (566, 'composition', ' n.构成;作品;写作', '/kɔmpə’ziʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (567, 'compound', ' n.化合物;复合词', '/‘kɔmpaund, kəm’paund/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (568, 'comprehension', ' n.理解，理解力;领悟', '/kɔmpri’henʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (569, 'comprehensive', ' a.广泛的;理解的', '/kɔmpri’hensiv/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (570, 'compress', ' vt.压紧，压缩', '/kəm’pres/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (571, 'comprise', ' vt.包含，包括;构成', '/kəm’praiz/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (572, 'compromise', ' n.妥协，和解', '/‘kɔmprəmaiz/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (573, 'compute', ' vt.计算，估计，估算', '/kəm’pju:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (574, 'computer', ' n.计算机，电脑', '/kəm’pju:tə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (575, 'conceal', ' vt.把…隐藏起来', '/kən’si:l/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (576, 'concentrate', ' vt.集中;聚集;浓缩', '/‘kɔnsəntreit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (577, 'concentration', ' n.集中;专注;浓缩', '/kɔnsən’treiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (578, 'concept', ' n.概念，观念，设想', '/‘kɔnsept/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (579, 'concern', ' n.关心，挂念;关系', '/kən’sə:n/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (580, 'concerning', ' prep.关于', '/kən’sə:niŋ/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (581, 'concert', ' n.音乐会，演奏会', '/‘kɔnsət/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (582, 'conclude', ' vt.推断出;结束', '/kən’klu:d/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (583, 'conclusion', ' n.结论，推论;结尾', '/kən’klu:ʒən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (584, 'concrete', ' n.混凝土;具体物', '/‘kɔnkri:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (585, 'condemn', ' vt.谴责，指责;判刑', '/kən’dem/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (586, 'condense', ' vt.压缩，使缩短', '/kən’dens/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (587, 'condition', ' n.状况，状态;环境', '/kən’diʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (588, 'conduct', ' n.举止，行为;指导', '/‘kɔndəkt, kən’dΛkt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (589, 'conductor', ' n.售票员;(乐队)指挥', '/kən’dΛktə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (590, 'conference', ' n.会议，讨论会', '/‘kɔnfərəns/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (591, 'confess', ' vt.供认，承认;坦白', '/kən’fes/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (592, 'confidence', ' n.信任;信赖;信心', '/‘kɔnfidəns/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (593, 'confident', ' n.确信的，自信的', '/‘kɔnfidənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (594, 'confine', ' vt.限制;禁闭', '/kən’fain/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (595, 'confirm', ' vt.证实，肯定;批准', '/kən’fə:m/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (596, 'conflict', ' n.争论;冲突;斗争', '/‘kɔnflikt, kən’flikt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (597, 'confuse', ' vt.使混乱，混淆', '/kən’fju:z/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (598, 'congratulate', ' vt.祝贺，向…道喜', '/kən’grætjuleit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (599, 'congress', ' n.大会;国会，议会', '/‘kɔŋgres/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (600, 'conjunction', ' n.接合，连接;连接词', '/kən’dʒΛŋkʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (601, 'connect', ' vt.连接，连结;联系', '/kə’nekt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (602, 'connection', ' n.连接，联系;连贯性', '/kə’nekʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (603, 'conquer', ' vt.征服，战胜;破除', '/‘kɔŋkə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (604, 'conquest', ' n.攻取，征服;克服', '/‘kɔŋkwest/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (605, 'conscience', ' n.良心，道德心', '/‘kɔnʃəns/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (606, 'conscious', ' a.意识到的;有意的', '/‘kɔnʃəs/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (607, 'consciousness', ' n.意识，觉悟;知觉', '/‘kɔnʃəsnis/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (608, 'consent', ' n.同意，赞成 vi.同意', '/kən’sent/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (609, 'consequence', ' n.结果，后果', '/‘kɔnsikwəns/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (610, 'consequently', ' ad.因此，因而，所以', '/‘kɔnsikwəntli/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (611, 'conservation', ' n.保存，保护;守恒', '/kɔnsə(:)’veiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (612, 'conservative', ' a.保守的 n.保守的人', '/kən’sə:vətiv/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (613, 'consider', ' vt.认为;考虑;关心', '/kən’sidə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (614, 'considerable', ' a.相当大的;重要的', '/kən’sidərəbl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (615, 'considerate', ' a.考虑周到的;体谅的', '/kən’sidərit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (616, 'consideration', ' n.考虑，思考;体贴', '/kənsidə’reiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (617, 'consist', ' vi.由…组成;在于', '/kən’sist/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (618, 'consistent', ' a.坚持的，一贯的', '/kən’sistənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (619, 'constant', ' a.经常的;永恒的', '/‘kɔnstənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (620, 'constitute', ' vt. 构成,组成,任命', '/‘kɔnstitju:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (621, 'constitution', ' n.章程;体质;构造', '/kɔnsti’tju:ʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (622, 'construct', ' vt.建造;建设;构筑', '/kən’strΛkt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (623, 'construction', ' n.建造;建筑;建筑物', '/kən’strΛkʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (624, 'consult', ' vt.请教，查阅', '/kən’sΛlt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (625, 'consume', ' vt.消耗，消费;消灭', '/kən’sju:m/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (626, 'consumption', ' n.消耗量;消耗', '/kən’sΛmpʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (627, 'contact', ' vt.使接触;与…联系', '/‘kɔntækt, kən’tækt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (628, 'contain', ' vt.包含，容纳;等于', '/kən’tein/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (629, 'container', ' n.容器;集装箱', '/kən’teinə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (630, 'contemporary', ' a.当代的，同时代的', '/kən’tempərəri/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (631, 'contempt', ' n.轻蔑;藐视;受辱', '/kən’tempt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (632, 'content', ' n.内容，目录;容量', '/‘kɔntent, kən’tent/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (633, 'content', ' a.满意的，满足的', '/‘kɔntent, kən’tent/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (634, 'contest', ' vt.争夺，争取;辩驳', '/kən’test, ‘kɔntest/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (635, 'continent', ' n.大陆;陆地;洲', '/‘kɔntinənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (636, 'continual', ' a.不断的;连续的', '/kən’tinjuəl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (637, 'continue', ' vt.继续，连续;延伸', '/kən’tinju(:)/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (638, 'continuous', ' a.连续不断的，持续的', '/kən’tinjuəs/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (639, 'contract', ' n.契约，合同;婚约', '/‘kɔntrækt, kən’trækt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (640, 'contradiction', ' n.矛盾，不一致;否认', '/kɔntrə’dikʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (641, 'contrary', ' a.相反的 n.相反', '/‘kɔntrəri/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (642, 'contrast', ' n.对比，对照，悬殊', '/‘kɔntræst, kən’træst/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (643, 'contribute', ' vt.捐献，捐助;投稿', '/kən’tribju(:)t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (644, 'control', ' vt.控制，克制 n.控制', '/kən’trəul/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (645, 'convenience', ' n.便利，方便;厕所', '/kən’vi:njəns/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (646, 'convenient', ' a.便利的;近便的', '/kən’vi:njənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (647, 'convention', ' n.习俗，惯例;公约', '/kən’venʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (648, 'conventional', ' a.普通的;习惯的', '/kən’venʃənl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (649, 'conversation', ' n.会话，非正式会谈', '/kɔnvə’seiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (650, 'conversely', ' ad.相反地', '/‘kɔnvə:sli/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (651, 'conversion', ' n.转变，转化;改变', '/kən’və:ʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (652, 'convert', ' vt.使转变;使改变', '/kən’və:t, ‘kɔnvə:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (653, 'convey', ' vt.传送;运送;传播', '/kən’vei/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (654, 'convince', ' vt.使确信，使信服', '/kən’vins/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (655, 'cook', ' vt.烹调，煮 vt.烧菜', '/kuk/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (656, 'cool', ' a.凉的，冷静的', '/ku:l/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (657, 'cooperate', ' vi.合作，协作;配合', '/kəu’ɔpəreit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (658, 'coordinate', ' vt.使协调，调节', '/kəu’ɔdinit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (659, 'cope', ' vi.对付，应付', '/kəup/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (660, 'copper', ' n.铜;铜币，铜制器', '/‘kɔpə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (661, 'copy', ' n.抄件 vt.抄写，复制', '/‘kɔpi/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (662, 'cord', ' n.细绳，粗线，索', '/kɔ:d/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (663, 'core', ' n.果实的心，核心', '/kɔ:/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (664, 'corn', ' n.谷物;(英)小麦', '/kɔ:n/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (665, 'corner', ' n.角;犄角;边远地区', '/‘kɔ:nə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (666, 'corporation', ' n.公司，企业;社团', '/kɔ:pə’reiʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (667, 'correct', ' a.正确的 vt.纠正', '/kə’rekt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (668, 'correspond', ' vi.相符合;相当', '/kɔris’pɔnd/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (669, 'corresponding', ' a.相应的;符合的', '/kɔris’pɔndiŋ/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (670, 'corridor', ' n.走廊，回廊，通路', '/‘kɔridɔ:/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (671, 'cost', ' n.价格，代价;成本', '/kɔst/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (672, 'costly', ' a.昂贵的;价值高的', '/‘kɔstli/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (673, 'cottage', ' n.村舍，小屋', '/‘kɔtidʒ/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (674, 'cotton', ' n.棉;棉线;棉布', '/‘kɔtn/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (675, 'cough', ' vi.咳，咳嗽 n.咳嗽', '/kɔf/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (676, 'could', ' aux.v.(can的过去式)', '/kud, kəd/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (677, 'council', ' n.理事会，委员会', '/‘kaunsil/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (678, 'count', ' vt.计算 vi.数，计数', '/kaunt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (679, 'counter', ' n.柜台;计数器', '/‘kauntə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (680, 'country', ' n.国家，国土;农村', '/‘kΛntri/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (681, 'countryside', ' n.乡下，农村', '/‘kΛntrisaid/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (682, 'county', ' n.英国的郡，美国的县', '/‘kaunti/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (683, 'couple', ' n.夫妇;(一)对;几个', '/‘kΛpl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (684, 'courage', ' n.勇气，胆量，胆识', '/‘kΛridʒ/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (685, 'course', ' n.课程;过程;一道菜', '/kɔ:s/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (686, 'court', ' n.法院，法庭;庭院', '/kɔ:t/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (687, 'cousin', ' n.堂(或表)兄弟(姐妹)', '/‘kΛzn/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (688, 'cover', ' vt.盖，包括 n.盖子', '/‘kΛvə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (689, 'cow', ' n.母牛，奶牛;母兽', '/kau/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (690, 'crack', ' n.裂缝，裂纹 vi.爆裂', '/kræk/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (691, 'craft', ' n.工艺;手艺，行业', '/kra:ft/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (692, 'crane', ' n.起重机，摄影升降机', '/krein/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (693, 'crash', ' vi.碰撞，坠落 n.碰撞', '/kræʃ/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (694, 'crawl', ' vi.爬，爬行', '/krɔ:l/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (695, 'crazy', ' a.疯狂的，荒唐的', '/‘kreizi/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (696, 'cream', ' n.奶油，乳脂;奶油色', '/kri:m/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (697, 'create', ' vt.创造;引起，产生', '/kri(:)’eit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (698, 'creative', ' a.创造性的，创作的', '/kri(:)’eitiv/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (699, 'creature', ' n.生物，动物，家畜', '/‘kri:tʃə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (700, 'credit', ' n.信用贷款;信用', '/‘kredit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (701, 'creep', ' vi.爬行;缓慢地行进', '/kri:p/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (702, 'crew', ' n.全体船员', '/kru:/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (703, 'crime', ' n.罪，罪行;犯罪', '/kraim/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (704, 'criminal', ' n.犯人，罪犯，刑事犯', '/‘kriminl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (705, 'crisis', ' n.危机;存亡之际', '/‘kraisis/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (706, 'critic', ' n.批评家，爱挑剔的人', '/‘kritik/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (707, 'critical', ' a.决定性的;批评的', '/‘kritikəl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (708, 'criticism', ' n.批评;批判;评论', '/‘kritisizəm/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (709, 'criticize', ' vt.批评;评论;非难', '/‘kritisaiz/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (710, 'crop', ' n.农作物，庄稼;一熟', '/krɔp/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (711, 'cross', ' vt.穿过;使交叉', '/krɔs/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (712, 'crowd', ' n.群;大众;一伙人', '/kraud/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (713, 'crown', ' n.王冠，冕;花冠', '/kraun/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (714, 'crude', ' a.简陋的;天然的', '/kru:d/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (715, 'cruel', ' a.残忍的，残酷的', '/‘kruəl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (716, 'crush', ' vt.压碎，碾碎;镇压', '/krΛʃ/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (717, 'crust', ' n.面包皮;硬外皮', '/krΛst/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (718, 'cry', ' vi.哭，哭泣;叫喊', '/krai/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (719, 'crystal', ' n.水晶，结晶体;晶粒', '/‘kristl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (720, 'cube', ' n.立方形;立方', '/kju:b/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (721, 'cubic', ' a.立方形的;立方的', '/‘kju:bik/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (722, 'cultivate', ' vt.耕;种植;培养', '/‘kΛltiveit/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (723, 'culture', ' n.文化，文明;教养', '/‘kΛltʃə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (724, 'cup', ' n.杯子;(一)杯;奖杯', '/kΛp/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (725, 'cupboard', ' n.碗柜，碗碟橱;食橱', '/‘kΛbəd/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (726, 'cure', ' vt.医治;消除 n.治愈', '/kjuə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (727, 'curiosity', ' n.好奇，好奇心;珍品', '/kjuəri’ositi/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (728, 'curious', ' a.好奇的;稀奇古怪的', '/‘kjuəriəs/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (729, 'current', ' a.当前的;通用的', '/‘kΛrənt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (730, 'curse', ' n.诅咒，咒骂;天谴', '/kə:s/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (731, 'curtain', ' n.帘，窗帘;幕(布)', '/‘kə:tn/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (732, 'curve', ' n.曲线;弯 vt.弄弯', '/kə:v/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (733, 'cushion', ' n.垫子，坐垫，靠垫', '/‘kuʃən/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (734, 'custom', ' n.习惯，风俗;海关', '/‘kΛstəm/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (735, 'customer', ' n.顾客，主顾', '/‘kΛstəmə/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (736, 'cut', ' vt.切，割，剪;减少', '/kΛt/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (737, 'cycle', ' n自行车，循环', '/‘saikl/', NULL, 4, '2021-04-21 13:50:11', '2021-04-21 13:50:11', NULL);
INSERT INTO `word` VALUES (738, 'abnormal ', 'a.不正常的;变态的', '/æb’nɔ:mәl/', NULL, 8, '2021-04-21 13:54:19', '2021-04-21 13:54:19', NULL);
INSERT INTO `word` VALUES (739, 'abrupt', 'a. 突然的，意外的，唐突的', '/ә’brΛpt/', NULL, 8, '2021-04-21 13:54:19', '2021-04-21 13:54:19', NULL);
INSERT INTO `word` VALUES (740, 'absurd ', ' a.不合理的，荒唐的', '/әb’sә:d/', NULL, 8, '2021-04-21 13:54:19', '2021-04-21 13:54:19', NULL);
INSERT INTO `word` VALUES (741, 'abundance ', 'n.丰富，充裕', '/ә’bΛndәns/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (742, 'academy ', 'n.私立中学;专科院校', '/ә’kædәmi/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (743, 'accessory ', 'n.同谋 a.附属的', '/æk’sesәri/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (744, 'accord ', 'vt.一致(~ with);给予', '/ә’kɔ:d/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (745, 'acquaint ', 'vt.使认识，使了解', '/ә’kweint/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (746, 'acquisition ', 'n. 获得,添加的物品', '/‘ækwi’ziʃәn/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (747, 'activate ', 'vt. 刺激,使活动', '/‘æktiveit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (748, 'acute ', 'a. 敏锐的', '/ә’kju:t/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (749, 'adjacent ', 'a.毗连的;紧接着的', '/ә’dʒeisәnt/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (750, 'adjoin ', 'vt.贴近，毗连;靠近', '/ә’dʒɔin/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (751, 'adolescent ', 'a.青春期的,青年的n.青少年', '/ædә’lesәnt/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (752, 'advent ', 'n. 来到,来临', '/‘ædvәnt/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (753, 'adverse ', 'a. 不利的,敌对的,相反的,逆的', '/‘ædvә:s/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (754, 'advertise ', 'vt.通知 vi.登广告', '/‘ædvәtaiz/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (755, 'advocate ', 'n.辩护者 vt.拥护', '/‘ædvәkit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (756, 'aerial ', 'a.空气的;航空的', '/‘ɛәriәl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (757, 'aesthetic ', 'a. 美学的,审美的,有美感', '/i:s’θetik/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (758, 'affiliate ', 'vt. 附属,接纳 vi. 有关', '/ә’filieit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (759, 'affirm ', 'vt.断言，批准;证实', '/ә’fә:m/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (760, 'afflict ', 'vt. 使痛苦,折磨', '/ә’flikt/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (761, 'aggravate ', 'vt. 使恶化,使更加重', '/‘ægrәveit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (762, 'agitation ', 'n.鼓动，煸动;搅动', '/ædʒi’teiʃәn/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (763, 'agony ', 'n.极度痛苦', '/‘ægәni/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (764, 'agreeable ', 'a.惬意的;同意的', '/ә’griәbl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (765, 'alert ', 'a.警惕的;活跃的', '/ә’lә:t/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (766, 'alien ', 'a.外国的 n.外国人', '/‘eiljәn/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (767, 'alleviate ', 'vt. 减轻,使缓和', '/ә’li:vieit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (768, 'alliance ', 'n. 联盟,联合', '/ә’laiәns/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (769, 'allocate ', 'vt. 分派,分配', '/‘ælәkeit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (770, 'allowance ', 'n津贴，补助费', '/ә’lauәns/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (771, 'ally ', 'n.盟国，同盟者，伙伴', '/‘ælai, ә’lai/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (772, 'alongside ', 'prep.在…旁边', '/ә’lɔŋ’said/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (773, 'alternate ', 'vt.使交替 a.交替的', '/ɔ:l’tә:nit/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (774, 'ambiguous ', 'a.模棱两可的;分歧的', '/æm’bigjuәs/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (775, 'ambitious ', 'a.有雄心的;热望的', '/æm’biʃәs/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (776, 'amend ', 'vt. 修正,改善,vi. 改过自新', '/ә’mend/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (777, 'amends ', 'n. 赔偿', '/ә’mendz/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (778, 'ample ', 'a.足够的;宽敞的', '/‘æmpl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (779, 'amplify ', 'vt.放大，增强;扩大', '/‘æmplifai/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (780, 'analogy ', 'n.相似，类似;比拟', '/ә’nælәdʒi/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (781, 'analytic ', 'a. 分析的,解析的', '/ænә’litik/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (782, 'analytical ', 'a. 分析的,解析的', '/ænә’litikl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (783, 'angel ', 'n.天使，神差，安琪儿', '/‘eindʒәl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (784, 'anniversary ', 'n.周年纪念日', '/,æni’vә:sәri/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (785, 'anonymous ', 'a. 匿名的', '/ә’nɔnimәs/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (786, 'antarctic ', 'a.南极的 n.南极区', '/ænt’a:ktik/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (787, 'antique ', 'a.古代的 n.古物', '/æn’ti:k/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (788, 'appraisal ', 'n. 评价,估价,鉴定', '/ә’preizl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (789, 'applaud ', 'vt.喝彩;欢呼vi.欢呼', '/ә’plɔ:d/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (790, 'appreciable ', 'a.可估价的;可察觉的', '/ә’pri:ʃәbl/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (791, 'apprehension ', 'n. 理解,忧惧,逮捕', '/æpri’henʃәn/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (792, 'appendix ', 'n.附录，附属物;阑尾', '/ә’pendiks/', NULL, 8, '2021-04-21 13:54:20', '2021-04-21 13:54:20', NULL);
INSERT INTO `word` VALUES (793, 'baffle ', 'vt.使挫折 n.迷惑', '/‘bæfl/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (794, 'bald ', 'a.秃头的;无毛的', '/bɔ:ld/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (795, 'ballet ', 'n.芭蕾舞;舞剧', '/‘bælei, bæ’lei/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (796, 'ban ', 'n. 禁令 vt. 禁止,取缔', '/bæn/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (797, 'bankrupt ', 'a.破产的 vt.使破产', '/‘bæŋkrәpt/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (798, 'barren ', 'a.贫瘠的;不妊的', '/‘bærәn/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (799, 'barely ', 'ad.仅仅，勉强', '/‘bɛәli/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (800, 'basement ', 'n.地下室;地窖;底层', '/‘beismәnt/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (801, 'beforehand ', 'ad.预先;提前地', '/bi’fɔ:hænd/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (802, 'betray ', 'vt.背叛;辜负;泄漏', '/bi’trei/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (803, 'bias ', 'n. 偏见,偏袒,斜线 vt.使有偏见', '/‘baiәs/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (804, 'bibliography ', 'n. 参考书目', '/bibli’ɔgrәfi/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (805, 'bid ', 'n. 出价vt.vi. 命令,吩咐,投标', '/bid/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (806, 'biography ', 'n. 传记', '/bai’ɔgrәfi/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (807, 'blaze ', 'n.火;闪光 vi.燃烧', '/bleiz/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (808, 'bleak ', 'a. 萧瑟的,苍白的,荒凉的', '/bli:k/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (809, 'bless ', 'vt.为…祝福', '/bles/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (810, 'blossom ', 'n.花，开花 vi.开花', '/‘blɔsәm/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (811, 'blunt', 'a. 钝的,坦率的,麻痹的', '/blΛnt/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (812, 'bonus ', 'n. 奖金,红利', '/‘bәunәs/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (813, 'boom ', 'vi. n. 急速发展,繁荣,隆隆响', '/bu:m/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (814, 'boost ', 'vt. n. 推进,支援,吹捧', '/bu:st/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (815, 'boycott ', 'vt.&amp;n.联合抵制', '/‘bɔikәt/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (816, 'brace ', 'n.支柱 vt.拉紧，撑牢', '/breis/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (817, 'bracket ', 'n. 支架,括弧,托架', '/‘brækit/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (818, 'breakdown ', 'n.崩溃，倒塌;失败', '/‘breikdaun/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (819, 'bribe ', 'n.贿赂 vt.向…行贿', '/braib/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (820, 'brisk ', 'a.活泼的;清新的', '/brisk/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (821, 'brittle ', 'a.脆的;易损坏的', '/‘britl/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (822, 'bronze ', 'n.青铜色', '/brɔnz/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (823, 'brood ', 'n.同窝幼鸟 vt.孵(蛋)', '/bru:d/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (824, 'bruise ', 'n.青肿，伤痕;擦伤', '/bru:z/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (825, 'brutal ', 'a. 残忍的,野蛮的,不讲理的', '/‘bru:tl/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (826, 'bud ', 'n.芽，萌芽;蓓蕾', '/bΛd/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (827, 'budget ', 'n.预算，预算案', '/‘bΛdʒit/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (828, 'bug ', 'n.虫子;臭虫', '/bΛg/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (829, 'bull ', 'n.买空的窗体顶端 证券投机商', '/bul/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (830, 'bulletin ', '告示，公告，公报', '/‘bulitin/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (831, 'bump ', 'vt.撞击 vi.撞 n.肿块', '/bΛmp/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (832, 'bureaucracy ', 'n.官僚主义;官僚机构', '/bjuә’rɔkrәsi/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (833, 'burial ', 'n.安葬，埋葬，埋藏', '/‘beriәl/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (834, 'buzz ', 'vi.(蜂等)嗡嗡叫', '/bΛz/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (835, 'bypass ', 'n.旁通管 vt.绕过', '/‘bai-pa:s/', NULL, 8, '2021-04-21 13:55:11', '2021-04-21 13:55:11', NULL);
INSERT INTO `word` VALUES (836, 'canvas ', 'n.粗帆布;一块油画布', '/‘kænvәs/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (837, 'capsule ', 'n. 胶囊,瓶帽,太空舱', '/‘kæpsju:l/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (838, 'captive ', 'n.俘虏，被监禁的人', '/‘kæptiv/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (839, 'cartoon ', 'n.漫画，动画片', '/ka:’tu:n/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (840, 'carve ', 'vt.刻，雕刻;切开', '/ka:v/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (841, 'casualty ', 'n. 伤亡,受害者', '/‘kæʒjuәlti/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (842, 'category ', 'n.种类，类目;范畴', '/‘kætigәri/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (843, 'cathedral ', 'n.总教堂;大教堂', '/kә’θi:drәl/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (844, 'catholic ', 'a.天主教的n.天主教徒', '/‘kæθәlik/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (845, 'caution ', 'n.小心;告诫 vt.警告', '/‘kɔ:ʃәn/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (846, 'cautious ', 'a.小心的，谨慎的', '/‘kɔ:ʃәs/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (847, 'cavity ', 'n.洞，穴，空腔', '/‘kæviti/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (848, 'census ', 'n. 户口普查 vt.统计调查', '/‘sensәs/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (849, 'ceramic ', 'a. 陶器的 n. 陶瓷制品', '/si’ræmik/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (850, 'cereal ', 'n.谷类，五谷，禾谷', '/‘siәriәl/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (851, 'certainty ', 'n.确实性，确信，确实', '/‘sә:tnti/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (852, 'certify ', 'vt.vi. 证明,保证', '/‘sә:tifai/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (853, 'chaos ', 'n. 大混乱,混沌', '/‘keiɔs/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (854, 'characterize ', 'vt.表示…的特性', '/‘kæriktәraiz/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (855, 'charity ', 'n.施舍;慈善事业', '/‘tʃæriti/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (856, 'charm ', 'n.魅力;妩媚 vi.迷人', '/tʃa:m/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (857, 'chat ', 'n. 闲谈 vi. 闲谈,聊天', '/tʃæt/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (858, 'chip ', 'n.薄片，碎片', '/tʃip/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (859, 'chord ', 'n.(乐器的)弦 vi.协调', '/kɔ:d/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (860, 'chorus ', 'vt.&amp;vi.合唱', '/‘kɔ:rәs/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (861, 'chronic ', 'a.慢性的,习惯性的n.慢性病患者', '/‘krɔnik/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (862, 'circulation ', '', '/sә:kju’leiʃәn/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (863, 'circus ', 'n.马戏;马戏团', '/‘sә:kәs/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (864, 'cite ', 'vt.引用，引证;举例', '/sait/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (865, 'civilian ', 'n.平民 a.平民的', '/si’viljәn/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (866, 'clamp ', 'n.夹子 vt.夹住，夹紧', '/klæmp/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (867, 'clarity ', 'n. 清楚,透明', '/‘klæriti/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (868, 'clasp ', 'n.扣子，钩子;别针', '/kla:sp/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (869, 'classic ', 'n.名著 a.不朽的', '/‘klæsik/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (870, 'clause ', 'n. 子句,条款', '/klɔ:z/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (871, 'clearance ', 'n. 清除,解除,间隙', '/‘kliәrәns/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (872, 'client ', 'n.顾客;诉讼委托人', '/‘klaiәnt/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (873, 'climax ', 'n.顶点，高潮', '/‘klaimæks/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (874, 'clinic ', 'n.诊所，医务室;会诊', '/klinik/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (875, 'clip ', 'vt.剪;剪辑报刊', '/klip/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (876, 'clockwise ', 'a.&amp;ad.顺时针方向转的', '/‘klɔkwaiz/', NULL, 8, '2021-04-21 13:56:06', '2021-04-21 13:56:06', NULL);
INSERT INTO `word` VALUES (877, 'damn ', 'vt.诅咒 n.诅咒;丝毫', '/dæm/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (878, 'dazzle ', 'vt.&amp;vi.炫耀;迷惑', '/‘dæzl/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (879, 'deadly ', 'a.致命的，死一般的', '/‘dedli/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (880, 'decent ', 'a.正派的;体面的', '/‘di:snt/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (881, 'decimal ', 'a.小数的，十进制的', '/‘desimәl/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (882, 'decisive ', 'a.决定性的;果断的', '/di’saisiv/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (883, 'declaration ', 'n.宣布，宣言;申诉', '/deklә’reiʃәn/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (884, 'decline ', 'vt.下倾;偏斜;衰退', '/di’klain/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (885, 'dedicate ', 'vt.奉献;献身', '/‘dedikeit/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (886, 'deem ', 'vt.认为，相信 vi.想', '/di:m/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (887, 'deficiency ', 'n.缺乏;不足之数', '/di’fiʃәnsi/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (888, 'deficit ', 'n. 赤字,不足额', '/‘defisit/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (889, 'defy ', 'vt.向…挑战;蔑视', '/di’fai/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (890, 'degenerate ', 'a.堕落的 vi.vt.(使)变质,(使)退化', '/di’dʒenәreit/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (891, 'degrade ', 'vt.使降给;使堕落', '/di’greid/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (892, 'delegate ', 'n.代表，委员，特派员', '/‘deligeit/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (893, 'deliberate ', 'a.深思熟虑的;审慎的', '/di’libәrit/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (894, 'denial ', 'n.否定;拒绝相信', '/di’naiәl/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (895, 'denote ', 'vt.指示，意味着', '/di’nәut/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (896, 'denounce ', 'vt.谴责，声讨;告发', '/di’nauns/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (897, 'dentist ', 'n.牙科医生', '/‘dentist/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (898, 'depict ', 'vt. 描述,描写', '/di’pikt/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (899, 'depression ', 'n.消沉;不景气萧条期', '/di’preʃәn/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (900, 'deprive ', 'vt.夺去;使(人)失去', '/di’praiv/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (901, 'depute ', 'vt. 指定代理人,委任', '/di’pju:t/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (902, 'descendant ', 'n.子孙，后裔;弟子', '/di’sendәnt/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (903, 'descent ', 'n.下降;出身;斜坡', '/di’sent/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (904, 'designate ', 'vt.指出，指示;指定', '/‘dezigneit/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (905, 'despise ', 'vt.鄙视，蔑视', '/dis’paiz/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (906, 'destined ', 'a. (由神、命运) 预定的,注定的', '/‘destind/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (907, 'destiny ', 'n. 命运,定数', '/‘destini/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (908, 'destructive ', 'a.破坏(性)的，危害的', '/dis’trΛktiv/', NULL, 8, '2021-04-21 13:56:55', '2021-04-21 13:56:55', NULL);
INSERT INTO `word` VALUES (909, 'earnings ', 'n.工资，收入;收益', '/‘ә:niŋz/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (910, 'eccentric ', 'n.怪人,偏心圆 a.古怪的,不同圆心的', '/ik’sentrik/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (911, 'economics ', 'n.经济学;经济', '/i:kә’nɔmiks/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (912, 'eclipse ', 'n.(日，月)食', '/i’klips/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (913, 'ecology ', 'n.生态学;个体生态学', '/i(:)’kɔlәdʒi/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (914, 'edible ', 'a. 可食用的 n. 食品,食物', '/‘edibl/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (915, 'edit ', 'vt.编辑，编纂;校订', '/‘edit/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (916, 'editorial ', 'n.社论，期刊的社论', '/edi’tɔ:riәl/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (917, 'ego ', 'n. 自我', '/‘egәu/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (918, 'eject ', 'vt.逐出，排斥;喷射', '/i:’dʒekt/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (919, 'elapse ', 'vi.(时间)过去，消逝', '/i’læps/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (920, 'elbow ', 'n.肘，肘部;弯管', '/‘elbәu/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (921, 'elderly ', 'a. 过了中年的,稍老的', '/‘eldәli/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (922, 'electrician ', 'n.电工，电气技师', '/ilek’triʃәn/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (923, 'electronics ', 'n.电子学', '/ilek’trɔniks/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (924, 'elegant ', 'a.(举止、服饰)雅致的', '/‘eligәnt/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (925, 'elevate ', 'vt.提高(思想);抬高', '/‘eliveit/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (926, 'elicit ', 'vt. 引出,抽出,引起', '/i’lisit/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (927, 'eligible ', 'n. 有资格者,合格者 a.有资格的', '/‘elidʒәbl/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (928, 'elite ', 'n. 精华,精锐,中坚分子', '/ei’li:t/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (929, 'eloquent ', 'a. 雄辩的,有口才的,动人的', '/‘elәkwәnt/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (930, 'embark ', 'vi. 乘船,着手,从事,上飞机', '/im’ba:k/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (931, 'embassy ', 'n.大使馆;大使的职务', '/‘embәsi/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (932, 'embed ', 'vt. 使插入,使嵌入', '/im’bed/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (933, 'embody ', 'vt.体现;包含，收录', '/im’bɔdi/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (934, 'empirical ', 'a.经验主义的', '/im’pirikәl/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (935, 'endow ', 'vt.资助;赋予，授予', '/in’dau/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (936, 'endurance ', 'n.耐久力，持久力', '/in’djuәrәns/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (937, 'energetic ', 'a.积极的;精力旺盛的', '/enә’dʒetik/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (938, 'engagement ', 'n.婚约;约会，债务', '/in’geidʒmәnt/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (939, 'enhance ', 'vt.提高，增加;夸张', '/in’ha:ns/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (940, 'enlighten ', 'vt.启发，开导;启蒙', '/in’laitn/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (941, 'enroll ', 'vt.登记，招收vi.参军', '/in’rәul/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (942, 'entail ', 'vt. 使必需,使承担', '/in’teil/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (943, 'enterprise ', 'n.企业，事业心', '/‘entәpraiz/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (944, 'entertainment ', 'n.娱乐,款待,娱乐表演', '/entә’teinmәnt/', NULL, 8, '2021-04-21 13:57:27', '2021-04-21 13:57:27', NULL);
INSERT INTO `word` VALUES (945, 'fabricate ', 'vt.制作，组合;捏造', '/‘fæbrikeit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (946, 'facet ', 'n. 小平面,方面,刻面', '/‘fæsit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (947, 'facilitate ', 'vt.使容易;助长', '/fә’siliteit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (948, 'fake ', 'n.假货，膺品 a.假的', '/feik/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (949, 'fantastic ', 'a.空想的;奇异的', '/fæn’tæstik/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (950, 'fantasy ', 'n. 幻想,白日梦', '/‘fæntәsi/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (951, 'fascinate ', 'vt.迷住 vi.迷人', '/‘fæsineit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (952, 'fax ', 'n. 传真 vt. 传真', '/fæks/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (953, 'feast ', 'n.盛宴，筵席;节日', '/fi:st/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (954, 'federation ', 'n. 联邦,联合,联盟', '/fedә’reiʃәn/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (955, 'feeble ', 'a.虚弱的;微弱的', '/‘fi:bl/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (956, 'fellowship ', 'n.伙伴关系;联谊会', '/‘felәuʃip/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (957, 'feminine ', 'a.女性的;女子气的', '/‘feminin/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (958, 'ferry ', 'n.渡船;渡口 vt.运送', '/‘feri/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (959, 'finite ', 'a.有限的;有尽的', '/‘fainait/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (960, 'fist ', 'n.拳(头)', '/fist/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (961, 'flank ', 'n.肋，肋腹;侧面', '/flæŋk/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (962, 'flap ', 'vt.&amp;n.拍打 vi.拍动', '/flæp/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (963, 'fluctuate ', 'vi.波动 vt.使波动', '/‘flΛktjueit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (964, 'foam ', 'n.泡沫;泡沫塑料', '/fәum/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (965, 'foil ', 'n. 箔,金属薄片 vt. 贴箔于, 衬托', '/fɔil/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (966, 'foremost ', 'a.最初的;第一流的', '/‘fɔ:mәust/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (967, 'format ', 'n. 格式 v. 格式化', '/‘fɔ:mæt/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (968, 'formidable ', 'a.可怕的;难对付的', '/‘fɔ:midәbl/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (969, 'formulate ', 'vt.用公式表示', '/‘fɔ:mjuleit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (970, 'fort ', 'n.要塞，堡垒', '/fɔ:t/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (971, 'forum ', 'n.论坛，讨论会', '/‘fɔ:rәm/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (972, 'fossil ', 'n.化石 a.化石的', '/‘fɔsl/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (973, 'foul ', 'a.肮脏的;丑恶的', '/faul/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (974, 'fragile ', 'a.脆的;体质弱的', '/‘frædʒail/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (975, 'fraud ', 'n. 骗子,欺骗,欺诈,诡计', '/frɔ:d/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (976, 'frustrate ', 'vt.挫败;使无效', '/frΛs’treit/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (977, 'furious ', 'a.狂怒的;狂暴的', '/‘fjuәriәs/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (978, 'fuse ', 'n.保险丝，导火线', '/fju:z/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (979, 'fusion ', 'n. 熔合物,结合,熔合', '/‘fjuʒәn/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (980, 'fuss ', 'n.忙乱;吹捧 vi.忙乱', '/fΛs/', NULL, 8, '2021-04-21 13:58:15', '2021-04-21 13:58:15', NULL);
INSERT INTO `word` VALUES (981, 'galaxy ', 'n. 银河,星系,一群显赫的人物', '/‘gælәksi/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (982, 'gallery ', 'n.长廊，游廊;画廊', '/‘gælәri/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (983, 'gamble ', 'n.赌博 vt.冒…的险', '/‘gæmbl/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (984, 'gaol ', 'n. 监禁,监狱 vt. 监禁', '/dʒeil/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (985, 'garment ', 'n.衣服;服装，衣着', '/‘ga:mәnt/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (986, 'gasp ', 'vi.气喘，喘息', '/ga:sp/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (987, 'gene ', 'n. 基因,因子', '/dʒi:n/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (988, 'generalize ', 'vt.概括出vi.形成概念', '/‘dʒenәrәlaiz/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (989, 'genetic ', 'a. 遗传的,起源的', '/dʒә’netik/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (990, 'geology ', 'n.地质学;(某地)地质', '/dʒi’ɔlәdʒi/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (991, 'gigantic ', 'a.巨大的;巨人似的', '/dʒai’gæntik/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (992, 'given ', 'a. 赠予的,沉溺的,约定的', '/‘givn/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (993, 'gleam ', 'n.微光 vi.发微光', '/gli:m/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (994, 'glide ', 'vi.滑动;消逝 n.滑行', '/glaid/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (995, 'global ', 'a.球面的;全球的', '/‘glәubәl/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (996, 'gloomy ', 'a.黑暗的;令人沮丧的', '/‘glu:mi/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (997, 'gorgeous ', 'a.绚丽的;极好的', '/‘gɔ:dʒәs/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (998, 'gossip ', 'n.闲谈;碎嘴子;漫笔', '/‘gɔsip/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (999, 'grab ', 'vt.&amp;vi.攫取，抓取', '/græb/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1000, 'gracious ', 'a.谦和的', '/‘greiʃәs/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1001, 'graze ', 'vi.喂草;放牧(牲畜)', '/greiz/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1002, 'grease ', 'n.动物脂，窗体底端，脂肪', '/gri:s, gri:z/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1003, 'grief ', 'n.悲哀，悲痛，悲伤', '/gri:f/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1004, 'grieve ', 'vt.使悲痛 vi.悲痛', '/gri:v/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1005, 'grim ', 'a.冷酷无情的，严厉的', '/grim/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1006, 'grin ', 'vi.咧着嘴笑', '/grin/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1007, 'groan ', 'vi.哼，呻吟 n.呻吟', '/grәun/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1008, 'grope ', 'vi.(暗中)摸索，探索', '/grәup/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1009, 'guardian ', 'n. 监护人,保护人 a. 保护的', '/‘ga:djәn/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1010, 'guideline ', 'n. 指导路线,方针,指标', '/‘gaidlain/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1011, 'guy ', 'n. 家伙,支索 vt.用支索撑住,取笑', '/gai/', NULL, 8, '2021-04-21 13:58:46', '2021-04-21 13:58:46', NULL);
INSERT INTO `word` VALUES (1012, 'handbook ', 'n.手册，便览，指南', '/‘hændbuk/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1013, 'handicap ', 'vt.妨碍，使不利', '/‘hændikæp/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1014, 'hasty ', 'a.急速的;仓促的', '/‘heisti/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1015, 'haul ', 'vt.拖曳;拖运', '/hɔ:l/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1016, 'haunt ', 'vt.常去 vi.经常出没', '/hɔ:nt/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1017, 'heal ', 'vt.治愈;使和解', '/hi:l/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1018, 'heave ', 'vt.(用力地)举起;抛', '/hi:v/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1019, 'heighten ', 'vt.加高，提高;增加', '/‘haitn/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1020, 'hierarchy ', 'n.等级制度，统治集团', '/‘haiәra:ki/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1021, 'highlight ', 'n.突出,精彩场面vt.加亮,使显著', '/‘hailait/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1022, 'historian ', 'n.历史学家;编史家', '/his’tɔ:riәn/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1023, 'historic ', 'a.历史的;历史性的', '/his’tɔrik/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1024, 'hoist ', 'vt.升起 vi.扯起来', '/hɔist/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1025, 'homogeneous ', 'a.同类的;均匀的', '/hɔmә’dʒi:njәs/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1026, 'horrible ', 'a. 可怕的,极可憎的,极可厌的', '/‘hɔrәbl/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1027, 'hose ', 'n.长筒袜;软管', '/hәuz/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1028, 'hospitality ', 'n.好客，殷勤;宜人', '/hɔspi’tæliti/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1029, 'hug ', 'vt.搂 n.紧紧拥抱', '/hΛg/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1030, 'humanity ', 'n.人类;人性，人情', '/hju:’mæniti/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1031, 'humidity ', 'n.湿气;湿度', '/hju:’miditi/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1032, 'hurl ', 'vt.猛投 vi.猛冲', '/hә:l/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1033, 'hurricane ', 'n.飓风，十二级风', '/‘hΛrikәn/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1034, 'hypothesis ', 'n.假设;前提', '/hai’pɔθisi:z/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1035, 'hysterical ', 'a. 歇斯底里的,异常兴奋的', '/his’terikәl/', NULL, 8, '2021-04-21 13:59:06', '2021-04-21 13:59:06', NULL);
INSERT INTO `word` VALUES (1036, 'ceshi', 'ceshi', 'cehis', NULL, 4, '2021-04-21 14:24:14', '2021-04-21 14:24:14', '2021-04-21 14:24:21');
INSERT INTO `word` VALUES (1037, 'ceshi111111', 'ceshi', 'ceshi', NULL, 4, '2021-05-07 17:54:48', '2021-05-07 17:54:56', '2021-05-07 17:54:59');
INSERT INTO `word` VALUES (1038, 'ceshi123123', '测试', '1', NULL, 8, '2021-05-08 16:08:07', '2021-05-08 16:08:15', '2021-05-08 16:08:17');
INSERT INTO `word` VALUES (1039, '测试2', '测试', '测试', NULL, 8, '2021-05-08 16:08:40', '2021-05-08 16:08:40', '2021-05-08 16:08:46');
INSERT INTO `word` VALUES (1040, '测试11', '测试', '测试', NULL, 9, '2021-05-08 16:10:00', '2021-05-08 16:10:00', '2021-05-08 16:10:15');
INSERT INTO `word` VALUES (1041, '测试22', '测试', '测试', NULL, 8, '2021-05-08 16:11:58', '2021-05-08 16:11:58', '2021-05-08 16:12:02');
INSERT INTO `word` VALUES (1042, '测试1111', '测试', '测试', NULL, 9, '2021-05-08 16:20:04', '2021-05-08 16:20:10', '2021-05-08 16:20:14');

-- ----------------------------
-- Table structure for wordbook
-- ----------------------------
DROP TABLE IF EXISTS `wordbook`;
CREATE TABLE `wordbook`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '生词本id',
  `web_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生词本内容',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wordbook
-- ----------------------------
INSERT INTO `wordbook` VALUES (1, 8, '[17,193,194,195,173,174,175,176,177,178,179,180,181,182,121,979,747,748,749,750,751]', '2021-04-10 16:26:53', '2021-05-07 17:18:41', NULL);
INSERT INTO `wordbook` VALUES (2, 9, '[12,801,738]', '2021-04-18 18:40:03', '2021-05-08 16:31:35', NULL);
INSERT INTO `wordbook` VALUES (3, 10, '[11,21]', '2021-04-18 19:39:51', '2021-04-18 19:40:07', NULL);

SET FOREIGN_KEY_CHECKS = 1;
