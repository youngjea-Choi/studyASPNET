USE [studyASPNET]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023-01-13 오후 2:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [nvarchar](20) NULL,
	[postdate] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2023-01-13 오후 2:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ReadCount] [int] NOT NULL,
	[PostDate] [datetime2](7) NOT NULL,
	[Contents] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 2023-01-13 오후 2:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Division] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](500) NULL,
	[FileName] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [postdate]) VALUES (1, N'Apple', N'1', CAST(N'2023-01-06T15:18:20.000' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [postdate]) VALUES (2, N'SONY', N'2', CAST(N'2023-01-06T15:19:30.000' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [postdate]) VALUES (3, N'HONDA', N'3', CAST(N'2023-01-06T15:19:50.000' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [postdate]) VALUES (4, N'TOYOTA', N'4', CAST(N'2023-01-06T15:20:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Notes] ON 

INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (1, N'dktmskf117', N'이마무라영재', N'첫번째 게시글입니다', 2, CAST(N'2023-01-10T10:11:55.5566035' AS DateTime2), N'<p>게시글 내용입니다. 하하하</p><p>유카랑 일본에서 꼭 만날꺼에요</p><p>너무 기대가 됩니다</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (2, N'dktmskf117', N'유카영재', N'두번째', 6, CAST(N'2023-01-06T17:45:00.0000000' AS DateTime2), N'게시글...')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (5, N'YUUKA', N'유카영재', N'에디터 추가후 새글', 5, CAST(N'2023-01-09T14:42:00.0000000' AS DateTime2), N'<p><strong>새글</strong>입니다.</p><p>e=mc<sup>2</sup></p><p><em>내용을 보죠.</em></p><p>이미지를 넣습니다.<a href="https://www.naver.com" target="_self">네이버</a></p><p><img src="https://w.namu.la/s/dc42bb0527e08b0d65f370f3a8ad1c471ccbd90a5f01b85343e6471c7f4100486b9be8514d380c33651c70fdc1c7da610cd2effaa9696b1226d29082faa22131e41b8bd7a75491abd0819c4789a517c02dad5059a08b5d7fd07a01c1ad6fa6e83c6fbb1ea7f05bfb88a5e26947fa78af" style="background-color: var(--bs-body-bg); font-family: var(--bs-body-font-family); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);" alt=""><br></p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (11, N'IMAMURA', N'유카영재', N'유카', 2, CAST(N'2023-01-10T10:27:44.0331985' AS DateTime2), N'<p>유카 정말 고마워</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (13, N'IMAMURA', N'유카영재', N'안녕', 1, CAST(N'2023-01-10T10:36:33.3599106' AS DateTime2), N'<p>오하요 고자이마스</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (14, N'IMAMURA', N'유카영재', N'다섯번째', 1, CAST(N'2023-01-10T10:36:50.2017375' AS DateTime2), N'<p>니하오 보단 오하요</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (20, N'IMAMURA', N'영재', N'벤츠의 벤젠 초과 검출', 2, CAST(N'2023-01-12T09:43:37.4587478' AS DateTime2), N'<p class="media_end_head go_trans" style="background-color: var(--color_background); color: rgb(48, 48, 56); font-family: 나눔고딕, NanumGothic, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, 돋움, Dotum, 굴림, Gulim, Helvetica, sans-serif; font-size: 14px;"></p><div class="media_end_head_title" style="position: relative; margin: 0px auto; padding: 8px 0px 5px; color: var(--color_title); letter-spacing: -0.3px; font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 24px; max-width: none;"><h2 id="title_area" class="media_end_head_headline" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; display: inline; line-height: 38px; font-size: 30px; font-weight: bold; letter-spacing: -2px;">2021년식 벤츠 GLA250서 벤젠 초과 검출</h2></div><div class="media_end_head_info nv_notrans " style="position: relative; width: 700px; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: var(--color_background); max-width: none; margin-left: auto; margin-right: auto;"><div class="media_end_head_info_datestamp" style="padding: 0px 0px 4px; font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 13px; line-height: 18px; color: var(--color_sub_info2); vertical-align: top; letter-spacing: -0.2px;"><div class="media_end_head_info_datestamp_bunch" style="display: inline-block;"><span class="media_end_head_info_datestamp_term" style="margin-right: 2px; letter-spacing: -0.4px;">입력</span><span class="media_end_head_info_datestamp_time _ARTICLE_DATE_TIME" data-date-time="2023-01-10 14:46:07">2023.01.10. 오후 2:46</span></div>&nbsp;<div class="media_end_head_info_datestamp_bunch" style="display: inline-block;">&nbsp;<span class="media_end_head_info_datestamp_term" style="margin-right: 2px; letter-spacing: -0.4px;">수정</span><span class="media_end_head_info_datestamp_time _ARTICLE_MODIFY_DATE_TIME" data-modify-date-time="2023-01-10 16:56:24">2023.01.10. 오후 4:56</span></div>&nbsp;<a href="http://www.segye.com/content/html/2023/01/10/20230110514341.html?OutUrl=naver" target="_blank" class="media_end_head_origin_link" data-clk="are.ori" data-gdid="022" data-extra="{&quot;lk&quot;:{&quot;oid&quot;:&quot;022&quot;,&quot;aid&quot;:&quot;7aa03f2986923b37&quot;}}" style="color: rgb(118, 118, 120); text-decoration-line: none; display: inline-block; height: 22px; padding: 0px 8px; margin-left: 5px; border-radius: 13px; border: 1px solid rgb(232, 233, 236); font-size: 12px; line-height: 22px; letter-spacing: -0.4px;">기사원문</a></div><div class="media_end_head_journalist" style="position: relative; margin-top: 7px; font-size: 0px; line-height: 0;"><a href="https://media.naver.com/journalist/022/73379" class="media_end_head_journalist_box" data-clk="ummore" style="color: var(--color_body); text-decoration-line: none; display: inline-flex; min-height: 24px; font-size: 14px; line-height: 14px; -webkit-box-align: center; align-items: center; letter-spacing: -0.43px; vertical-align: top;"><span class="media_end_head_journalist_name" style="position: relative; color: var(--color_body);">이동준 기자</span></a></div><div class="media_end_head_info_variety" style="position: relative; display: flex; -webkit-box-pack: justify; justify-content: space-between; flex-wrap: wrap; margin-top: 15px;"><div class="media_end_head_info_variety_left" id="commentFontGroup" style="display: inline-flex; margin-top: 7px;"><div class="media_end_head_info_variety_likeit _LIKE_HIDE as_likeit_improve" style="position: relative;"><div class="_reactionModule u_likeit nv_notrans" data-sid="NEWS" data-cid="ne_022_0003772637" data-loaded="1" data-facetype="1" style="display: inline-block; position: relative; float: left; visibility: visible; width: auto; height: 33px; overflow: visible;"><a class="u_likeit_button _face _LIKE_BUTTON off" data-label="recommend" aria-haspopup="true" aria-pressed="false" data-clk="RTL.face" style="color: rgb(34, 34, 34); text-decoration-line: none; display: inline-block; font-size: 0px; height: 36px; padding: 0px 9px 0px 8px; font-weight: 700; line-height: 34px; border-width: 1px; border-style: solid; border-image: initial; border-color: var(--color_likeit_line_lv3); border-radius: 20px; background-color: var(--color_likeit_background); cursor: pointer;"><span class="u_likeit_icons _icons" style="position: relative; top: 6px; margin-right: 2px;"><span class="u_likeit_icon __reaction__wow" style="display: inline-block; position: relative; width: 21px; height: 21px; border-radius: 50%; background: var(--color_likeit_background); z-index: 3;"></span>&nbsp;<span class="u_likeit_icon __reaction__recommend" style="display: inline-block; position: relative; width: 21px; height: 21px; border-radius: 50%; background: var(--color_likeit_background); margin-left: -7px; z-index: 2;"></span></span>&nbsp;<span class="u_likeit_text _count num" style="font-family: Helvetica, &quot;Apple SD Gothic Neo&quot;, 나눔고딕, NanumGothic, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, 돋움, Dotum, sans-serif; position: relative; top: 0px; font-size: 12px; font-weight: 400; color: var(--color_likeit_title); letter-spacing: -0.4px;">2</span></a></div></div><div class="media_end_head_info_variety_cmtcount _COMMENT_HIDE" style="margin: 0px 6px;"><a href="https://n.news.naver.com/mnews/article/comment/022/0003772637?sid=101" class="media_end_head_cmtcount_button _COMMENT_COUNT_VIEW is_zero" id="comment_count" data-clk="rplt" data-zero-allow="false" data-max-limit="true" style="color: var(--color_title); text-decoration-line: none; position: relative; display: block; max-width: 79px; height: 36px; padding: 0px 10px 0px 30px; border-width: 1px; border-style: solid; border-image: initial; border-color: var(--color_line_lv3); border-radius: 20px; font-family: Helvetica, &quot;Apple SD Gothic Neo&quot;, 나눔고딕, NanumGothic, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, 돋움, Dotum, Arial, sans-serif; font-size: 12px; line-height: 34px; letter-spacing: -0.4px;">댓글</a></div></div><div class="media_end_head_info_variety_right" style="display: inline-flex; margin-top: 7px; margin-right: 0px; margin-left: auto;"><div id="_SUMMARY_BUTTON" class="media_end_head_autosummary _auto_summary_wrapper _SUMMARY _LIKE_HIDE" data-officeid="022" data-articleid="0003772637" style="display: inline-block; vertical-align: top; margin-left: 0px;"><a class="media_end_head_autosummary_button _toggle_btn _SUMMARY_BTN" data-clk="sum" style="color: var(--color_body); text-decoration-line: none; display: block; position: relative; padding: 5px;"><span class="blind" style="position: absolute; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); width: 1px; height: 1px; margin: -1px;">본문 요약봇</span></a></div><div id="tts_player_div_wrap" class="media_end_head_tts nv_notrans" style="display: inline-block; margin-left: 5px;"><button type="button" class="media_end_head_tts_run _TTS_SETTING_BTN" title="텍스트 음성 변환 서비스" data-clk="wtts" style="padding: 5px; font-size: 14px; font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; line-height: 1.25em; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; vertical-align: top; overflow: visible; border-width: 0px; border-style: initial; border-color: initial;"><span class="blind" style="position: absolute; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); width: 1px; height: 1px; margin: -1px;">텍스트 음성 변환 서비스 사용하기</span></button></div><div id="tts_player_div"></div><div class="media_end_head_fontsize _font_size_config_wrapper _FONT_WRAP" style="display: inline-block; margin-left: 5px;"><a href="https://n.news.naver.com/mnews/article/022/0003772637?sid=101#" class="media_end_head_fontsize_set _font_size_config_toggle_btn _FONT_BUTTON" data-clk="fsz" style="color: var(--color_body); text-decoration-line: none; position: relative; display: block; padding: 5px;"><span class="blind" style="position: absolute; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); width: 1px; height: 1px; margin: -1px;">글자 크기 변경하기</span></a></div><div class="media_end_head_share nv_notrans" style="display: inline-block; margin-left: 5px;"><a href="https://n.news.naver.com/mnews/article/022/0003772637?sid=101#" id="spiButton" class="u_btn_sns_share naver-splugin spi_sns_share nv_notrans _SHARE_BUTTON" data-clk="ushr" data-style="type_a" data-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101" data-canonical-url="https://news.naver.com/main/read.naver?mode=LSD&amp;mid=sec&amp;oid=022&amp;aid=0003772637&amp;sid1=001" data-title="2021년식 벤츠 GLA250서 벤젠 초과 검출" data-likeserviceid="NEWS" data-likecontentsid="ne_022_0003772637" data-mail-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=mail" data-blog-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=blog" data-blog-source-type="3" data-blog-blog-id="naver" data-cafe-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=cafe" data-cafe-source-type="3" data-memo-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=memo" data-calendar-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=calendar" data-band-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=band" data-line-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=line" data-kakaotalk-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=kakao" data-kakaostory-display="off" data-kakaotalk-image-url="https://imgnews.pstatic.net/image/022/2023/01/10/20230110514321_20230110165624476.jpg?type=nf300_200" data-facebook-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=facebook" data-twitter-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=twitter" data-mypeople-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=mypeople" data-friend-display="on" data-friend-url="https://n.news.naver.com/mnews/article/022/0003772637?sid=101&amp;lfrom=friend" splugin-id="1989124496" style="color: var(--color_body); text-decoration-line: none; display: block; padding: 5px;"><span class="naver-splugin-c send_caption" style="background-image: url(&quot;https://ssl.pstatic.net/static.news/image/news/m/2022/12/19/sp_n.png&quot;); background-size: 380px 379px; background-repeat: no-repeat; width: 26px; height: 26px; background-position: 0px -310px; display: block;"><span class="u_hc" style="position: absolute; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); width: 1px; height: 1px; margin: -1px; left: 0px;">SNS 보내기</span></span></a></div><div class="media_end_head_print" style="display: inline-block; margin-left: 12px;"><a href="https://n.news.naver.com/mnews/article/022/0003772637?sid=101#" class="media_end_print_link _PRINT_BUTTON" data-print-url="/mnews/article/print/022/0003772637" data-clk="print" style="color: var(--color_body); text-decoration-line: none; display: block;"><span class="blind" style="position: absolute; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); width: 1px; height: 1px; margin: -1px;">인쇄하기</span></a></div></div></div></div><p></p><div id="contents" class="newsct_body" style="padding: 30px 0px 0px; background-color: var(--color_background); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; line-height: 1.6; color: rgb(48, 48, 56);"><div id="newsct_article" class="newsct_article _article_body" style="letter-spacing: -0.3px; color: var(--color_body); overflow-wrap: break-word; font-size: 1em; line-height: 1.56; max-width: none; margin-left: auto; margin-right: auto; padding-left: 0px; padding-right: 0px;"><div id="dic_area" class="go_trans _article_content" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><table class="nbd_table" style="margin: 13px 0px; padding: 0px; font-size: 15px; line-height: 20px; width: 700px; color: rgb(134, 134, 134); letter-spacing: -1px; text-align: center;"><tbody><tr><td style="margin: 0px; padding: 0px; line-height: 20px;"><span class="end_photo_org" style="position: relative; z-index: 1; display: block; margin: 0px; padding-top: 1px; zoom: 1; line-height: 20px;"><div class="nbd_im_w _LAZY_LOADING_WRAP " style="clear: both; margin: 0px; padding-top: 0px;"><div class="nbd_a _LAZY_LOADING_ERROR_HIDE" id="img_a1" style="position: relative;"><img id="img1" class="_LAZY_LOADING" src="https://imgnews.pstatic.net/image/022/2023/01/10/20230110514321_20230110165624476.jpg?type=w647" style="border: 0px; vertical-align: top; width: 700px; margin-bottom: 14px;"></div></div></span></td></tr><tr><td style="margin: 0px; padding: 0px; line-height: 20px;">‘벤젠’이 기준치를 초과해 검출된&nbsp;<span data-type="ore" data-lang="en" style="line-height: 20px;">GLA250</span>&nbsp;모델 모습. 벤츠코리아 제공</td></tr></tbody></table>&nbsp;<br>지난해 국내에 판매된 메르세데스 벤츠 차량의 실내 공기질을 측정한 결과&nbsp;‘벤젠’이 기준치를 초과해 검출된 것으로 나타났다.<br>&nbsp;<br>국토교통부는 16개 자동차 제작사의 25개 신차를 대상으로 한 실내 공기질 조사 결과를 10일 발표했다.<br>&nbsp;<br>국토부는 2011년부터 매년 신차의 실내 내장재에서 방출되는 폼알데하이드, 벤젠, 톨루엔 등 8개 휘발성 유해 물질이 권고 기준을 충족하는지 조사하고 있다.<br>&nbsp;<br>조사 결과 2021년형&nbsp;메르세데스벤츠&nbsp;<span data-type="ore" data-lang="en">GLA250</span>&nbsp;4MATIC의 경우 벤젠 방출량이 권고기준인 30㎍/㎥을 초과한 78㎍/㎥로 측정됐다.<br>&nbsp;<br>벤젠은 자동차 실내 내장재 중 합성섬유, 플라스틱 부품에서 방출되며 피로, 두통, 불쾌감을 유발할 수 있다.<br>&nbsp;<br>국토부는 벤츠에 해당 차량이 생산되는 독일 현지 생산라인과 부품 원재료·단품을 조사하고, 차량 실내 공기질을 추가 측정할 것을 지시했다.</div></div></div>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (21, N'IMAMURAYOUNGJEA1', N'IMAMURAYOUNGJEA1', N'테스트 ', 1, CAST(N'2023-01-12T10:17:54.0397181' AS DateTime2), N'<p>입력테스트&nbsp;</p><p>사용자 아이디로 저장됩니다</p>')
SET IDENTITY_INSERT [dbo].[Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[Profiles] ON 

INSERT [dbo].[Profiles] ([ID], [Division], [Title], [Description], [Url], [FileName]) VALUES (6, N'Top', N'이마무라의 포트폴리오', N'<p>오하요 고자이마스</p>', N'https://github.com/youngjea-Choi', N'c4bb3846-534d-49a1-ab44-98ae944ca0a5_aspnet_screen05.png')
INSERT [dbo].[Profiles] ([ID], [Division], [Title], [Description], [Url], [FileName]) VALUES (2, N'Card1', N'first skill', N'<p>저는 개발자 주니어이고 이마무라 영재입니다</p>', N'https://www.naver.com', N'1cc070c3-4e9c-4c1b-b020-c3b1f99c772d_profile02.png')
INSERT [dbo].[Profiles] ([ID], [Division], [Title], [Description], [Url], [FileName]) VALUES (7, N'Card2', N'Second Skill', N'<p>C# Winforms Programming</p><p>Winforms 4.8과 WPF, Xamarin</p>', NULL, N'cce63858-7e84-42d0-87af-b495be723e39_aspnet_screen04.png')
INSERT [dbo].[Profiles] ([ID], [Division], [Title], [Description], [Url], [FileName]) VALUES (8, N'Card3', N'Last Skill', N'<p>ASP.NET Core</p><p>NET.Core로 된 ASPNET Core 개발</p>', N'https://github.com/youngjea-Choi', N'e60e71a6-ac61-403b-8534-4c9d896463a5_profile03.png')
SET IDENTITY_INSERT [dbo].[Profiles] OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_PagingNotes]    Script Date: 2023-01-13 오후 2:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<이마무라 영재>
-- Create date: <2023.01.10>
-- Description:	<게시판 페이징용 SP>
-- =============================================
CREATE   PROCEDURE [dbo].[USP_PagingNotes]
    @StartCount Int, -- 페이징 시작카운드
	@EndCount Int    -- 페이징 종료카운드
AS
BEGIN
	SET NOCOUNT ON;

	-- 페이징용 쿼리 시작
			SELECT *
		FROM (
		   SELECT ROW_NUMBER() OVER (ORDER BY ID DESC) AS rowNum
			  ,Id
			  ,UserId
			  ,[Name]
			  ,Title
			  ,ReadCount
			  ,PostDate
			  ,Contents
		   FROM Notes
			 ) AS Base
		WHERE Base.rowNum BETWEEN @StartCount AND @EndCount









END
GO
