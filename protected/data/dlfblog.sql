-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 07 月 06 日 06:30
-- 服务器版本: 5.0.90
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `dlfblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `dlf_attachment`
--

CREATE TABLE IF NOT EXISTS `dlf_attachment` (
  `id` bigint(32) unsigned NOT NULL auto_increment COMMENT '序号',
  `post_id` int(11) unsigned NOT NULL COMMENT '博客序号',
  `filename` varchar(255) NOT NULL COMMENT '附件名称',
  `filesize` int(11) unsigned NOT NULL default '0',
  `filepath` varchar(255) NOT NULL COMMENT '附件路径',
  `created` int(11) unsigned NOT NULL default '0' COMMENT '创建时间',
  `updated` int(11) unsigned NOT NULL default '0' COMMENT '更新时间',
  PRIMARY KEY  (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dlf_attachment`
--


-- --------------------------------------------------------

--
-- 表的结构 `dlf_category`
--

CREATE TABLE IF NOT EXISTS `dlf_category` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '序号',
  `pid` int(11) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) default NULL COMMENT '别名',
  `position` int(11) unsigned default '0' COMMENT '排序序号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dlf_category`
--


-- --------------------------------------------------------

--
-- 表的结构 `dlf_comment`
--

CREATE TABLE IF NOT EXISTS `dlf_comment` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `content` text NOT NULL,
  `status` int(11) unsigned NOT NULL,
  `created` int(11) unsigned default NULL,
  `author` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) default NULL,
  `ip` varchar(128) default NULL,
  `post_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_comment_post` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `dlf_comment`
--

INSERT INTO `dlf_comment` (`id`, `content`, `status`, `created`, `author`, `email`, `url`, `ip`, `post_id`) VALUES
(1, 'This is a test comment.', 2, 1230952187, 'Tester', 'tester@example.com', NULL, NULL, 2),
(2, '‘We have a saying about the past: “The old days were better, the girls were younger then”,’ says Ilya Sorokin. He’s 43 and has a peaked captain’s hat perched raffishly on his shaven head. In the luxury car showroom where we meet, four Soviet cars are attracting knowing smiles and recollections from Muscovites who have learned to aspire to better things.', 2, 1322327646, 'winds', 'windsdeng@hotmail.com', 'http://www.dlf5.com', NULL, 4),
(3, '近日有用户注意到，谷歌Chrome浏览器页面上方出现了一则广告，推广基于Chrome OS的Chromebook上网本产品。', 2, 1322327736, 'winds', 'windsdeng@hotmail.com', 'http://www.dlf5.com', NULL, 5),
(4, '新版感觉怎么样呀！', 2, 1322327794, 'winds', 'windsdeng@hotmail.com', 'http://www.dlf5.com', NULL, 3),
(5, 'This blog system is developed using Yii. ', 2, 1322327830, 'winds', 'windsdeng@hotmail.com', 'http://www.dlf5.com', NULL, 1),
(6, '谷歌开始利用Chrome浏览器投放在线广告', 2, 1322327860, 'winds', 'windsdeng@hotmail.com', 'http://www.dlf5.com', NULL, 5),
(7, '磊', 1, 1333334787, 'winds', 'winds', '', NULL, 11);

-- --------------------------------------------------------

--
-- 表的结构 `dlf_link`
--

CREATE TABLE IF NOT EXISTS `dlf_link` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '序号',
  `sitename` varchar(128) NOT NULL COMMENT '网站名称',
  `logo` varchar(128) default NULL COMMENT '站标地址',
  `siteurl` varchar(255) NOT NULL COMMENT '网站地址',
  `description` varchar(255) default NULL COMMENT '描述',
  `target` enum('_blank','_top','_self','_parent') default '_blank' COMMENT '打开方式',
  `status` int(11) unsigned NOT NULL,
  `position` int(11) unsigned default '0' COMMENT '排序序号',
  `created` int(11) unsigned default NULL COMMENT '创建时间',
  `updated` int(11) unsigned default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dlf_link`
--


-- --------------------------------------------------------

--
-- 表的结构 `dlf_lookup`
--

CREATE TABLE IF NOT EXISTS `dlf_lookup` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `code` int(11) unsigned NOT NULL,
  `type` varchar(128) NOT NULL,
  `position` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dlf_lookup`
--

INSERT INTO `dlf_lookup` (`id`, `name`, `code`, `type`, `position`) VALUES
(1, 'Draft', 1, 'PostStatus', 1),
(2, 'Published', 2, 'PostStatus', 2),
(3, 'Archived', 3, 'PostStatus', 3),
(4, 'Pending Approval', 1, 'CommentStatus', 1),
(5, 'Approved', 2, 'CommentStatus', 2);

-- --------------------------------------------------------

--
-- 表的结构 `dlf_options`
--

CREATE TABLE IF NOT EXISTS `dlf_options` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `object_id` int(11) unsigned NOT NULL default '0',
  `option_name` varchar(255) NOT NULL COMMENT '选项名称',
  `option_value` text NOT NULL COMMENT '值',
  PRIMARY KEY  (`id`),
  KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='选项设置表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dlf_options`
--

INSERT INTO `dlf_options` (`id`, `object_id`, `option_name`, `option_value`) VALUES
(1, 0, 'settings', '{"site_name":"windsdeng''s blog","site_closed":"no","close_information":"\\u7f51\\u7ad9\\u5728\\u7ef4\\u62a4\\u4e2d\\u3002<br \\/> \\u8bf7\\u7a0d\\u5019\\u8bbf\\u95ee\\u3002","site_url":"http:\\/\\/www.dlf5.com\\/","keywords":"\\u9093\\u6797\\u950b\\u7684\\u535a\\u5ba2","description":"\\u9093\\u6797\\u950b\\u7684\\u535a\\u5ba2http:\\/\\/www.dlf5.com","copyright":"windsdeng''s blog","author":"winds","blogdescription":"\\u9093\\u6797\\u950b\\u7684\\u535a\\u5ba2","default_editor":"ueditor","email":"winds@dlf5.com","rss_output_num":"10","rss_output_fulltext":"yes","post_num":"10","time_zone":"\\u4e0a\\u6d77","icp":"","footer_info":"","rewrite":"no","showScriptName":"false","urlSuffix":".html"}');

-- --------------------------------------------------------

--
-- 表的结构 `dlf_post`
--

CREATE TABLE IF NOT EXISTS `dlf_post` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `summary` varchar(255) NOT NULL COMMENT '摘要',
  `category` text,
  `tags` text,
  `status` int(11) unsigned NOT NULL,
  `created` int(11) unsigned default '0',
  `updated` int(11) unsigned default '0',
  `author_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL default '0' COMMENT '分类ID',
  PRIMARY KEY  (`id`),
  KEY `FK_post_author` (`author_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `dlf_post`
--

INSERT INTO `dlf_post` (`id`, `title`, `content`, `summary`, `category`, `tags`, `status`, `created`, `updated`, `author_id`, `category_id`) VALUES
(1, 'Welcome!', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.\n\nFeel free to try this system by writing new posts and posting comments.', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.', NULL, 'yii, blog', 2, 1230952187, 1230952187, 1, 0),
(2, 'A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', NULL, 'test', 2, 1230952187, 1230952187, 1, 0),
(3, '我的博客', '最新更新我的博客，新版感觉怎么样呀！', '最新更新我的博客，新版感觉怎么样呀！', NULL, '', 2, 1322064648, 1322064686, 1, 0),
(4, 'Remnants of Russia’s past', 'It’s a blazing hot August day in Moscow. At street-level, Muscovites are strolling around in shorts, linen slacks and minimal summer frocks. Yet in a gloomy netherworld beneath their sandals and stiletto heels, the temperature is a constant 18°C and the subterranean silence is punctuated by the drip of water. ‘Mind your feet,’ says Olga Arkharova, as she steps over an underground stream.\r\n\r\nHere, some 65 metres below the sundrenched streets of Moscow, lies a disused communications bunker. Like some Cold War bat cave, it was accessible only by a reinforced lift shaft concealed within the false front of a seemingly ordinary building. Its workers, who were sworn to secrecy, could have survived down here for three months in the event of a nuclear attack. Since 2007, the 7,000-sq-metre site has been a museum. ‘This isn’t just part of Russian history,’ says Olga, the museum’s director. ‘It’s part of world history. It shows how close we came to nuclear war.’ The sound of a passing Metro train rumbles through the bunker’s walls.\r\n\r\nAbove ground, Moscow has changed almost beyond recognition, but in Bunker 42, there is still the fleeting scent of another era. The rotary phones are clunky, the lifts and stencilled warning signs have a slipshod look. Here it is: the militarism, the sturdiness, the kitsch, the strangely uniform aesthetic that shaped a continent. Here, at least, remnants of the USSR are intact.\r\n\r\nA generation is coming of age that has no recollection of the Soviet Union: its menace, its inefficiencies, its idealism. And yet the USSR was, inarguably, one of the defining entities of the 20th century.\r\n\r\nThe strange red empire that slipped away 20 years ago this Christmas had, among other things, its own smell. Cheap, cardboard-tipped Soviet cigarettes called ‘papirosa’ perfumed the arrivals halls of Moscow’s airports and were ubiquitous throughout the city. Now, like much else about the USSR, they have disappeared.\r\n\r\nMoscow today is many things – an oil and gas boom town, a traffic nightmare, a centre of art and fashion – but it’s also an unintended memorial to the USSR. Each phase of the Soviet Union’s history is preserved in the city’s architecture: experiments in Modernist design in the early years of the Russian Revolution, the imperial monuments of the Stalin years, drab tower blocks from the years of stagnation. To visit is to encounter the story of this vanished country.\r\n\r\nAmong Moscow’s most eye-catching structures are those commissioned by Stalin himself. His legacy to the city includes the astonishingly ornate stations of the Moscow Metro and the seven skyscrapers – the ‘Seven Sisters’ – that surround the city in a loose ring, a startling assemblage of columns and gothic detail. There’s something eerie about Stalin’s skyscrapers – their power and grandeur seems to carry an implied threat. This is the architecture of conquest.\r\n\r\nTwo of the Seven Sisters are hotels: the Ukraina and the Leningradskaya. Some 21 years ago, I stayed in the Leningradskaya while writing a guidebook to a country that, unknown to me, was on the brink of dissolution. Like the USSR itself, the hotel was both grand and shoddy: its old lifts clanked alarmingly as they ascended to the upper floors, the onceopulent interior had gone to seed and Colonel Gaddafi’s The Green Book was on sale in the lobby’s book shop. In the gloomy restaurant where the waiters openly demanded bribes, Russians danced the lambada to the melancholy strains of Llorando se Fue – which, played on a synthesizer, seemed to echo in every function room in the Soviet Union.\r\n\r\nNow, a brand-new lift whisks you up to your floor. The Soviet curtains, shabby rugs and dodgy water supply are all gone, replaced by a uniform efficiency and abundance. Looking out over the trafficchoked streets of the city, I surprise myself with a feeling of nostalgia for a time that was clearly inferior to the present.\r\n\r\n‘We have a saying about the past: “The old days were better, the girls were younger then”,’ says Ilya Sorokin. He’s 43 and has a peaked captain’s hat perched raffishly on his shaven head. In the luxury car showroom where we meet, four Soviet cars are attracting knowing smiles and recollections from Muscovites who have learned to aspire to better things.', 'It’s a blazing hot August day in Moscow. At street-level, Muscovites are strolling around in shorts, linen slacks and minimal summer frocks. Yet in a gloomy netherworld beneath their sandals and stiletto heels, the temperature is a constant 18°C and the s', NULL, 'much, about', 2, 1322151581, 1322151692, 1, 0),
(5, '谷歌开始利用Chrome浏览器投放在线广告', '腾讯科技讯（小贝）北京时间11月26日消息，谷歌开始借助Chrome浏览器投放在线广告。近日有用户注意到，谷歌Chrome浏览器页面上方出现了一则广告，推广基于Chrome OS的Chromebook上网本产品。\r\n\r\n不过这则广告并未干扰到用户的正常网页浏览，因为它以黄色文本框的形式显示在Chrome浏览器新标签页的上方，进而避开了网页内容，不会与网页上的广告形成冲突。\r\n这个页面通常是用户进行页面转换的“中转站”，但其地位却越来越重要，它不仅是Chrome Web Store应用商店的枢纽，而且成为Chrome OS操作系统的主屏幕菜单键。\r\n这则广告使人想到谷歌偶尔在其主页Google.com上发布的推广链接，这些广告没有用光鲜的字号去转移用户的注意力，而是与整洁的背景融为一体。\r\n谷歌在2008年9月推出Chrome浏览器时就曾明确表示，这款浏览器只是谷歌盈利的辅助工具，谷歌希望用户查看网页时速度更快，使程序员能够打造更加先进的网络应用，例如Google Docs软件。\r\n自那以来，谷歌一直把Chrome浏览器当作一个载体，推出全新的网络应用功能，例如全新的语音文本转换扩展，并鼓励即将成为谷歌标准的SPDY网络、WebM视频和WebP图片。\r\n谷歌在Chrome浏览器新标签页面投放的广告很可能与谷歌的主页广告一样，主要用于推广谷歌自己的服务，有时会用于发布有关自然灾害响应的重要信息。不过谷歌不会像雅虎一样出售这片广告区域。\r\n没有什么能够阻止谷歌在Chrome浏览器上随处发布广告，但如果目前谷歌这样做，用户就会感到厌烦，而目前浏览器市场还有很多其它的选择。从长远来看，谷歌通过这款浏览器推广先进的网络服务并促使人们使用谷歌搜索，这会比出售浏览器主页的横幅广告带来更多的营收。', '腾讯科技讯（小贝）北京时间11月26日消息，谷歌开始借助Chrome浏览器投放在线广告。近日有用户注意到，谷歌Chrome浏览器页面上方出现了一则广告，推广基于Chrome OS的Chromebook上网本产品。', NULL, 'yii, test, blog', 2, 1322304800, 1322304800, 1, 0),
(6, '上百MSN账号被盗列表好友遇骗局 MSN中国正调查', '如果你的MSN好友在线让你帮他充值或汇款，一定要注意防范，因为很可能是骗局。昨天，记者发现有众多微博用户发帖称自己的账户被黑客盗取，黑客利用盗取的MSN账户向MSN列表里的好友发送信息，请求帮忙购买电话卡、网游点卡甚至汇款等。截至记者昨晚截稿时，已经至少有上百名MSN用户声称自己遭遇此类骗局。', '如果你的MSN好友在线让你帮他充值或汇款，一定要注意防范，因为很可能是骗局。', NULL, '', 2, 1322328069, 1322328297, 1, 0),
(7, 'ueditor-for-yii 所见即所得富文本web编辑器', '<p><a style="text-decoration:underline;" href="http://code.google.com/p/ueditor-for-yii/"><span style="font-size:16px">ueditor-for-yii</span></a></p><div id="psum"><a id="project_summary_link" href="http://code.google.com/p/ueditor-for-yii/">Ueditor是由百度web前端研发部开发的所见即所得富文本web编辑器，开源基于BSD协议。\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n    </a></div><div>最近看到百度开源的一个产品Ueditor 所见即所得富文本web编辑器，感觉很不错，最近又有一个项目，是用YiiFramework 开发的，就把Ueditor 用在这项目里了，于是就把它写成了extensions形式提供给大家下载！yii 地址：<a href="http://www.yiiframework.com/extension/ueditor-for-yii/">http://www.yiiframework.com/extension/ueditor-for-yii/\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n    </a></div><div>由于文件大过2M上传不了到YII官方网站的extensions库里！不一会就好几个差评了！最来就把它上传到谷歌上面了！\r\n\r\n\r\n</div><div>如果有用到的话大家拿去吧！下载地址：<a href="http://code.google.com/p/ueditor-for-yii/downloads/list">http://code.google.com/p/ueditor-for-yii/downloads/list\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n    </a></div><div>使用方法：\r\n\r\n\r\n</div><p>…how to use this extension…\r\n\r\n\r\n</p><p>把ueditor插件放到 extensions/ 在Html 调用\r\n\r\n\r\n</p><pre class="brush:php;toolbar:false;">&lt;?php&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;widget(''ext.ueditor.Ueditor'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;array(&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''getId''=&gt;''Article_content'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''textarea''=&gt;"Article[content]",&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''imagePath''=&gt;''/attachment/ueditor/'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''UEDITOR_HOME_URL''=&gt;''/'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;));&nbsp;&nbsp;&nbsp; \r\n?&gt;</pre><p>订制Toolbars 方法\r\n\r\n\r\n</p><pre class="brush:php;toolbar:false;">&lt;?php&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;widget(''ext.ueditor.Ueditor'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;array(&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''getId''=&gt;''Settings_about'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''minFrameHeight''=&gt;180,&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''textarea''=&gt;"Article[content]",&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''imagePath''=&gt;''/attachment/ueditor/'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''UEDITOR_HOME_URL''=&gt;''/'',&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''toolbars''=&gt;"''Undo'',''Redo'',''ForeColor'', ''BackColor'', ''Bold'',''Italic'',''Underline'',&nbsp;''JustifyLeft'',''JustifyCenter'',''JustifyRight'',&nbsp;,''InsertImage'',''ImageNone'',''ImageLeft'',''ImageRight'',''ImageCenter'',",&nbsp;&nbsp;&nbsp; \r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;));&nbsp;&nbsp;&nbsp; \r\n?&gt;</pre><p><br /></p><p>\r\n\r\n关于UEditor\r\n\r\n\r\n</p><p>Ueditor概述 \r\nUeditor是由百度web前端研发部开发的所见即所得富文本web编辑器，具有轻量，可定制，注重用户体验等特点，开源基于BSD协议，允许自由使用\r\n和使用代码 为什么使用Ueditor 体积小巧，性能优良，使用简单 分层架构，方便定制与扩展 满足不同层次用户需求，更加适合团队开发 \r\n丰富完善的中文文档 多个浏览器支持：Mozilla, MSIE, FireFox?, Maxthon,Safari 和Chrome 更好的使用体验 拥有专业QA团队持续支持，已应用在百度各大产品线上\r\n\r\n\r\n</p><p><br /></p>', 'Ueditor是由百度web前端研发部开发的所见即所得富文本web编辑器，开源基于BSD协议。</a></div><div>最近看到百度开源的一个产品Ueditor 所见即所得富文本web编辑器，感觉很不错，最近又有一个项目，是用YiiFramework 开发的，就把Ueditor 用在这项目里了，于是就把它写成了extensions形式提供给大家下载！', NULL, 'UEditor', 2, 1322404562, 1322583497, 1, 0),
(8, 'test', 'Your title here...\r\n==================\r\nYour title here...\r\n------------------\r\n### Your title here...\r\n#### Your title here...\r\n##### Your title here...\r\n###### Your title here...\r\n**b**\r\n_gg_\r\n\r\n\r\n~~~\r\n[php]\r\n<?php\r\n    $this->widget(''ext.ueditor.Ueditor'',\r\n            array(\r\n                ''getId''=>''Settings_about'',\r\n                ''minFrameHeight''=>180,\r\n                ''textarea''=>"Article[content]",\r\n                ''imagePath''=>''/attachment/ueditor/'',\r\n                ''UEDITOR_HOME_URL''=>''/'',\r\n                ''toolbars''=>"''Undo'',''Redo'',''ForeColor'',''BackColor'', ''Bold'',''Italic'',''Underline'',''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''InsertImage'',''ImageNone'',''ImageLeft'',''ImageRight'',''ImageCenter'',",\r\n            ));\r\n?>\r\n~~~\r\n', '', NULL, '', 2, 1322580959, 1322583443, 1, 0),
(9, '标题 cannot be blank. ', 'Your title here...\r\n==================\r\nYour title here...\r\n------------------\r\n### Your title here...\r\n### Your title here...\r\n##### Your title here...\r\n###### Your title here...~~~\r\n[php]\r\nYour Code here...\r\n~~~\r\n', '', NULL, '', 2, 1323511144, 1323511144, 1, 0),
(10, '标题 cannot be blank. ', 'Your title here...\r\n==================\r\nYour title here...\r\n------------------\r\n', '', NULL, 'about', 2, 1323530939, 1323530939, 1, 0),
(11, '标题 cannot be blank. ', 'Your title here...\r\n==================\r\nYour title here...\r\n------------------\r\n### Your title here...\r\n#### Your title here...\r\n##### Your title here...\r\n###### Your title here...\r\n\r\n', '', NULL, '', 2, 1323705679, 1323705679, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dlf_tag`
--

CREATE TABLE IF NOT EXISTS `dlf_tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) unsigned default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `dlf_tag`
--

INSERT INTO `dlf_tag` (`id`, `name`, `frequency`) VALUES
(1, 'yii', 2),
(2, 'blog', 2),
(3, 'test', 2),
(4, 'much', 1),
(5, 'about', 2),
(6, 'UEditor', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dlf_user`
--

CREATE TABLE IF NOT EXISTS `dlf_user` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `username` varchar(128) NOT NULL,
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `password` varchar(128) NOT NULL,
  `avatar` varchar(128) NOT NULL COMMENT '头像',
  `salt` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `profile` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dlf_user`
--

INSERT INTO `dlf_user` (`id`, `username`, `nickname`, `password`, `avatar`, `salt`, `email`, `profile`) VALUES
(1, 'demo', '', '2e5c7db760a33498023813489cfadc0b', '', '28b206548469ce62182048fd9cf91760', 'webmaster@example.com', NULL);
