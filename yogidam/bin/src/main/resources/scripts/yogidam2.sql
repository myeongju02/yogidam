Table users {
  id varchar(25) [primary key]
  password varchar(100) [not null]
  nickname varchar(25) [not null]
  point int 
  email varchar(100) [not null, unique]
  birth date [not null]
  profile varchar(255)
  profiletitle varchar(25) 
  role VARCHAR(50) [not null]
}

Table plans {
  plan_id varchar(25) [primary key]
  user_id varchar(25) [not null]
  title varchar(100) [not null]
  start_date date
  end_date date
  created_at datetime
  memo text
}

Table attractions {
  attraction_id varchar(50) [primary key]
  title varchar(200) [not null]
  addr1 varchar(255)
  addr2 varchar(255)
  areacode varchar(20)
  booktour varchar(10)
  cat1 varchar(20)
  cat2 varchar(20)
  cat3 varchar(20)
  contenttypeid varchar(20)
  createdtime varchar(30)
  firstimage varchar(255)
  firstimage2 varchar(255)
  cpyrhtDivCd varchar(20)
  mapx varchar(50)
  mapy varchar(50)
  mlevel varchar(10)
  modifiedtime varchar(30)
  sigungucode varchar(20)
  tel varchar(50)
}

Table plan_attractions {
  plan_attraction_id varchar(25) [primary key]
  plan_id varchar(25) [not null]
  attraction_id varchar(25) [not null]
  visit_date date
  visit_order int
  memo text
}

Table missions {
  mission_id varchar(25) [primary key]
  attraction_id varchar(25) [not null]
  type varchar(25)
  description varchar(255)
  value varchar(25)
}

Table user_missions {
  user_mission_id varchar(25) [primary key]
  user_id varchar(25) [not null]
  mission_id varchar(25) [not null]
  attraction_id varchar(25) [not null]
  status varchar(25)
  proof varchar(255)
  completed datetime
}

Table rewards {
  reward_id varchar(25) [primary key]
  user_id varchar(25) [not null]
  type varchar(50)
  value varchar(25)
  acquired datetime
}

Ref: users.id < plans.user_id // one-to-many
Ref: plans.plan_id < plan_attractions.plan_id // one-to-many
Ref: attractions.attraction_id < plan_attractions.attraction_id // one-to-many
Ref: attractions.attraction_id < missions.attraction_id // one-to-many
Ref: users.id < user_missions.user_id // one-to-many
Ref: missions.mission_id < user_missions.mission_id // one-to-many
Ref: attractions.attraction_id < user_missions.attraction_id // one-to-many
Ref: users.id < rewards.user_id // one-to-many
