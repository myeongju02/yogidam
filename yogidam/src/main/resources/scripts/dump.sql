
-- 로그인 용
INSERT INTO `users` (`id`, `password`, `nickname`, `point`, `email`, `birth`, `profile`, `profiletitle`, `role`)
VALUES 
('ssafy01', '$2a$10$iEOJ4P4fEopjtpFYYXCQKur5mHb49ogsAwvzJfiXULtWpXdx/uZA6', 'SSAFY', 0, 'ssafy@example.com', '2025-05-06', 'https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/pexels-bertellifotografia-3792581.jpg', NULL, 'USER'),
('traveler02', '$2a$10$abcdefghijklmnopqrstuv', 'Traveler', 0, 'traveler02@example.com', '2025-05-10', 'https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/pexels-moh-adbelghaffar-771742.jpg', NULL, 'USER'),
('natureLover', '$2a$10$abcdefghijklmnopqrstuv', 'Nature Lover', 0, 'naturelover@example.com', '2025-05-11', 'https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/pexels-muffinsaurs-1214205.jpg', NULL, 'USER'),
('admin', '$2a$10$tvP5Wkzr7CDNp2aFSPjo3ebtc6bbMYS7FS5SJ7ne6jv65VgbmzFoW', '어드민', 0, 'admin@ssafy.com', '2025-05-15', 'https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/pexels-sulimansallehi-1704488.jpg', '?', 'USER');


-- 스탬프 챌린지 용(불변값)
insert into missions values('감성 사진 스탬프', 1, '📸 나만의 시선으로 여행을 기록하는 시간
 여행지에서 마주한 장면들을 자신의 감성으로 담아보세요.
 특별한 장비가 없어도, 일상의 순간이 한 장의 사진으로 오래 남을 수 있어요.', 10);
insert into missions values('혼밥 스탬프', 2, '🍽️ 혼자여도 편안한 식사의 여유
혼자만의 시간 속에서 현지의 맛을 천천히 음미해보세요.
북적이지 않는 식당, 조용한 카페에서의 식사는
여행의 또 다른 즐거움이 되어줍니다.', 10);
 insert into missions values('도보 스탬프', 3, '🚶 발걸음으로 느끼는 도시의 결
도보 여행은 가장 느리지만, 가장 깊이 여행지를 이해할 수 있는 방법입니다.
천천히 걸으며 골목의 풍경, 소리, 냄새까지 경험해보세요.', 10);
 insert into missions values('문화 체험 스탬프', 4, '🎭 직접 체험하며 만나는 지역의 이야기
단순한 관람을 넘어, 직접 체험해보는 문화는 더 오래 기억에 남습니다.
그 지역만의 전통, 예술, 음식 등을 몸으로 느껴보세요.', 10);
 insert into missions values('밤하늘 감상 스탬프', 5, '🌌 하루의 끝, 별빛과 함께하는 시간
도심을 벗어나 올려다본 밤하늘은 여행 중 가장 조용한 감동을 줍니다.
가만히 앉아 별을 바라보는 그 순간, 마음도 함께 쉬어갑니다.', 10);
 insert into missions values('감성 산책 스탬프', 6, '🌿 조용히 걷다 보면 비로소 보이는 것들
여유롭게 걷는 산책은 마음을 정돈하는 좋은 방법입니다.
자연의 소리를 들으며 길을 걷다 보면
작은 풍경들이 더 크게 다가올 거예요.', 10);

-- 스탬프 챌린지 용(가변값)
insert into stamp_missions values(1, 'admin', 1, 'test', 'test','https://yogidam.s3.ap-northeast-2.amazonaws.com/challenge/1c26bf2c-cfcb-43ed-ab73-890a4d34fa36_%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202025-05-23%20144125.png/6397c79c-df0a-4970-9f51-038639df1f67_upload-18341066995549908851-4355cacf-a42d-4b79-a2c4-8f2d3e9b9b18______2025_05_23_144125.png', NULL);


-- 여행계획 용, 여행지 리스트 챌린지 용
-- attractions
INSERT INTO `attractions` (
  `attraction_id`, `title`, `addr1`, `addr2`, `areacode`,
  `booktour`, `cat1`, `cat2`, `cat3`, `contenttypeid`,
  `createdtime`, `firstimage`, `firstimage2`, `cpyrhtDivCd`, `mapx`,
  `mapy`, `mlevel`, `modifiedtime`, `sigungucode`, `tel`
) VALUES
('2484146', '궁가는여우', '서울특별시 종로구 자하문로 3 (내자동)', '지하 1층', '1',
 '', 'A04', 'A0401', 'A04010600', '38',
 '20170307223603', '', '', '', '126.9723657428',
 '37.5764807580', '6', '20250311151425', '23', ''),
 
('2819304', '아시안쿠진 경복궁점', '서울특별시 종로구 자하문로1길 7-1', '', '1',
 '', 'A05', 'A0502', 'A05020700', '39',
 '20220511142057', '', '', '', '126.9719546683',
 '37.5765168579', '6', '20240123134301', '23', ''),

('2820889', '경복궁에 맛있는 부엌', '서울특별시 종로구 사직로 103', '', '1',
 '', 'A05', 'A0502', 'A05020100', '39',
 '20220520134223', '', '', '', '126.9702631619',
 '37.5763001859', '6', '20241211164057', '23', ''),

('129811', '국립고궁박물관', '서울특별시 종로구 효자로 12 (세종로)', '', '1',
 '', 'A02', 'A0206', 'A02060100', '14',
 '20070905090000', 'http://tong.visitkorea.or.kr/cms/resource/75/3350375_image2_1.jpg',
 'http://tong.visitkorea.or.kr/cms/resource/75/3350375_image3_1.jpg',
 'Type3', '126.9749904992', '37.5766446750', '6', '20250402145520', '23', ''),

('2615461', '경복궁 생과방', '서울특별시 종로구 사직로 161 (세종로)', '', '1',
 '', 'A02', 'A0207', 'A02070200', '15',
 '20190816224954', 'http://tong.visitkorea.or.kr/cms/resource/99/2962999_image2_1.jpg',
 'http://tong.visitkorea.or.kr/cms/resource/99/2962999_image3_1.jpg',
 'Type3', '126.9767375783', '37.5760836609', '6', '20250307100541', '23', '1522-2295'),

('2614775', '만연사 선캄브리아기 화강편마암 (무등산권 국가지질공원)', '전라남도 화순군 화순읍 동구리', '', '38',
 '', 'A01', 'A0102', 'A01020200', '12',
 '20190809192423', 'http://tong.visitkorea.or.kr/cms/resource/74/2614774_image2_1.bmp',
 'http://tong.visitkorea.or.kr/cms/resource/74/2614774_image2_1.bmp',
 'Type3', '126.9858810969', '35.0784670815', '6', '20231214165038', '24', ''),

('127356', '너릿재공원', '광주광역시 동구 남문로 48-8', '(선교동)', '5',
 '', 'A02', 'A0202', 'A02020700', '12',
 '20031111090000', 'http://tong.visitkorea.or.kr/cms/resource/10/3366810_image2_1.jpg',
 'http://tong.visitkorea.or.kr/cms/resource/10/3366810_image3_1.jpg',
 'Type3', '126.9535616807', '35.0803774303', '6', '20250321102553', '3', ''),

('127355', '남산공원(화순)', '전라남도 화순군 화순읍 진각로 87', '(화순읍)', '38',
 '', 'A02', 'A0202', 'A02020700', '12',
 '20031105090000', '', '', '', '126.9849483300',
 '35.0591275802', '6', '20240611091706', '24', '');

-- plan_attractions
INSERT INTO `plan_attractions` VALUES
('c7618654-3a09-11f0-9880-8cb0e9df887d', '89e1d007-394b-48b4-b875-36b52b6a7e53', '2484146', NULL, NULL, NULL, NULL),
('c7618925-3a09-11f0-9880-8cb0e9df887d', '89e1d007-394b-48b4-b875-36b52b6a7e53', '2819304', NULL, NULL, NULL, NULL),
('c76189df-3a09-11f0-9880-8cb0e9df887d', '89e1d007-394b-48b4-b875-36b52b6a7e53', '2820889', NULL, NULL, NULL, NULL),
('c7618a17-3a09-11f0-9880-8cb0e9df887d', '89e1d007-394b-48b4-b875-36b52b6a7e53', '129811', NULL, NULL, NULL, NULL),
('c7618a47-3a09-11f0-9880-8cb0e9df887d', '89e1d007-394b-48b4-b875-36b52b6a7e53', '2615461', NULL, NULL, NULL, NULL),
('ff7fc7bb-39d6-11f0-8c61-8cb0e9df887d', 'e530b7c7-2452-48dc-8531-7ab4757fe506', '2614775', NULL, NULL, NULL, NULL),
('ff7fc9ba-39d6-11f0-8c61-8cb0e9df887d', 'e530b7c7-2452-48dc-8531-7ab4757fe506', '127356', NULL, NULL, NULL, NULL),
('ff7fca2b-39d6-11f0-8c61-8cb0e9df887d', 'e530b7c7-2452-48dc-8531-7ab4757fe506', '127355', NULL, NULL, NULL, NULL);

-- plans
INSERT INTO `plans` VALUES
('89e1d007-394b-48b4-b875-36b52b6a7e53', 'admin', '경복궁', NULL, NULL, '2025-05-26 17:16:52', NULL),
('e530b7c7-2452-48dc-8531-7ab4757fe506', 'admin', '화순 여행', NULL, NULL, NULL, NULL);

-- 커뮤니티 용
-- board
INSERT INTO `board` (`id`, `title`, `content`, `author`, `created_at`, `category`, `images`, `files`) VALUES
(4, '제주도에서의 힐링 여행기', '푸른 바다와 한라산이 어우러진 제주도에서 힐링 여행을 다녀왔어요. 특히 노리매공원의 라벤더 향이 아직도 잊혀지질 않네요!', 'admin', '2025-05-26 15:30:00', 'review', 
    '[{"id":"img1","url":"https://yogidam.s3.ap-northeast-2.amazonaws.com/img/guleum-baegyeong-eulo-hujisan-hyeongtae.jpg"},
    {"id":"img2","url":"https://yogidam.s3.ap-northeast-2.amazonaws.com/img/guleumgwa-puleun-haneul-eul-baegyeong-eulo-aleumdaun-san-pung-gyeong-ui-sujig-imiji.jpg"}]', 
    '[]'),

(5, '경복궁 야경 산책 후기', '밤에 보는 경복궁은 정말 멋졌어요. 전통과 현대가 어우러진 모습에 감탄했습니다. 생과방의 디저트도 최고였어요.', 'traveler02', '2025-05-26 17:45:00', 'review', 
    '[{"id":"img3","url":"https://yogidam.s3.ap-northeast-2.amazonaws.com/img/busan-haeundae-morning-walk.png"}]', 
    '[]'),

(6, '마라도에서의 조용한 하루', '대한민국 최남단 마라도. 배를 타고 도착한 후 해양도립공원을 천천히 산책하며 마음의 평화를 느꼈습니다.', 'natureLover', '2025-05-27 09:15:00', 'review', 
    '[]', 
    '[]'),
(7, '부산 해운대에서의 아침 산책', 
 '이른 아침 해운대 해변을 따라 산책을 했습니다. 파도 소리와 시원한 바람 덕분에 하루가 상쾌하게 시작되었어요. 근처 카페에서 마신 따뜻한 라떼도 인상적이었습니다.', 
 'admin', 
 '2025-05-27 08:00:00', 
 'review',
 '[{"id":"img4","url":"https://yogidam.s3.ap-northeast-2.amazonaws.com/img/busan-haeundae-morning-walk.jpg"}]', 
 '[]');
 
-- board_comment
INSERT INTO `board_comment` (`id`, `board_id`, `author`, `content`, `parent_id`, `created_at`) VALUES
(1, 4, 'jejuFan', '저도 지난달에 노리매공원 다녀왔어요. 라벤더 향 최고죠 💜', NULL, '2025-05-26 16:00:00'),
(2, 4, 'healingTrip', '사진 보니까 또 가고 싶네요. 혹시 추천 숙소 있나요?', NULL, '2025-05-26 16:20:00'),
(3, 4, 'ssafy01', '저는 에어비앤비에서 한 독채 숙소 이용했어요! 조용하고 좋았어요.', 2, '2025-05-26 16:25:00'),

(4, 5, 'historyNerd', '경복궁 야경 투어 진짜 멋있죠! 조명 아래 한복 입고 사진 찍으면 인생샷이에요.', NULL, '2025-05-26 18:10:00'),
(5, 5, 'foodie', '생과방 디저트 어떤 거 드셨어요? 저도 곧 갈 예정이라 궁금해요!', NULL, '2025-05-26 18:25:00'),

(6, 6, 'maradoFan', '조용한 마라도, 자연 그대로라 더 감동이었어요. 사진 있으면 공유해 주세요~', NULL, '2025-05-27 09:30:00');