local NGX = require("NGX")
local _M = {}

function invalid_test()
  -- body
end

function _M.test()
    -- ngx_req_read_body()
  local body = ngx.ctx.body
local socket = require "socket"
local cjson = require("cjson")
  local cjson_decode = cjson.decode
  local rapidjson = require("rapidjson")
local utf8 = require("lua-utf8")
  local rapidjson_decode = require("rapidjson").decode
  -- local rapidjson_inplace = require("rapidjson").parseInsitu

  -- NGX.error(table.inspect(rapidjson))

  local json = require("JsonParser")
  local json_decode = json.decode



-- local ljson_decoder = require 'json_decoder'
-- local instance = ljson_decoder.create()
-- local result, err = ljson_decoder.parse(instance, body)

-- local ffi = require("ffi")
-- local C = ffi.C

-- local buff = ffi.new("uint8_t[?]", #body)
-- ffi.copy(buff,body)

-- local s = {"n","i","s","h","a","n","t"}

-- NGX.error(type(buff))
-- NGX.error(buff[0].." "..ffi.string(buff,1).." "..string.sub(body,1,1))
-- NGX.error(table.concat( s).." "..ffi.string())


-- local shift = 1
-- local index = 1
-- local s
-- for i=1,#b do
--   index, v = consume_value_utf8(b,index,true)
--   index = index + 1
--   NGX.error(v.." "..utf8.char(utf8.byte(b,i)))
--   if index > #b then break end
-- end

-- local tmp = {}
-- tmp[1] = 10
-- tmp[2] = 11
-- tmp[3] = 12
-- tmp[4] = 13
--  collectgarbage("stop")
--  local d
-- local len = #body
--   local buff = ffi.new("uint8_t[?]", len)

--  local t1 = socket.gettime()
--  for i=1,10000 do
  
--   ffi.copy(buff,body)
--   for i=0,len-1 do
--     d = buff[i]
--   end
-- end
-- NGX.error(t((socket.gettime()-t1)*1000))


--  t1 = socket.gettime()
--  for i=1,10000 do
--   local len = #body
--   -- local buff = ffi.new("uint8_t[?]", len)
--   -- ffi.copy(buff,body)
--   for i=1,len do
--     d = string.byte(body,i)
--   end
-- end
-- NGX.error(t((socket.gettime()-t1)*1000))

--  t1 = socket.gettime()
--  for i=1,10000 do
--   -- local len = #body
--   -- local buff = ffi.new("uint8_t[?]", len)
--   ffi.copy(buff,body)
--   for i=0,len-1 do
--     d = buff[i]
--   end
-- end
-- NGX.error(t((socket.gettime()-t1)*1000))


--  t1 = socket.gettime()
--  for i=1,10000 do
--   local len = #body
--   -- local buff = ffi.new("uint8_t[?]", len)
--   -- ffi.copy(buff,body)
--   for i=1,len do
--     d = string.byte(body,i)
--   end
-- end
-- NGX.error(t((socket.gettime()-t1)*1000))

--  collectgarbage("collect")

-- Dropped.execute("")
-- t1 = socket.gettime()
--  for i=1,100000 do
--   -- d = string.char(236,166,144)
--   d = tmp[3]
-- end
-- NGX.error(t((socket.gettime()-t1)*1000))

-- t1 = socket.gettime()
--  for i=1,100000 do
--   -- d = string.sub(body,120,124)
--   if i == 1 then
--     d = 1
--   elseif i == 100 then
--     d = 100
--   elseif i == 9 then
--     d = 9
--   else
--     d = -1
--   end
--       --todo

--     --todo
-- end
-- NGX.error(t((socket.gettime()-t1)*1000))
-- NGX.error(string.char(236,166,144,0))

-- NGX.error(string.char(236,166,144))

-- NGX.error(string.char(236,0,0))


  local mixed = '[{"favoriteFruit":"banana","greeting":"Hello, Kim! You have 10 unread messages.","friends":[{"name":"Higgins Rodriquez","id":0},{"name":"James Floyd","id":1},{"name":"Gay Stewart","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["pariatur","ad","eiusmod","sit","et","velit","culpa"],"longitude":-57.919246,"latitude":-36.022812,"registered":"Friday, March 21, 2014 9:13 PM","about":"Laborum nulla aliquip ullamco proident excepteur est officia ipsum. Eiusmod exercitation minim ex do labore reprehenderit aliqua minim qui excepteur reprehenderit cupidatat. Sint enim exercitation duis id consequat nisi enim magna. Commodo aliqua id ipsum sit magna enim. Veniam officia in labore fugiat veniam ea laboris ex veniam duis.\r\n","address":"323 Pulaski Street, Ronco, North Carolina, 7701","phone":"+1 (919) 438-2678","email":"kim.griffith@cipromox.biz","company":"CIPROMOX","name":{"last":"Griffith","first":"Kim"},"eyeColor":"green","age":26,"picture":"http://placehold.it/32x32","balance":"$1,283.55","isActive":false,"guid":"10ab0392-c5e2-48a3-9473-aa725bad892d","index":0,"_id":"551b91198238a0bcf9a41133"},{"favoriteFruit":"banana","greeting":"Hello, Skinner! You have 9 unread messages.","friends":[{"name":"Rhonda Justice","id":0},{"name":"Audra Castaneda","id":1},{"name":"Vicky Chavez","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["dolore","enim","sit","non","exercitation","fugiat","adipisicing"],"longitude":-60.291407,"latitude":-84.619318,"registered":"Friday, February 7, 2014 3:17 AM","about":"Consectetur eiusmod laboris dolore est ullamco nulla in velit quis esse Lorem. Amet aliqua sunt aute occaecat veniam officia in duis proident aliqua cupidatat mollit. Sint eu qui anim duis ut anim duis eu cillum. Cillum nostrud adipisicing tempor Lorem commodo sit in ad qui non et irure qui. Labore eu aliquip id duis eiusmod veniam.\r\n","address":"347 Autumn Avenue, Fidelis, Puerto Rico, 543","phone":"+1 (889) 457-2319","email":"skinner.maddox@moltonic.co.uk","company":"MOLTONIC","name":{"last":"Maddox","first":"Skinner"},"eyeColor":"green","age":22,"picture":"http://placehold.it/32x32","balance":"$3,553.10","isActive":false,"guid":"cfbc2fb6-2641-4388-b06d-ec0212cfac1e","index":1,"_id":"551b91197e0abe92d6642700"},{"favoriteFruit":"strawberry","greeting":"Hello, Reynolds! You have 5 unread messages.","friends":[{"name":"Brady Valdez","id":0},{"name":"Boyer Golden","id":1},{"name":"Gladys Knapp","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["commodo","eiusmod","cupidatat","et","occaecat","proident","Lorem"],"longitude":140.866287,"latitude":1.401032,"registered":"Monday, October 20, 2014 8:01 AM","about":"Deserunt elit consequat ea dolor pariatur aute consectetur et nulla ipsum ad. Laboris occaecat ipsum ad duis et esse ea ut voluptate. Ex magna consequat pariatur amet. Quis excepteur non mollit dolore cillum dolor ex esse veniam esse deserunt non occaecat veniam. Sit amet proident proident amet. Nisi est id ut ut adipisicing esse fugiat non dolor aute.\r\n","address":"872 Montague Terrace, Haena, Montana, 3106","phone":"+1 (974) 410-2655","email":"reynolds.sanford@combot.biz","company":"COMBOT","name":{"last":"Sanford","first":"Reynolds"},"eyeColor":"green","age":21,"picture":"http://placehold.it/32x32","balance":"$3,664.47","isActive":true,"guid":"f9933a9c-c41a-412f-a18d-e727c569870b","index":2,"_id":"551b91197f170b65413a06e3"},{"favoriteFruit":"banana","greeting":"Hello, Neva! You have 7 unread messages.","friends":[{"name":"Clara Cotton","id":0},{"name":"Ray Gates","id":1},{"name":"Jacobs Reese","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["magna","labore","incididunt","velit","ea","et","eiusmod"],"longitude":-133.058479,"latitude":87.803677,"registered":"Friday, May 9, 2014 5:41 PM","about":"Do duis occaecat ut officia occaecat officia nostrud reprehenderit ex excepteur aute anim in reprehenderit. Cupidatat nulla eiusmod nulla non minim veniam aute nulla deserunt adipisicing consectetur veniam. Sit consequat ex laboris aliqua labore consectetur tempor proident consequat est. Fugiat quis esse culpa aliquip. Excepteur laborum aliquip sunt eu cupidatat magna eiusmod amet nisi labore aliquip. Ut consectetur esse aliquip exercitation nulla ex occaecat elit do ex eiusmod deserunt. Ex eu voluptate minim deserunt fugiat minim est occaecat ad Lorem nisi.\r\n","address":"480 Eagle Street, Fostoria, Oklahoma, 2614","phone":"+1 (983) 439-3000","email":"neva.barker@pushcart.us","company":"PUSHCART","name":{"last":"Barker","first":"Neva"},"eyeColor":"brown","age":36,"picture":"http://placehold.it/32x32","balance":"$3,182.24","isActive":true,"guid":"52489849-78e1-4b27-8b86-e3e5ab2b7dc8","index":3,"_id":"551b9119a13061c083c878d5"},{"favoriteFruit":"banana","greeting":"Hello, Rodgers! You have 6 unread messages.","friends":[{"name":"Marguerite Conway","id":0},{"name":"Margarita Cunningham","id":1},{"name":"Carmela Gallagher","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["ipsum","magna","amet","elit","sit","occaecat","elit"],"longitude":-125.436981,"latitude":19.868524,"registered":"Tuesday, July 8, 2014 8:09 PM","about":"In cillum esse tempor do magna id ad excepteur ex nostrud mollit deserunt aliqua. Minim aliqua commodo commodo consectetur exercitation nulla nisi dolore aliqua in. Incididunt deserunt mollit nostrud excepteur. Ipsum fugiat anim deserunt Lorem aliquip nisi consequat eu minim in ex duis.\r\n","address":"989 Varanda Place, Duryea, Palau, 3972","phone":"+1 (968) 578-2974","email":"rodgers.conner@frenex.net","company":"FRENEX","name":{"last":"Conner","first":"Rodgers"},"eyeColor":"blue","age":23,"picture":"http://placehold.it/32x32","balance":"$1,665.17","isActive":true,"guid":"ed3b2374-5afe-4fca-9325-8a7bbc9f81a0","index":4,"_id":"551b91197bcedb1b56a241ce"},{"favoriteFruit":"strawberry","greeting":"Hello, Mari! You have 10 unread messages.","friends":[{"name":"Irwin Boyd","id":0},{"name":"Dejesus Flores","id":1},{"name":"Lane Mcmahon","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["esse","aliquip","excepteur","dolor","ex","commodo","anim"],"longitude":-17.038176,"latitude":17.154663,"registered":"Sunday, April 6, 2014 4:46 AM","about":"Excepteur veniam occaecat sint nulla magna in in officia elit. Eiusmod qui dolor fugiat tempor in minim esse officia minim consequat. Lorem ullamco labore proident ipsum id pariatur fugiat consectetur anim cupidatat qui proident non ipsum.\r\n","address":"563 Hendrickson Street, Westwood, South Dakota, 4959","phone":"+1 (980) 434-3976","email":"mari.fleming@beadzza.org","company":"BEADZZA","name":{"last":"Fleming","first":"Mari"},"eyeColor":"blue","age":21,"picture":"http://placehold.it/32x32","balance":"$1,948.04","isActive":true,"guid":"6bd02166-3b1f-4ed8-84c9-ed96cbf12abc","index":5,"_id":"551b9119b359ff6d24846f77"},{"favoriteFruit":"strawberry","greeting":"Hello, Maxine! You have 7 unread messages.","friends":[{"name":"Sullivan Stark","id":0},{"name":"Underwood Mclaughlin","id":1},{"name":"Kristy Carlson","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["commodo","ipsum","quis","non","est","mollit","exercitation"],"longitude":-105.40635,"latitude":37.197993,"registered":"Tuesday, January 20, 2015 12:30 AM","about":"Proident ullamco Lorem est consequat consectetur non eiusmod esse nostrud pariatur eiusmod enim exercitation eiusmod. Consequat duis elit elit minim ullamco et dolor eu minim do tempor esse consequat excepteur. Mollit dolor do voluptate nostrud quis anim cillum velit tempor eiusmod adipisicing tempor do culpa. Eu magna dolor sit amet nisi do laborum dolore nisi. Deserunt ipsum et deserunt non nisi.\r\n","address":"252 Boulevard Court, Brenton, Tennessee, 9444","phone":"+1 (950) 466-3377","email":"maxine.moreno@zentia.tv","company":"ZENTIA","name":{"last":"Moreno","first":"Maxine"},"eyeColor":"brown","age":24,"picture":"http://placehold.it/32x32","balance":"$1,200.24","isActive":false,"guid":"ce307a37-ca1f-43f5-b637-dca2605712be","index":6,"_id":"551b91195a6164b2e35f6dc8"},{"favoriteFruit":"strawberry","greeting":"Hello, Helga! You have 5 unread messages.","friends":[{"name":"Alicia Vance","id":0},{"name":"Vinson Phelps","id":1},{"name":"Francisca Kelley","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["nostrud","eiusmod","dolore","officia","sint","non","qui"],"longitude":-7.275151,"latitude":75.54202,"registered":"Wednesday, October 1, 2014 6:35 PM","about":"Quis duis ullamco velit qui. Consectetur non adipisicing id magna anim. Deserunt est officia qui esse. Et do pariatur incididunt anim ad mollit non. Et eiusmod sunt fugiat elit mollit ad excepteur anim nisi laboris eiusmod aliquip aliquip.\r\n","address":"981 Bush Street, Beaulieu, Vermont, 3775","phone":"+1 (956) 506-3807","email":"helga.burch@synkgen.name","company":"SYNKGEN","name":{"last":"Burch","first":"Helga"},"eyeColor":"blue","age":22,"picture":"http://placehold.it/32x32","balance":"$3,827.89","isActive":false,"guid":"ff5dfea0-1052-4ef2-8b66-4dc1aad0a4fb","index":7,"_id":"551b911946be8358ae40e90e"},{"favoriteFruit":"banana","greeting":"Hello, Shaw! You have 5 unread messages.","friends":[{"name":"Christian Cardenas","id":0},{"name":"Cohen Pennington","id":1},{"name":"Mary Lindsay","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["occaecat","ut","occaecat","magna","exercitation","incididunt","irure"],"longitude":-89.102972,"latitude":89.489596,"registered":"Thursday, August 21, 2014 5:00 PM","about":"Amet cupidatat quis velit aute Lorem consequat pariatur mollit deserunt et sint culpa excepteur duis. Enim proident duis qui ex tempor sunt nostrud occaecat. Officia sit veniam mollit eiusmod minim do aute eiusmod fugiat qui anim adipisicing in laboris. Do tempor reprehenderit sunt laborum esse irure dolor ad consectetur aute sit id ipsum. Commodo et voluptate anim consequat do. Minim laborum ad veniam ad minim incididunt excepteur excepteur aliqua.\r\n","address":"237 Pierrepont Street, Herbster, New York, 3490","phone":"+1 (976) 455-2880","email":"shaw.zamora@shadease.me","company":"SHADEASE","name":{"last":"Zamora","first":"Shaw"},"eyeColor":"blue","age":38,"picture":"http://placehold.it/32x32","balance":"$3,440.82","isActive":false,"guid":"ac5fdb0e-e1fb-427e-881d-da461be0d1ca","index":8,"_id":"551b9119af0077bc28a2de25"},{"favoriteFruit":"apple","greeting":"Hello, Melissa! You have 5 unread messages.","friends":[{"name":"Marion Villarreal","id":0},{"name":"Kate Rose","id":1},{"name":"Hines Simon","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["amet","veniam","mollit","ad","cupidatat","deserunt","Lorem"],"longitude":-52.735052,"latitude":16.258838,"registered":"Wednesday, April 16, 2014 7:56 PM","about":"Aute ut culpa eiusmod tempor duis dolor tempor incididunt. Nisi non proident excepteur eiusmod incididunt nisi minim irure sit. In veniam commodo deserunt proident reprehenderit et consectetur ullamco quis nulla cupidatat.\r\n","address":"642 Halsey Street, Blandburg, Kansas, 6761","phone":"+1 (941) 539-3851","email":"melissa.vaughn@memora.io","company":"MEMORA","name":{"last":"Vaughn","first":"Melissa"},"eyeColor":"brown","age":24,"picture":"http://placehold.it/32x32","balance":"$2,399.44","isActive":true,"guid":"1769f022-a7f1-4a69-bf4c-f5a5ebeab2d1","index":9,"_id":"551b9119b607c09c7ffc3b8a"}]'

local mixed_small = '{"favoriteFruit":"banana","greeting":"Hello, Kim! You have 10 unread messages.","friends":[{"name":"Higgins Rodriquez","id":0},{"name":"James Floyd","id":1},{"name":"Gay Stewart","id":2}],"range":[0,1,2,3,4,5,6,7,8,9],"tags":["pariatur","ad","eiusmod","sit","et","velit","culpa"],"longitude":-57.919246,"latitude":-36.022812,"registered":"Friday, March 21, 2014 9:13 PM","about":"Laborum nulla aliquip ullamco proident excepteur est officia ipsum. Eiusmod exercitation minim ex do labore reprehenderit aliqua minim qui excepteur reprehenderit cupidatat. Sint enim exercitation duis id consequat nisi enim magna. Commodo aliqua id ipsum sit magna enim. Veniam officia in labore fugiat veniam ea laboris ex veniam duis.\r\n","address":"323 Pulaski Street, Ronco, North Carolina, 7701","phone":"+1 (919) 438-2678","email":"kim.griffith@cipromox.biz","company":"CIPROMOX","name":{"last":"Griffith","first":"Kim"},"eyeColor":"green","age":26,"picture":"http://placehold.it/32x32","balance":"$1,283.55","isActive":false,"guid":"10ab0392-c5e2-48a3-9473-aa725bad892d","index":0,"_id":"551b91198238a0bcf9a41133"}'

local bool_test = '[true,true,false,false,true,true,true,false,false,true,false,false,true,false,false,false,true,false,false,true,true,false,true,true,true,false,false,false,true,false,true,false,false,true,true,true,true,true,true,false,false,true,false,false,false,true,true,false,true,true,false,true,false,true,true,true,false,false,false,true,false,false,false,true,true,false,true,true,true,true,true,true,true,true,false,false,false,false,false,true,true,true,true,true,true,true,false,false,false,true,false,false,false,true,true,true,false,false,true,false]'

local float_test = '[135.7471116e36,123.377054E-008,140.527504552,-72.299143906,-23.851678949,73.586193519,-158.299382442,177.477876032,32.268518982,-139.560009969,115.203105183,-106.025823607,167.224138231,103.378383732,-97.498486285,18.184723416,69.137075711,33.849002681,-120.185228215,-20.841408615,-172.659492727,-2.691464061,22.426164066,-98.416909437,-31.603082708,-85.072296561,108.620987395,-43.127078238,-126.473562057,-158.595489097,-57.890678254,-13.254016573,-85.024504709,171.663552644,-146.495558248,-10.606748276,-118.786969354,153.352057804,-45.215545083,37.038725288,106.344071897,-64.607402031,85.148030911,28.897784566,39.51082061,20.450382102,-113.174943618,71.60785784,-168.202648062,-157.338200017,10.879588527,-114.261694831,-5.622927072,-173.330830616,-29.47002003,-39.829034201,50.031545162,82.815735508,-119.188760828,-48.455928081,163.964263034,46.30378861,-26.248889762,-47.354615322,155.388677633,-166.710356904,42.987233558,144.275297374,37.394383186,-122.550388725,177.469945914,101.104677413,109.429869885,-104.919625624,147.522756541,-81.294703727,122.744731363,81.803603684,26.321556167,147.045441354,147.256895816,-174.211095908,52.518769316,-78.58250334,-173.356685435,-107.728209264,-69.982325771,-113.776095893,-35.785267074,-105.748545976,-30.206523864,-76.185311723,-126.400112781,-26.864958639,56.840053629,93.781553535,-116.002949803,-46.617140948,176.846840093,-144.24821335]'

local int_test = '[8125686,-8958709,5976222,1889524,7968493,1357486,118415,7081097,4635968,7555332,2270233,3428352,8699968,2087333,7861337,7554440,2017031,7981692,6060687,1877715,3297474,8373177,6158629,7853641,3004441,9650406,2695251,1180761,4988426,6043805,8063373,6103218,2848339,8188690,9235573,5949816,6116081,6471138,3354531,4787414,9660600,942529,7278535,7967399,554292,1436493,267319,2606657,7900601,4276634,7996757,8544466,7266469,3301373,4005350,6437652,7717672,7126292,8588394,2127902,7410190,1517806,4583602,3123440,7747613,5029464,9834390,3087227,4913822,7550487,4518144,5862588,1778599,9493290,5588455,3638706,7394293,4294719,3837830,6381878,7175866,8575492,1415229,1453733,6972404,9782571,4234063,7117418,7293130,8057071,9345285,7626648,3358911,4574537,9371826,7627107,6154093,5392367,5398105,6956377]'

local para_test = '["Commodo ullamco cupidatat nisi sit proident ex. Cillum pariatur occaecat in officia do commodo nisi cillum tempor minim. Ad dolor ut et aliquip fugiat eu officia cupidatat occaecat consectetur eiusmod veniam enim officia.","Adipisicing cillum laborum nisi irure. Cillum dolor proident duis nulla qui mollit dolore reprehenderit mollit. Irure nulla dolor ipsum irure nulla quis laboris do.","Est adipisicing consectetur incididunt in. Occaecat ea magna ex consequat irure sit laborum cillum officia magna sunt do exercitation aliquip. Laboris id aute in dolore reprehenderit voluptate non deserunt laborum.","Consectetur eu aute est est occaecat adipisicing sint enim dolor eu. Tempor amet id non mollit eu consectetur cillum duis. Eu labore velit nulla ipsum commodo consequat aliquip. Cupidatat commodo dolore mollit enim sit excepteur nisi duis laboris deserunt esse.","Incididunt ullamco est fugiat enim fugiat. Do sit mollit anim ad excepteur eu laboris exercitation officia labore nulla ut. Voluptate non voluptate cillum sit et voluptate anim duis velit consequat aliquip dolor. Elit et et esse laboris consectetur officia eiusmod aliquip nisi est. Qui labore dolore ad dolor.","Anim adipisicing est irure proident sit officia ullamco voluptate sunt consectetur duis mollit excepteur veniam. Nostrud ut duis aute exercitation officia et quis elit commodo elit tempor aute aliquip enim. Est officia non cillum consequat voluptate ipsum sit voluptate nulla id.","Ipsum enim consectetur aliquip nulla commodo ut ex aliqua elit duis do. Officia et sunt aliqua dolor minim voluptate veniam esse elit enim. Adipisicing reprehenderit duis ex magna non in fugiat sunt ipsum nostrud fugiat aliquip. Labore voluptate id officia voluptate eu. Magna do nostrud excepteur sunt aliqua adipisicing qui.","Est occaecat non non cupidatat laborum qui. Veniam sit est voluptate labore sit irure consectetur fugiat. Anim enim enim fugiat exercitation anim ad proident esse in aliqua. Laboris ut aute culpa ullamco.","Sit et aliquip cupidatat deserunt eiusmod sint aliquip occaecat nostrud aliqua elit commodo ut magna. Amet sit est deserunt id duis in officia pariatur cupidatat ex. Mollit duis est consequat nulla aute velit ipsum sit consectetur pariatur ut non ex ipsum. Tempor esse velit pariatur reprehenderit et nostrud commodo laborum mollit labore.","Aliquip irure quis esse aliquip. Ex non deserunt culpa aliqua ad anim occaecat ad. Lorem consectetur mollit eu consectetur est non nisi non ipsum. Qui veniam ullamco officia est ut excepteur. Nulla elit dolore cupidatat aliqua enim Lorem elit consequat eiusmod non aliqua eu in. Pariatur in culpa labore sint ipsum consectetur occaecat ad ex ipsum laboris aliquip officia. Non officia eiusmod nisi officia id id laboris deserunt sunt enim magna mollit sit.","Mollit velit laboris laborum nulla aliquip consequat Lorem non incididunt irure. Eu voluptate sint do consectetur tempor sit Lorem in. Laborum eiusmod nisi Lorem ipsum dolore do aute laborum occaecat aute sunt. Sit laborum in ea do ipsum officia irure cillum irure nisi laboris. Ad anim deserunt excepteur ea veniam eiusmod culpa velit veniam. Commodo incididunt ea Lorem eu enim esse nisi incididunt mollit.","Velit proident sunt aute dolore reprehenderit culpa. Pariatur reprehenderit commodo ad ea voluptate anim nulla ipsum eu irure fugiat aliqua et. Adipisicing incididunt anim excepteur voluptate minim qui culpa. Sunt veniam enim reprehenderit magna magna. Sit ad amet deserunt ut aute dolore ad minim.","Esse ullamco sunt mollit mollit. Eu enim dolore laboris cupidatat. Cupidatat adipisicing non aute exercitation fugiat. Non ut cillum labore fugiat aliquip ex duis quis consectetur ut nisi Lorem amet qui. Proident veniam amet qui reprehenderit duis qui. Nisi culpa sit occaecat ullamco occaecat laborum fugiat ut. Non duis deserunt culpa duis.","Id ipsum eiusmod laboris non est ipsum deserunt labore duis reprehenderit deserunt. Sint tempor fugiat eiusmod nostrud in ut laborum esse in nostrud sit deserunt nostrud reprehenderit. Cupidatat aliqua qui anim consequat eu quis consequat consequat elit ipsum pariatur. Cupidatat in dolore velit quis. Exercitation cillum ullamco ex consectetur commodo tempor incididunt exercitation labore ad dolore. Minim incididunt consequat adipisicing esse eu eu voluptate.","Anim sint eiusmod nisi anim do deserunt voluptate ut cillum eiusmod esse ex reprehenderit laborum. Dolore nulla excepteur duis excepteur. Magna nisi nostrud duis non commodo velit esse ipsum Lorem incididunt. Nulla enim consequat ad aliqua. Incididunt irure culpa nostrud ea aute ex sit non ad esse.","Ullamco nostrud cupidatat adipisicing anim fugiat mollit eu. Et ut eu in nulla consequat. Sunt do pariatur culpa non est.","Pariatur incididunt reprehenderit non qui excepteur cillum exercitation nisi occaecat ad. Lorem aliquip laborum commodo reprehenderit sint. Laboris qui ut veniam magna quis et et ullamco voluptate. Tempor reprehenderit deserunt consequat nisi. Esse duis sint in tempor. Amet aute cupidatat in sint et.","Est officia nisi dolore consequat irure et excepteur. Sit qui elit tempor magna qui cillum anim amet proident exercitation proident. Eu cupidatat laborum consectetur duis ullamco irure nulla. Adipisicing culpa non reprehenderit anim aute.","Eu est laborum culpa velit dolore non sunt. Tempor magna veniam ea sit non qui Lorem qui exercitation aliqua aliqua et excepteur eiusmod. Culpa aute anim proident culpa adipisicing duis tempor elit aliquip elit nulla laboris esse dolore. Sit adipisicing non dolor eiusmod occaecat cupidatat.","Culpa velit eu esse sunt. Laborum irure aliqua reprehenderit velit ipsum fugiat officia dolor ut aute officia deserunt. Ipsum sit quis fugiat nostrud aliqua cupidatat ex pariatur et. Cillum proident est irure nisi dolor aliqua deserunt esse occaecat velit dolor.","Exercitation nulla officia sit eiusmod cillum eu incididunt officia exercitation qui Lorem deserunt. Voluptate Lorem minim commodo laborum esse in duis excepteur do duis aliquip nisi voluptate consectetur. Amet tempor officia enim ex esse minim reprehenderit.","Laboris sint deserunt ad aute incididunt. Anim officia sunt elit qui laborum labore commodo irure non. Mollit adipisicing ullamco do aute nulla eu laborum et quis sint aute adipisicing amet. Aliqua officia irure nostrud duis ex.","Eiusmod ipsum aliqua reprehenderit esse est non aute id veniam eiusmod. Elit consequat ad sit tempor elit eu incididunt quis irure ad. Eu incididunt veniam consequat Lorem nostrud cillum officia ea consequat ad cillum. Non nisi irure cupidatat incididunt pariatur incididunt. Duis velit officia ad cillum qui. Aliquip consequat sint aute nisi cillum. Officia commodo nisi incididunt laborum nisi voluptate aliquip Lorem cupidatat anim consequat sit laboris.","Veniam cupidatat et incididunt mollit do ex voluptate veniam nostrud labore esse. Eiusmod irure sint fugiat esse. Aute irure consectetur ut mollit nulla sint esse. Lorem ut quis ex proident nostrud mollit nostrud ea duis duis in magna anim consectetur.","Irure culpa esse qui do dolor fugiat veniam ad. Elit commodo aute elit magna incididunt tempor pariatur velit irure pariatur cillum et ea ad. Ad consequat ea et ad minim ut sunt qui commodo voluptate. Laboris est aliquip anim reprehenderit eu officia et exercitation. Occaecat laboris cupidatat Lorem ullamco in nostrud commodo ipsum in quis esse ex.","Incididunt officia quis voluptate eiusmod esse nisi ipsum quis commodo. Eiusmod dolore tempor occaecat sit exercitation aliqua minim consequat minim mollit qui ad nisi. Aute quis irure adipisicing veniam nisi nisi velit deserunt incididunt anim nostrud.","Voluptate exercitation exercitation id minim excepteur excepteur mollit. Fugiat aute proident nulla ullamco ea. Nisi ea culpa duis dolore veniam anim tempor officia in dolore exercitation exercitation. Dolore quis cillum adipisicing sunt do nulla esse proident ad sint.","Laborum ut mollit sint commodo nulla laborum deserunt Lorem magna commodo mollit tempor deserunt ut. Qui aliquip commodo ea id. Consectetur dolor fugiat dolor excepteur eiusmod. Eu excepteur ex aute ex ex elit ex esse officia cillum exercitation. Duis ut labore ea nostrud excepteur. Reprehenderit labore aute sunt nisi quis Lorem officia. Ad aliquip cupidatat voluptate exercitation voluptate ad irure magna quis.","Tempor velit veniam sit labore elit minim do elit cillum eiusmod sunt excepteur nisi. Aliquip est deserunt excepteur duis fugiat incididunt veniam fugiat. Pariatur sit irure labore et minim non. Cillum quis aute anim sint laboris laboris ullamco exercitation nostrud. Nulla pariatur id laborum minim nisi est adipisicing irure.","Irure exercitation laboris nostrud in do consectetur ad. Magna aliqua Lorem culpa exercitation sint do culpa incididunt mollit eu exercitation. Elit tempor Lorem dolore enim deserunt. Anim et ullamco sint ullamco mollit cillum officia et. Proident incididunt laboris aliquip laborum sint veniam deserunt eu consequat deserunt voluptate laboris. Anim Lorem non laborum exercitation voluptate. Cupidatat reprehenderit culpa Lorem fugiat enim minim consectetur tempor quis ad reprehenderit laboris irure.","Deserunt elit mollit nostrud occaecat labore reprehenderit laboris ex. Esse reprehenderit adipisicing cillum minim in esse aliquip excepteur ex et nisi cillum quis. Cillum labore ut ex sunt. Occaecat proident et mollit magna consequat irure esse. Dolor do enim esse nisi ad.","Pariatur est anim cillum minim elit magna adipisicing quis tempor proident nisi laboris incididunt cupidatat. Nulla est adipisicing sit adipisicing id nostrud amet qui consequat eiusmod tempor voluptate ad. Adipisicing non magna sit occaecat magna mollit ad ex nulla velit ea pariatur. Irure labore ad ea exercitation ex cillum.","Lorem fugiat eu eu cillum nulla tempor sint. Lorem id officia nulla velit labore ut duis ad tempor non. Excepteur quis aute adipisicing nisi nisi consectetur aliquip enim Lorem id ullamco cillum sint voluptate. Qui aliquip incididunt tempor aliqua voluptate labore reprehenderit. Veniam eiusmod elit occaecat voluptate tempor culpa consectetur ea ut exercitation eiusmod exercitation qui.","Aliqua esse pariatur nulla veniam velit ea. Aliquip consectetur tempor ex magna sit aliquip exercitation veniam. Dolor ullamco minim commodo pariatur. Et amet reprehenderit dolore proident elit tempor eiusmod eu incididunt enim ullamco. Adipisicing id officia incididunt esse dolor sunt cupidatat do deserunt mollit do non. Magna ut officia fugiat adipisicing quis ea cillum laborum dolore ad nostrud magna minim est. Dolor voluptate officia proident enim ea deserunt eu voluptate dolore proident laborum officia ea.","Culpa aute consequat esse fugiat cupidatat minim voluptate voluptate eiusmod irure anim elit. Do eiusmod culpa laboris consequat incididunt minim nostrud eiusmod commodo velit ea ullamco proident. Culpa pariatur magna ut mollit nisi. Ea officia do magna deserunt minim nisi tempor ea deserunt veniam cillum exercitation esse.","Anim ullamco nostrud commodo Lorem. Do sunt laborum exercitation proident proident magna. Lorem officia laborum laborum dolor sunt duis commodo Lorem. Officia aute adipisicing ea cupidatat ea dolore. Aliquip adipisicing pariatur consectetur aliqua sit amet officia reprehenderit laborum culpa. Occaecat Lorem eu nisi do Lorem occaecat enim eiusmod laboris id quis. Ad mollit adipisicing sunt adipisicing esse.","Laborum quis sit adipisicing cupidatat. Veniam Lorem eiusmod esse esse sint nisi labore elit et. Deserunt aliqua mollit ut commodo aliqua non incididunt ipsum reprehenderit consectetur. Eiusmod nulla minim laboris Lorem ea Lorem aute tempor pariatur in sit. Incididunt culpa ut do irure amet irure cupidatat est anim anim culpa occaecat. Est velit consectetur eiusmod veniam reprehenderit officia sunt occaecat eiusmod ut sunt occaecat amet.","Elit minim aute fugiat nulla ex quis. Labore fugiat sint nostrud amet quis culpa excepteur in. Consectetur exercitation cupidatat laborum sit. Aute nisi eu aliqua est deserunt eiusmod commodo dolor id. Mollit laborum esse sint ipsum voluptate reprehenderit velit et. Veniam aliquip enim in veniam Lorem voluptate quis deserunt consequat qui commodo ut excepteur aute.","Dolore deserunt veniam aute nisi labore sunt et voluptate irure nisi anim ea. Magna nisi quis anim mollit nisi est dolor do ex aliquip elit aliquip ipsum minim. Dolore est officia nostrud eiusmod ex laborum ea amet est. Officia culpa non est et tempor consectetur exercitation tempor eiusmod enim. Ea tempor laboris qui amet ex nisi culpa dolore consectetur incididunt sunt sunt. Lorem aliquip incididunt magna do et ullamco ex elit aliqua eiusmod qui. Commodo amet dolor sint incididunt ex veniam non Lorem fugiat.","Officia culpa enim voluptate dolore commodo. Minim commodo aliqua minim ex sint excepteur cupidatat adipisicing eu irure. Anim magna deserunt anim Lorem non.","Cupidatat aliquip nulla excepteur sunt cupidatat cupidatat laborum cupidatat exercitation. Laboris minim ex cupidatat culpa elit. Amet enim reprehenderit aliqua laborum est tempor exercitation cupidatat ex dolore do. Do incididunt labore fugiat commodo consectetur nisi incididunt irure sit culpa sit. Elit aute occaecat qui excepteur velit proident cillum qui aliqua ex do ex. Dolore irure ex excepteur veniam id proident mollit Lorem.","Ad commodo cillum duis deserunt elit officia consectetur veniam eiusmod. Reprehenderit et veniam ad commodo reprehenderit magna elit laboris sunt non quis. Adipisicing dolor aute proident ea magna sunt et proident in consectetur.","Veniam exercitation esse esse veniam est nisi. Minim velit incididunt sint aute dolor anim. Fugiat cupidatat id ad nisi in voluptate dolor culpa eiusmod magna eiusmod amet id. Duis aliquip labore et ex amet amet aliquip laborum eiusmod ipsum. Quis qui ut duis duis. Minim in voluptate reprehenderit aliqua.","Elit ut pariatur dolor veniam ipsum consequat. Voluptate Lorem mollit et esse dolore mollit Lorem ad. Elit nostrud eu Lorem labore mollit minim cupidatat officia quis minim dolore incididunt. In cillum aute cillum ut.","Commodo laborum deserunt ut cupidatat pariatur ullamco in esse anim exercitation cillum duis. Consectetur incididunt sit esse Lorem in aute. Eiusmod mollit Lorem consequat minim reprehenderit laborum enim excepteur irure nisi elit. Laborum esse proident aute aute proident adipisicing laborum. Pariatur tempor duis incididunt qui velit pariatur ut officia ea mollit labore dolore. Cillum pariatur minim ullamco sunt incididunt culpa id ullamco exercitation consectetur. Ea exercitation consequat reprehenderit ut ullamco velit eu ad velit magna excepteur eiusmod.","Eu deserunt magna laboris laborum laborum in consequat dolore. Officia proident consectetur proident do occaecat minim pariatur officia ipsum sit non velit officia cillum. Laborum excepteur labore eu minim eiusmod. Sit anim dolore cillum ad do minim culpa sit est ad.","Cupidatat dolor nostrud Lorem sint consequat quis. Quis labore sint incididunt officia tempor. Fugiat nostrud in elit reprehenderit dolor. Nisi sit enim officia minim est adipisicing nulla aute labore nulla nostrud cupidatat est. Deserunt dolore qui irure Lorem esse voluptate velit qui nostrud.","Fugiat Lorem amet nulla nisi qui amet laboris enim cillum. Dolore occaecat exercitation id labore velit do commodo ut cupidatat laborum velit fugiat mollit. Ut et aliqua pariatur occaecat. Lorem occaecat dolore quis esse enim cupidatat exercitation ut tempor sit laboris fugiat adipisicing. Est tempor ex irure consectetur ipsum magna labore. Lorem non quis qui minim nisi magna amet aliquip ex cillum fugiat tempor.","Aliquip eiusmod laborum ipsum deserunt velit esse do magna excepteur consectetur exercitation sit. Minim ullamco reprehenderit commodo nostrud exercitation id irure ex qui ullamco sit esse laboris. Nulla cillum non minim qui cillum nisi aute proident. Dolor anim culpa elit quis excepteur aliqua eiusmod. Elit ea est excepteur consectetur sunt eiusmod enim id commodo irure amet et pariatur laboris. Voluptate magna ad magna dolore cillum cillum irure laboris ipsum officia id Lorem veniam.","Esse sunt elit est aliquip cupidatat commodo deserunt. Deserunt pariatur ipsum qui ad esse esse magna qui cillum laborum. Exercitation veniam pariatur elit amet enim.","Esse quis in id elit nulla occaecat incididunt. Et amet Lorem mollit in veniam do. Velit mollit Lorem consequat commodo Lorem aliquip cupidatat. Minim consequat nostrud nulla in nostrud.","Cillum nulla et eu est nostrud quis elit cupidatat dolor enim excepteur exercitation nisi voluptate. Nulla dolore non ex velit et qui tempor proident id deserunt nisi eu. Tempor ad Lorem ipsum reprehenderit in anim. Anim dolore ullamco enim deserunt quis ex id exercitation velit. Magna exercitation fugiat mollit pariatur ipsum ex consectetur nostrud. Id dolore officia nostrud excepteur laborum. Magna incididunt elit ipsum pariatur adipisicing enim duis est qui commodo velit aute.","Quis esse ex qui nisi dolor. Ullamco laborum dolor esse laboris eiusmod ea magna laboris ea esse ut. Dolore ipsum pariatur veniam sint mollit. Lorem ea proident fugiat ullamco ut nisi culpa eu exercitation exercitation aliquip veniam laborum consectetur.","Pariatur veniam laboris sit aliquip pariatur tempor aute sunt id et ut. Laboris excepteur eiusmod nisi qui quis elit enim ut cupidatat. Et et laborum in fugiat veniam consectetur ipsum laboris duis excepteur ullamco aliqua dolor Lorem. Aliqua ex amet sint anim cupidatat nisi ipsum anim et sunt deserunt. Occaecat culpa ut tempor cillum pariatur ex tempor.","Dolor deserunt eiusmod magna do officia voluptate excepteur est cupidatat. Veniam qui cupidatat amet anim est qui consectetur sit commodo commodo ea ad. Enim ad adipisicing qui nostrud. Non nulla esse ullamco nulla et ex.","Id ullamco ea consectetur est incididunt deserunt et esse. Elit nostrud voluptate eiusmod ut. Excepteur adipisicing qui cupidatat consequat labore id. Qui dolor aliqua do dolore do cupidatat labore ex consectetur ea sit cillum. Sint veniam eiusmod in consectetur consequat fugiat et mollit ut fugiat esse dolor adipisicing.","Ea magna proident labore duis pariatur. Esse cillum aliquip dolor duis fugiat ea ex officia ea irure. Sint elit nisi pariatur sunt nostrud exercitation ullamco culpa magna do.","Minim aliqua voluptate dolor consequat sint tempor deserunt amet magna excepteur. Irure do voluptate magna velit. Nostrud in reprehenderit magna officia nostrud. Cupidatat nulla irure laboris non fugiat ex ex est cupidatat excepteur officia aute velit duis. Sit voluptate id ea exercitation deserunt culpa voluptate nostrud est adipisicing incididunt. Amet proident laborum commodo magna ipsum quis.","Ipsum consectetur consectetur excepteur tempor eiusmod ea fugiat aute velit magna in officia sunt. Sit ut sunt dolore cupidatat dolor adipisicing. Veniam nisi adipisicing esse reprehenderit amet aliqua voluptate ex commodo occaecat est voluptate mollit sunt. Pariatur aliqua qui qui in dolor. Fugiat reprehenderit sit nostrud do sint esse. Tempor sit irure adipisicing ea pariatur duis est sit est incididunt laboris quis do. Et voluptate anim minim aliquip excepteur consequat nisi anim pariatur aliquip ut ipsum dolor magna.","Cillum sit labore excepteur magna id aliqua exercitation consequat laborum Lorem id pariatur nostrud. Lorem qui est labore sint cupidatat sint excepteur nulla in eu aliqua et. Adipisicing velit do enim occaecat laboris quis excepteur ipsum dolor occaecat Lorem dolore id exercitation.","Incididunt in laborum reprehenderit eiusmod irure ex. Elit duis consequat minim magna. Esse consectetur aliquip cillum excepteur excepteur fugiat. Sint tempor consequat minim reprehenderit consectetur adipisicing dolor id Lorem elit non. Occaecat esse quis mollit ea et sint aute fugiat qui tempor. Adipisicing tempor duis non dolore irure elit deserunt qui do.","Labore fugiat eiusmod sint laborum sit duis occaecat. Magna in laborum non cillum excepteur nostrud sit proident pariatur voluptate voluptate adipisicing exercitation occaecat. Ad non dolor aute ex sint do do minim exercitation veniam laborum irure magna ea. Magna do non quis sit consequat Lorem aliquip.","Velit anim do laborum laboris laborum Lorem. Sunt do Lorem amet ipsum est sint velit sit do voluptate mollit veniam enim. Commodo do deserunt in pariatur ut elit sint elit deserunt ea. Ad dolor anim consequat aliquip ut mollit nostrud tempor sunt mollit elit. Reprehenderit laboris labore excepteur occaecat veniam adipisicing cupidatat esse. Ad enim aliquip ea minim excepteur magna. Sint velit veniam pariatur qui dolor est adipisicing ex laboris.","Ea cupidatat ex nulla in sunt est sit dolor enim ad. Eu tempor consequat cupidatat consequat ex incididunt sint culpa. Est Lorem Lorem non cupidatat sunt ut aliqua non nostrud do ullamco. Reprehenderit ad ad nulla nostrud do nulla in. Ipsum adipisicing commodo mollit ipsum exercitation. Aliqua ea anim anim est elit. Ea incididunt consequat minim ad sunt eu cillum.","Tempor quis excepteur eiusmod cupidatat ipsum occaecat id et occaecat. Eiusmod magna aliquip excepteur id amet elit. Ullamco dolore amet anim dolor enim ea magna magna elit. Occaecat magna pariatur in deserunt consectetur officia aliquip ullamco ex aute anim. Minim laborum eu sit elit officia esse do irure pariatur tempor et reprehenderit ullamco labore.","Sit tempor eu minim dolore velit pariatur magna duis reprehenderit ea nulla in. Amet est do consectetur commodo do adipisicing adipisicing in amet. Cillum id ut commodo do pariatur duis aliqua nisi sint ad irure officia reprehenderit. Mollit labore id enim fugiat ullamco irure mollit cupidatat. Quis nisi amet labore eu dolor occaecat commodo aliqua laboris deserunt excepteur deserunt officia. Aliqua non ut sit ad. Laborum veniam ad velit minim dolore ea id magna dolor qui in.","Dolore nostrud ipsum aliqua pariatur id reprehenderit enim ad eiusmod qui. Deserunt anim commodo pariatur excepteur velit eu irure nulla ex labore ipsum aliqua minim aute. Id consequat amet tempor aliquip ex elit adipisicing est do. Eu enim Lorem consectetur minim id irure nulla culpa. Consectetur do consequat aute tempor anim. Qui ad non elit dolor est adipisicing nisi amet cillum sunt quis anim laboris incididunt. Incididunt proident adipisicing labore Lorem.","Et reprehenderit ea officia veniam. Aliquip ullamco consequat elit nisi magna mollit id elit. Amet amet sint velit labore ad nisi. Consectetur tempor id dolor aliqua esse deserunt amet. Qui laborum enim proident voluptate aute eu aute aute sit sit incididunt eu. Sunt ullamco nisi nostrud labore commodo non consectetur quis do duis minim irure. Tempor sint dolor sint aliquip dolore nostrud fugiat.","Aute ullamco quis nisi ut excepteur nostrud duis elit. Veniam ex ad incididunt veniam voluptate. Commodo dolore ullamco sit sint adipisicing proident amet aute duis deserunt.","","Deserunt consequat aliqua duis aliquip nostrud nostrud dolore nisi. Culpa do sint laborum consectetur ipsum quis laborum laborum pariatur eiusmod. Consectetur laboris ad ad ut quis. Ullamco laboris qui velit id laborum voluptate qui aute nostrud aliquip ea.","Ad cillum anim ex est consectetur mollit id in. Non enim aliquip consequat qui deserunt commodo cillum ad laborum fugiat. Dolor deserunt amet laborum tempor adipisicing voluptate dolor pariatur dolor cillum. Eu mollit ex sunt officia veniam qui est sunt proident. Non aliqua qui elit eu cupidatat ex enim ex proident. Lorem sit minim ullamco officia cupidatat duis minim. Exercitation laborum deserunt voluptate culpa tempor quis nulla id pariatur.","Nostrud quis consectetur ut aliqua excepteur elit consectetur occaecat. Occaecat voluptate Lorem pariatur consequat ullamco fugiat minim. Anim voluptate eu eu cillum tempor dolore aliquip aliqua. Fugiat incididunt ut tempor amet minim. Voluptate nostrud minim pariatur non excepteur ullamco.","Dolore nulla velit officia exercitation irure laboris incididunt anim in laborum in fugiat ut proident. Fugiat aute id consequat fugiat officia ut. Labore sint amet proident amet sint nisi laboris amet id ullamco culpa quis consequat proident. Magna do fugiat veniam dolore elit irure minim. Esse ullamco excepteur labore tempor labore fugiat dolore nisi cupidatat irure dolor pariatur. Magna excepteur laboris nisi eiusmod sit pariatur mollit.","In enim aliquip officia ea ad exercitation cillum culpa occaecat dolore Lorem. Irure cillum commodo adipisicing sunt pariatur ea duis fugiat exercitation laboris culpa ullamco aute. Ut voluptate exercitation qui dolor. Irure et duis elit consequat deserunt proident.","Officia ea Lorem sunt culpa id et tempor excepteur enim deserunt proident. Dolore aliquip dolor laboris cillum proident velit. Et culpa occaecat exercitation cupidatat irure sint adipisicing excepteur pariatur incididunt ad occaecat. Qui proident ipsum cillum minim. Quis ut culpa irure aliqua minim fugiat. In voluptate cupidatat fugiat est laborum dolor esse in pariatur voluptate.","Voluptate enim ipsum officia aute ea adipisicing nisi ut ex do aliquip amet. Reprehenderit enim voluptate tempor ex adipisicing culpa. Culpa occaecat voluptate dolor mollit ipsum exercitation labore et tempor sit ea consectetur aliqua. Elit elit sit minim ea ea commodo do tempor cupidatat irure dolore. Occaecat esse adipisicing anim eiusmod commodo fugiat mollit amet. Incididunt tempor tempor qui occaecat cupidatat in.","Ut qui anim velit enim aliquip do ut nulla labore. Mollit ut commodo ut eiusmod consectetur laboris aliqua qui voluptate culpa fugiat incididunt elit. Lorem ullamco esse elit elit. Labore amet incididunt ea nulla aliquip eiusmod. Sit nulla est voluptate officia ipsum aute aute cillum tempor deserunt. Laboris commodo eiusmod labore sunt aute excepteur ea consectetur reprehenderit veniam nisi. Culpa nisi sint sunt sint tempor laboris dolore cupidatat.","Duis cillum qui nisi duis amet velit ad cillum ut elit aute sint ad. Amet laboris pariatur excepteur ipsum Lorem aliqua veniam Lorem quis mollit cupidatat aliqua exercitation. Pariatur ex ullamco sit commodo cillum eiusmod ut proident elit cillum. Commodo ut ipsum excepteur occaecat sint elit consequat ex dolor adipisicing consectetur id ut ad. Velit sit eiusmod est esse tempor incididunt consectetur eiusmod duis commodo veniam.","Ut sunt qui officia anim laboris exercitation Lorem quis laborum do eiusmod officia. Enim consectetur occaecat fugiat cillum cillum. Dolore dolore nostrud in commodo fugiat mollit consequat occaecat non et et elit ullamco. Sit voluptate minim ut est culpa velit nulla fugiat reprehenderit eu aliquip adipisicing labore. Sit minim minim do dolor dolor. Lorem Lorem labore exercitation magna veniam eiusmod do.","Fugiat dolor adipisicing quis aliquip aute dolore. Qui proident anim elit veniam ex aliquip eiusmod ipsum sunt pariatur est. Non fugiat duis do est officia adipisicing.","Nulla deserunt do laboris cupidatat veniam do consectetur ipsum elit veniam in mollit eu. Ea in consequat cupidatat laboris sint fugiat irure. In commodo esse reprehenderit deserunt minim velit ullamco enim eu cupidatat tempor ex. Ullamco in non id culpa amet occaecat culpa nostrud id. Non occaecat culpa magna incididunt.","Enim laboris ex mollit reprehenderit eiusmod exercitation magna. Exercitation Lorem ex mollit non non culpa labore enim. Adipisicing labore dolore incididunt do amet aliquip excepteur ad et nostrud officia aute veniam voluptate. Fugiat enim eiusmod Lorem esse. Minim ullamco commodo consequat ex commodo aliqua eu nulla eu. Veniam non enim nulla ut Lorem nostrud minim sint duis.","Enim duis consectetur in ullamco cillum veniam nulla amet. Exercitation nisi sunt sunt duis in culpa nisi magna ex id ipsum laboris reprehenderit qui. Officia pariatur qui ex fugiat veniam et sunt sit nostrud. Veniam ullamco tempor fugiat minim Lorem proident velit in eiusmod elit. Enim minim excepteur aute aliquip ex magna commodo dolore qui et labore. Proident eu aliquip cillum dolor. Nostrud ipsum ut irure consequat fugiat nulla proident occaecat laborum.","ut cupidatat elit nostrud.","Laboris laboris sit mollit cillum nulla deserunt commodo culpa est commodo anim id anim sit. Officia id consectetur velit incididunt est dolor sunt ipsum magna aliqua consectetur. Eiusmod pariatur minim deserunt cupidatat veniam Lorem aliquip sunt proident eu Lorem sit dolor fugiat. Proident qui ut ex in incididunt nulla nulla dolor ex laboris ea ad.","Ex incididunt enim labore nulla cupidatat elit. Quis ut incididunt incididunt non irure commodo do mollit cillum anim excepteur. Qui consequat laborum dolore elit tempor aute ut nulla pariatur eu ullamco veniam. Nisi non velit labore in commodo excepteur culpa nulla tempor cillum. Ipsum qui sit sint reprehenderit ut labore incididunt dolor aliquip sunt. Reprehenderit occaecat tempor nisi laborum.","Lorem officia ullamco eu occaecat in magna eiusmod consectetur nisi aliqua mollit esse. Ullamco ex aute nostrud pariatur do enim cillum sint do fugiat nostrud culpa tempor. Do aliquip excepteur nostrud culpa eu pariatur eiusmod cillum excepteur do. Est sunt non quis cillum voluptate ex.","Deserunt consectetur tempor irure mollit qui tempor et. Labore enim eu irure laboris in. Nisi in tempor ex occaecat amet cupidatat laboris occaecat amet minim ut magna incididunt id. Consequat cillum laborum commodo mollit. Et magna culpa sunt dolore consequat laboris et sit. Deserunt qui voluptate excepteur dolor. Eu qui amet est proident.","Eu elit minim eiusmod occaecat eu nostrud dolor qui ut elit. Sunt dolore proident ea eu do eiusmod fugiat incididunt pariatur duis amet Lorem nisi ut. Adipisicing quis veniam cupidatat Lorem sint culpa sunt veniam sint. Excepteur eu exercitation est magna pariatur veniam dolore qui fugiat labore proident eiusmod cillum. Commodo reprehenderit elit proident duis sint magna.","Ut aliquip pariatur deserunt nostrud commodo ad proident est exercitation. Sit minim do ea enim sint officia nisi incididunt laborum. Ex amet duis commodo fugiat. Ut aute tempor deserunt irure occaecat aliquip voluptate cillum aute elit qui nostrud.","Irure et quis consectetur sit est do sunt aliquip eu. Cupidatat pariatur consequat dolore consectetur. Adipisicing magna velit mollit occaecat do id. Nisi pariatur cupidatat cillum incididunt excepteur consectetur excepteur do laborum deserunt irure pariatur cillum.","Adipisicing esse incididunt cillum est irure consequat irure ad aute voluptate. Incididunt do occaecat nostrud do ipsum pariatur Lorem qui laboris et pariatur. Est exercitation dolor culpa ad velit ut et.","Sit eiusmod id enim ad ex dolor pariatur do. Ullamco occaecat quis dolor minim non elit labore amet est. Commodo velit eu nulla eiusmod ullamco. Incididunt anim pariatur aute eiusmod veniam tempor enim officia elit id. Elit Lorem est commodo dolore nostrud. Labore et consectetur do exercitation veniam laboris incididunt aliqua proident dolore ea officia cupidatat. Velit laboris aliquip deserunt labore commodo.","Proident nostrud labore eu nostrud. Excepteur ut in velit labore ea proident labore ea sint cillum. Incididunt ipsum consectetur officia irure sit pariatur veniam id velit officia mollit. Adipisicing magna voluptate velit excepteur enim consectetur incididunt voluptate tempor occaecat fugiat velit excepteur labore. Do do incididunt qui nisi voluptate enim. Laboris aute sit voluptate cillum pariatur minim excepteur ullamco mollit deserunt.","Excepteur laborum adipisicing nisi elit fugiat tempor. Elit laboris qui enim labore duis. Proident tempor in consectetur proident excepteur do ex laboris sit.","Dolore do ea incididunt do duis dolore eu labore nisi cupidatat voluptate amet incididunt minim. Nulla pariatur mollit cupidatat adipisicing nulla et. Dolor aliquip in ex magna excepteur. Nulla consequat minim consequat ullamco dolor laboris ullamco eu reprehenderit duis nostrud pariatur.","Id nisi labore duis qui. Incididunt laboris tempor aute do sit. Occaecat excepteur est mollit ea in mollit ullamco est amet reprehenderit.","Aute labore ipsum velit non voluptate eiusmod et reprehenderit cupidatat occaecat. Lorem tempor tempor consectetur exercitation qui nostrud sunt cillum quis ut non dolore. Reprehenderit consequat reprehenderit laborum qui pariatur anim et officia est cupidatat enim velit velit.","Commodo ex et fugiat cupidatat non adipisicing commodo. Minim ad dolore fugiat mollit cupidatat aliqua sunt dolor sit. Labore ess."]'

  -- NGX.error(table.inspect(json_decode(mixed)))
  -- NGX.error(table.inspect(rapidjson.decode(mixed)))

  -- Dropped.execute("")


    body = [[{"key_int_1" : 0.01,  " key_int𐐷" : -1.2345E+18 ,"\u20ackey_int64\u0affk\uc080":14294967295,"key_str":"𐍈¢aहh€IAB9-30./)!`~!@#$%^&*()_+=-|}{:;?/>.'<,' d35bf0d4-8d8f-4e17-a5c3-ad9bfd675266\r\n","key_float":0.0001,"str_int_key":"-135.747111636,12","key_obj": { "key_obj_1_int":2.56e-14,"key_obj_1_obj":{"key_obj_2_key":0,"null_key":null},"key_arr":[ true , "\tSuv \/ \\Jeep Rivals\" 𐍈¢aहh€ Prado Racing \rh\bh\\l \/d \f 테스트 앱 OK캐쉬백 [즐거움이 포인트다] \nh -e _r \n1010!\"" ,-0.11 , {"bool_key" :false , "empty_string_key" : ""} ]}, "dpid" : "d35bf0d4-8d8f-4e17-a5c3-ad9bfd675266" , "int_key" : 1180761,"empty_arr_key" : [], "last_empty_obj_key" : {}}]]

local b = [["\tSuv 𐍈¢aहh€ \/ \\Jeep Rivals\" Prado Racing \rh\bh\\l \/d \f 테스트 앱 OK캐쉬백 [즐거움이 포인트다] \nh -e _r \n1010!\""]] 

local native_test = '{"app":{"bundle":"com.andrewshu.android.reddit","cat":["IAB12","IAB24","news","social_networking"],"id":"7caf23a944c7437d925aedad20c666d5","name":"reddit is fun","publisher":{"id":"48578636a66e11e295fa123138070049","name":"Andrew Shu"},"ver":"4.12.13"},"at":2,"badv":["baconreader.com","details?id=com.onelouder.baconreader","details?id=com.reddit.frontpage","onelouder.com","slimspots.com"],"bcat":["IAB11-1","IAB11-2","IAB11-3","IAB11-4","IAB11-5","IAB23-1","IAB23-10","IAB23-2","IAB23-3","IAB23-4","IAB23-5","IAB23-6","IAB23-7","IAB23-8","IAB23-9","IAB25","IAB26","IAB7-39","IAB9-9"],"device":{"carrier":"505-01","connectiontype":6,"dnt":0,"geo":{"city":"Mile End","country":"AUS","region":"SA","zip":"5031"},"h":2340,"ifa":"a5429e4f-dc5f-46b7-9d7f-f23e4e484bbf","ip":"1.124.107.173","js":1,"language":"en","make":"HUAWEI","model":"LYA-L29","os":"Android","osv":"9.0.0","pxratio":3.0,"ua":"Mozilla/5.0 (Linux; Android 9; LYA-L29 Build/HUAWEILYA-L29; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/72.0.3626.105 Mobile Safari/537.36","w":1080},"ext":{"pchain":"74b46c0ea83967ca:48578636a66e11e295fa123138070049"},"id":"c1112d36-30af-4daa-8fec-c2f37127cba5","imp":[{"bidfloor":1.270,"displaymanager":"mopub","displaymanagerver":"5.4.1","ext":{"brsrclk":1,"dlp":1},"id":"1","instl":0,"native":{"battr":[1,2,3,4,5,6,7,8,9,10,13,14,15,16],"request":"{/"native/":{/"assets/":[{/"data/":{/"len/":15,/"type/":12},/"id/":5,/"required/":0},{/"id/":3,/"img/":{/"hmin/":80,/"type/":1,/"wmin/":80},/"required/":1},{/"id/":2,/"img/":{/"h/":627,/"hmin/":417,/"type/":3,/"w/":1200,/"wmin/":800},/"required/":1},{/"data/":{/"len/":150,/"type/":2},/"id/":4,/"required/":1},{/"id/":1,/"required/":1,/"title/":{/"len/":50}}],/"layout/":6,/"privacy/":1}}","ver":"1.0.0.2"},"pmp":{"deals":[{"at":2,"bidfloor":1.270,"id":"ip_46igau1lofra7205zhdqx3je78iqihqc"}],"private_auction":0},"secure":1,"tagid":"67785f62f19a46eb912eac81d46af016"}],"regs":{"ext":{"gdpr":0}},"tmax":300}'


local e1 = '{"menu":{"header":"SVG Viewer","items":[{"id":"Open"},{"id":"OpenNew","label":"Open New"},null,{"id":"ZoomIn","label":"Zoom In"},{"id":"ZoomOut","label":"Zoom Out"},{"id":"OriginalView","label":"Original View"},null,{"id":"Quality"},{"id":"Pause"},{"id":"Mute"},null,{"id":"Find","label":"Find..."},{"id":"FindAgain","label":"Find Again"},{"id":"Copy"},{"id":"CopyAgain","label":"Copy Again"},{"id":"CopySVG","label":"Copy SVG"},{"id":"ViewSVG","label":"View SVG"},{"id":"ViewSource","label":"View Source"},{"id":"SaveAs","label":"Save As"},null,{"id":"Help"},{"id":"About","label":"About Adobe CVG Viewer..."}]}}'

local e2 = [[{"web-app":{"servlet":[{"servlet-name":"cofaxCDS","servlet-class":"org.cofax.cds.CDSServlet","init-param":{"configGlossary:installationAt":"Philadelphia, PA","configGlossary:adminEmail":"ksm@pobox.com","configGlossary:poweredBy":"Cofax","configGlossary:poweredByIcon":"/images/cofax.gif","configGlossary:staticPath":"/content/static","templateProcessorClass":"org.cofax.WysiwygTemplate","templateLoaderClass":"org.cofax.FilesTemplateLoader","templatePath":"templates","templateOverridePath":"","defaultListTemplate":"listTemplate.htm","defaultFileTemplate":"articleTemplate.htm","useJSP":false,"jspListTemplate":"listTemplate.jsp","jspFileTemplate":"articleTemplate.jsp","cachePackageTagsTrack":200,"cachePackageTagsStore":200,"cachePackageTagsRefresh":60,"cacheTemplatesTrack":100,"cacheTemplatesStore":50,"cacheTemplatesRefresh":15,"cachePagesTrack":200,"cachePagesStore":100,"cachePagesRefresh":10,"cachePagesDirtyRead":10,"searchEngineListTemplate":"forSearchEnginesList.htm","searchEngineFileTemplate":"forSearchEngines.htm","searchEngineRobotsDb":"WEB-INF/robots.db","useDataStore":true,"dataStoreClass":"org.cofax.SqlDataStore","redirectionClass":"org.cofax.SqlRedirection","dataStoreName":"cofax","dataStoreDriver":"com.microsoft.jdbc.sqlserver.SQLServerDriver","dataStoreUrl":"jdbc:microsoft:sqlserver://LOCALHOST:1433;DatabaseName=goon","dataStoreUser":"sa","dataStorePassword":"dataStoreTestQuery","dataStoreTestQuery":"SET NOCOUNT ON;select test='test';","dataStoreLogFile":"/usr/local/tomcat/logs/datastore.log","dataStoreInitConns":10,"dataStoreMaxConns":100,"dataStoreConnUsageLimit":100,"dataStoreLogLevel":"debug","maxUrlLength":500}},{"servlet-name":"cofaxEmail","servlet-class":"org.cofax.cds.EmailServlet","init-param":{"mailHost":"mail1","mailHostOverride":"mail2"}},{"servlet-name":"cofaxAdmin","servlet-class":"org.cofax.cds.AdminServlet"},{"servlet-name":"fileServlet","servlet-class":"org.cofax.cds.FileServlet"},{"servlet-name":"cofaxTools","servlet-class":"org.cofax.cms.CofaxToolsServlet","init-param":{"templatePath":"toolstemplates/","log":1,"logLocation":"/usr/local/tomcat/logs/CofaxTools.log","logMaxSize":"","dataLog":1,"dataLogLocation":"/usr/local/tomcat/logs/dataLog.log","dataLogMaxSize":"","removePageCache":"/content/admin/remove?cache=pages&id=","removeTemplateCache":"/content/admin/remove?cache=templates&id=","fileTransferFolder":"/usr/local/tomcat/webapps/content/fileTransferFolder","lookInContext":1,"adminGroupID":4,"betaServer":true}}],"servlet-mapping":{"cofaxCDS":"/","cofaxEmail":"/cofaxutil/aemail/*","cofaxAdmin":"/admin/*","fileServlet":"/static/*","cofaxTools":"/tools/*"},"taglib":{"taglib-uri":"cofax.tld","taglib-location":"/WEB-INF/tlds/cofax.tld"}}}]]

local e3 = '[0.1100e-01,1234567890.123456789e10,-0.123456789,0.12345678910111,0.412454033640,2.6651441426902,2.718281828459,3.1415926535898,2.1406926327793]'


local utf_32_test = [[{
  "en":"I can eat glass and it doesn't hurt me.",
  "zh-Hant":"我能吞下玻璃而不傷身體。",
  "zh-Hans":"我能吞下玻璃而不伤身体。",
  "ja":"私はガラスを食べられます。それは私を傷つけません。",
  "ko":"나는 유리를 먹을 수 있어요. 그래도 아프지 않아요"
}]]

-- local t = {1,2,3}
-- -- t["key"] = {4,5,true}
-- local str = string.char(unpack(t))
-- NGX.error(table.inspect(str))

-- local file = io.open("raw_request_new-"..t(ngx.worker.id())..".csv", "b")
-- file:write(ngx.ctx.body)
-- file:write("\n")
-- file:close()
-- local utf8_binary_test = 

local body = body
-- local bit32 = require("bit32")
-- local p = {1,2,3,4}
-- local l = 0--bit32.lshift(p[1], 12) + bit32.lshift(p[2], 8) + bit32.lshift(p[3], 4) + p[4]
-- local k = p[1] * 2^12 + p[2] * 2^8 + p[3] * 2^4 + p[4]

-- NGX.error(l.." "..k)

local j =json_decode(body)
local j2 = cjson.encode(cjson_decode(body))
NGX.error("--------------- json decode ---------------")
NGX.error(table.inspect(j))
NGX.error("--------------- cjson decode ---------------")
NGX.error(table.inspect(cjson_decode(body)))
NGX.error("--------------- apidjson decode ---------------")
local  o = rapidjson_decode(body)
NGX.error(table.inspect(o))
local h = json.encode(j)
NGX.error(h)
NGX.error(j2)

NGX.error(t(h==j2))

-- NGX.error(cjson.encode(j))
-- -- NGX.error(rapidjson.encode(j))
-- NGX.error(table.inspect(cjson_decode(h)))
-- NGX.error(table.inspect(json_decode(h)))
-- local r = json.encode(j)
-- NGX.error(r)


-- body = body1
-- local c = json_decode(body)
-- NGX.error(table.inspect(c))
-- -- NGX.error(t(c.key_obj.key_obj_1_obj.null_key == json.NULL).." "..ffi.string(c.key_obj.key_obj_1_obj.null_key))
-- local a = json_decode(body)
-- NGX.error(table.inspect(a))
-- NGX.error(table.inspect(cjson_decode(body)))
 -- Dropped.execute("")
-- local g, count = string.gsub(body1, "[^\128-\193]", "")
--   NGX.error(t(count))
--   NGX.error(t(#body1))

-- NGX.error(t(utf8.len(body1)))


--  NGX.error("---------------------")
-- local t1 = socket.gettime()
--   json_decode(body)
--   NGX.error(t((socket.gettime()-t1)*1000))

--   NGX.error("---------------------")
--   t1 = socket.gettime()
--   rapidjson_decode(body)
--   NGX.error(t((socket.gettime()-t1)*1000))




-- NGX.error("---------------------")
--   t1 = socket.gettime()
--   cjson_decode(body)
--   NGX.error(t((socket.gettime()-t1)*1000))

-- NGX.error("---------------------")
--   t1 = socket.gettime()
--   json_decode(body)
--   NGX.error(t((socket.gettime()-t1)*1000))
  -- body



--   local utf8 = require("lua-utf8")
-- local utf8_byte = utf8.byte
-- local string_byte = string.byte

--   local s = ""
--   local ta = {}
--   for i=1,10000 do
--     s = s..t(i)
--     ta[i] = t(i)
--   end

--   local n = #s

--   NGX.error(t(n))

--   local t1 = socket.gettime()
--   for i=1,n do
--     local k = string_byte(s,i)
--   end
--   NGX.error("1.0 "..(socket.gettime()-t1)*1000)

--   local t2 = socket.gettime()
--   for i=1,n do
--     local k = utf8_byte(s,i)
--   end
--   NGX.error("1.2 "..(socket.gettime()-t2)*1000)

--   local t3 = socket.gettime()
--   for pos,k in utf8.next,s do
--     local k = k
--   end
--   NGX.error("1.3 "..(socket.gettime()-t3)*1000)

--   local t4 = socket.gettime()
--   for i=1,n do
--     local k = ta[i]
--   end
--   NGX.error("1.4 "..(socket.gettime()-t4)*1000)


-----------------------------------
-- TEST
-----------------------------------
NGX.error("-----------------------------------")
NGX.error("Decode test")
NGX.error("-----------------------------------")
-- collectgarbage("stop")
local n = 10000
  local s
  local t1 = socket.gettime()
  for i=1,n do
    s =  rapidjson_decode(body)
  end
  local t2 = socket.gettime()
  NGX.error("rapidjson_decode: "..t((t2-t1)*1000).." GC:"..t(collectgarbage("count")))

  local t3 = socket.gettime()
  for i=1,n do
    s =  json_decode(body)
  end
  local t4 = socket.gettime()
  NGX.error("my json_decode: "..t((t4-t3)*1000).." GC:"..t(collectgarbage("count")))

  local t5 = socket.gettime()
  for i=1,n do
    s =  rapidjson_decode(body)
  end
  local t6 = socket.gettime()
  NGX.error("rapidjson_decode: "..t((t6-t5)*1000).." GC:"..t(collectgarbage("count")))

  local t7 = socket.gettime()
  for i=1,n do
    s =  json_decode(body)
  end
  local t8 = socket.gettime()

  NGX.error("my json_decode: "..t((t8-t7)*1000).." GC:"..t(collectgarbage("count")))


  local t03 = socket.gettime()
  for i=1,n do
    s =  cjson_decode(body)
  end
  local t04 = socket.gettime()

  NGX.error("cjson_decode: "..t((t04-t03)*1000).." GC:"..t(collectgarbage("count")))


  local t9 = socket.gettime()
  for i=1,n do
    s =  rapidjson_decode(body)
  end
  local t10 = socket.gettime()
  NGX.error("rapidjson_decode: "..t((t10-t9)*1000).." GC:"..t(collectgarbage("count")))

  local t11 = socket.gettime()
  for i=1,n do
    s =  json_decode(body)
  end
  local t12 = socket.gettime()

  NGX.error("my json_decode: "..t((t12-t11)*1000).." GC:"..t(collectgarbage("count")))

  local t13 = socket.gettime()
  for i=1,n do
    s =  cjson_decode(body)
  end
  local t14 = socket.gettime()

  NGX.error("cjson_decode: "..t((t14-t13)*1000).." GC:"..t(collectgarbage("count")))

  -- collectgarbage("collect")

-----------------------------------
-----------------------------------
NGX.error("-----------------------------------")
NGX.error("Encode test")
NGX.error("-----------------------------------")

local s1 = rapidjson_decode(body)

-- collectgarbage("stop")
local n = 10000
  local s
  local t1 = socket.gettime()
  for i=1,n do
    s =  rapidjson.encode(s1)
  end
  local t2 = socket.gettime()
  NGX.error("rapidjson_encode: "..t((t2-t1)*1000).." GC:"..t(collectgarbage("count")))

  local t3 = socket.gettime()
  for i=1,n do
    s =  json.encode(s1)
  end
  local t4 = socket.gettime()
  NGX.error("my json_encode: "..t((t4-t3)*1000).." GC:"..t(collectgarbage("count")))

  local t5 = socket.gettime()
  for i=1,n do
    s =  rapidjson.encode(s1)
  end
  local t6 = socket.gettime()
  NGX.error("rapidjson_encode: "..t((t6-t5)*1000).." GC:"..t(collectgarbage("count")))

  local t7 = socket.gettime()
  for i=1,n do
    s =  json.encode(s1)
  end
  local t8 = socket.gettime()

  NGX.error("my json_encode: "..t((t8-t7)*1000).." GC:"..t(collectgarbage("count")))


  local t03 = socket.gettime()
  for i=1,n do
    s =  cjson.encode(s1)
  end
  local t04 = socket.gettime()

  NGX.error("cjson_encode: "..t((t04-t03)*1000).." GC:"..t(collectgarbage("count")))


  local t9 = socket.gettime()
  for i=1,n do
    s =  rapidjson.encode(s1)
  end
  local t10 = socket.gettime()
  NGX.error("rapidjson_encode: "..t((t10-t9)*1000).." GC:"..t(collectgarbage("count")))

  local t11 = socket.gettime()
  for i=1,n do
    s =  json.encode(s1)
  end
  local t12 = socket.gettime()

  NGX.error("my json_encode: "..t((t12-t11)*1000).." GC:"..t(collectgarbage("count")))

  local t13 = socket.gettime()
  for i=1,n do
    s =  cjson.encode(s1)
  end
  local t14 = socket.gettime()

  NGX.error("cjson_encode: "..t((t14-t13)*1000).." GC:"..t(collectgarbage("count")))

  -- collectgarbage("collect")

  -----------------------------------





  -- local t8 = socket.gettime()
  -- for i=1,n do
  --   s =  rapidjson_inplace(body)
  -- end
  -- local t9 = socket.gettime()

  -- NGX.error("2.1 "..(t9-t8)*1000)

end

return _M
