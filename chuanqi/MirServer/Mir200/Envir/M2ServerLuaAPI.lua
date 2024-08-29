---�����л��ڵ���ͬʱ����
---@return any
function addattacksabakall() end

---���buff
---*  object: ���|���� ����
---*  buffid: buffid 10000�Ժ�
---*  time: ʱ��,��Ӧbuff����ά���ĵ�λ
---*  OverLap: ���Ӳ���,Ĭ��1
---*  objOwner: ʩ����
---*  abil: ���Ա� {[1]=200, [4]=20},����id=ֵ
---@param object userdata
---@param buffid integer
---@param time? integer
---@param OverLap? integer
---@param objOwner? userdata
---@param abil? table
---@return any
function addbuff(object,buffid,time,OverLap,objOwner,abil) end

---��������
---*  actor: ��Ҷ���
---*  id: ID
---*  name: ��ʾ����
---*  func: ������(������ö��ŷָ�)
---@param actor userdata
---@param id integer
---@param name string
---@param func function
---@return any
function addbutshow(actor,id,name,func) end

---�����Զ��尴ť
---*  actor: ��Ҷ���
---*  windowid: ������ID
---*  name: ��ťID
---*  func: ͼ������
---@param actor userdata
---@param windowid integer
---@param buttonid integer
---@param icon string
---@return any
function addbutton(actor,windowid,buttonid,icon) end

---�����޴�ʹ����Ʒ�Ĵ���
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷΨһID
---*  num: ����
---@param actor userdata
---@param itemmakeid integer
---@param num integer
---@return any
function addfunitemdura(actor,itemmakeid,num) end

---��Ӷ�Ա
---*  actor: ��Ҷ���
---*  userId: ��ԱUserId
---@param actor userdata
---@param userId string
---@return any
function addgroupmember(actor,userId) end

---��ʱ���ӹ��ﱬ����Ʒ
---*  actor: ��Ҷ���
---*  mon: �������
---*  itemname: ��Ʒ����
---@param actor userdata
---@param mon userdata
---@param itemname string
---@return any
function additemtodroplist(actor,mon,itemname) end

---���Ӷ�̬��ͼ����
---@return any
function addmapgate(actor) end

---���������ͼ
---*  oldMap: ԭ��ͼID
---*  NewMap: �µ�ͼID
---*  NewName: �µ�ͼ��
---*  time: ��Чʱ��(��)
---*  BackMap: �سǵ�ͼ
---@param oldMap userdata
---@param NewMap string
---@param NewName string
---@param time integer
---@param BackMap string
---@return any
function addmirrormap(oldMap,NewMap,NewName,time,BackMap) end

---���ӳ�������
---*  actor: ��Ҷ���
---*  idx: �������
---*  attrName: �Զ�����������
---*  opt: ������ + - =
---*  attr: �����ַ���
---*  type: 0���=������װ��������1=���ӹ̶�ֵ;��������װ����(���Լӳ�����Ч)
---@param actor userdata
---@param idx integer|string
---@param attrName integer|string
---@param opt string
---@param attr string
---@param type? integer
---@return any
function addpetattlist(actor,idx,attrName,opt,attr,type) end

---���ӳ��﹥������
---*  actor: ��Ҷ���
---*  idx: ������Ż�"X"��ʾ��ǰ����
---*  skillid: ���ӵĹ�������ID
---@param actor userdata
---@param idx integer
---@param skillid integer
---@return any
function addpetskill(actor,idx,skillid) end

---��Ӽ���
---*  actor: ��Ҷ���
---*  skillid: ����ID
---*  level: �ȼ�
---@param actor userdata
---@param skillid integer
---@param level integer
---@return any
function addskill(actor,skillid,level) end

---���л���ӵ������б�
---*  name: �л���
---*  day: ����
---@param name string
---@param day integer
---@return any
function addtocastlewarlist(name,day) end

---ǿ�ư��л���ӵ������б�
---*  name: �л���
---*  day: ����
---@param name string
---@param day integer
---@return any
function addtocastlewarlistex(name,day) end

---����֪ͨ�������QF
---@return any
function bfbackcall() end

---�����л�
---*  actor: ��Ҷ���
---*  name: �л���
---@param actor userdata
---@param name string
---@return any
function buildguild(actor,name) end

---��������NPC��lua����
---*  actor: ��Ҷ���
---*  npcidx: NPC��(NPC���ñ��е�ID)
---*  delaytime: �ӳ�ʱ��ms,0����ִ��
---*  func: ������
---*  sParam: 	����
---@param actor userdata
---@param npcidx integer
---@param delaytime integer
---@param func string
---@param sParam string
---@return any
function callfunbynpc(actor,npcidx,delaytime,func,sParam) end

---����TXT�ű�����
---*  actor: ��Ҷ���
---*  filename: �ļ���
---*  label: ��ǩ
---@param actor userdata
---@param filename string
---@param label string
---@return any
function callscript(actor,filename,label) end

---���ô���ű�����
---*  actor: ��Ҷ���
---*  scriptname: �ű��ӿ�
---*  ...: ����1~����10
---@param actor userdata
---@param scriptname string
---@param ... any
---@return any
function callscriptex(actor,scriptname,...) end

---���ô���ű�����2
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function callcheckscriptex(actor) end

---��ȡ���ɳ�Ϳ����
---*  actor: ��Ҷ���
---*  return: ����ֵ 0-��ɳ�Ϳ˳�Ա1-ɳ�Ϳ˳�Ա2-ɳ�Ϳ��ϴ�
---@param actor userdata
---@return any
function castleidentity(actor) end

---ɳ�Ϳ˻�����Ϣ
---*  nID: ��Ϣ���� 1=ɳ������,����string; 2=ɳ���л�����,����string; 3=ɳ���л�᳤����,����string; 
---*  nID: ��Ϣ���� 4=ռ������,����number; 5=��ǰ�Ƿ��ڹ�ɳ״̬,����Bool; 6=ɳ���лḱ�᳤�����б�,����table
---@param nID integer
---@return any
function castleinfo(nID) end

---�޸Ĺ���ģʽ
---*  actor: ��Ҷ���
---*  attackmode: 0-ȫ�幥��
---*  attackmode: 1-��ƽ����
---*  attackmode: 2-���޹���
---*  attackmode: 3-ʦͽ����
---*  attackmode: 4-���鹥��
---*  attackmode: 5-�лṥ��
---*  attackmode: 6-��������
---*  attackmode: 7-���ҹ���
---@param actor userdata
---@param attackmode integer
---@return any
function changeattackmode(actor,attackmode) end

---���Զ���װ������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  attrindex: ����λ��(0~9)
---*  bindindex: ������(0~4)
---*  bindvalue: �󶨵�ֵ
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor userdata
---@param item userdata
---@param attrindex integer
---@param bindindex integer
---@param bindvalue integer
---@param group? integer
---@return any
function changecustomitemabil(actor,item,attrindex,bindindex,bindvalue,group) end

---���Ӻ��޸��Զ������Է�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  typename: ��������(-1Ϊ���)
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor userdata
---@param item userdata
---@param typename string
---@param group? integer
---@return any
function changecustomitemtext(actor,item,typename,group) end

---���Ӻ��޸ķ���������ɫ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  color: ������ɫ(0~255)
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor userdata
---@param item userdata
---@param color integer
---@param group? integer
---@return any
function changecustomitemtextcolor(actor,item,color,group) end

---�޸��Զ�������ֵ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  attrindex: ����λ��(0~9)ÿ��װ�������Զ���10������
---*  operate: ������:+��-��=
---*  value: ����ֵ
---*  group: ��ʾ����λ��(0~2 ;Ϊ��Ĭ��Ϊ0)
---@param actor userdata
---@param item userdata
---@param attrindex integer
---@param operate string
---@param value integer
---@param group? integer
---@return any
function changecustomitemvalue(actor,item,attrindex,operate,value,group) end

---�޸��������·���Ч
---*  actor: ��Ҷ���
---*  where: λ�� 0 1
---*  EffId: ��ЧID
---*  selfSee: �Ƿ�ֻ���Լ����� 0=�����Լ��ɼ� 1=�����˶��ɼ�
---@param actor userdata
---@param where integer
---@param EffId integer
---@param selfSee integer
---@return any
function changedresseffect(actor,where,EffId,selfSee) end

---�������ﾭ��ֵ
---*  actor: ��Ҷ���
---*  opt: ��Ҷ���
---*  count: ����
---*  addexp: �Ƿ����Ӿ����龭��
---@param actor userdata
---@param opt string
---@param count integer
---@param addexp boolean
---@return any
function changeexp(actor,opt,count,addexp) end

---�����л��Ա��������
---*  actor: ��Ҷ���
---*  char: (������ + - = )
---*  num: ����
---@param actor userdata
---@param char string
---@param num integer
---@return any
function changeguildmemberlimit(actor,char,num) end

---������������
---*  actor: ��Ҷ���
---*  id: ����ID 1-20
---*  time: ����ֵ
---*  value: ʱ��(��)
---@param actor userdata
---@param id integer
---@param value integer
---@param time integer
---@return any
function changehumability(actor,id,value,time) end

---�޸���������
---*  actor: ��Ҷ���
---*  name: Ҫ��ѯ������
---@param actor userdata
---@param name string
---@return any
function changehumname(actor,name) end


---����������ϲ��ŵ���Ч
---*  actor: ��Ҷ���
---*  effectid: ��ЧID
---@param actor userdata
---@param effectid integer
---@return any
function clearplayeffect(actor,effectid) end

---������м���
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function clearskill(actor) end

---�رյ�ǰ��NPC�Ի���
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function close(actor) end

---�ٻ�ʰȡС����
---*  actor: ��Ҷ���
---*  monName: �������� ������Ҫ��cfg_monster.xls���������:Race=216
---@param actor userdata
---@param monName string
---@return any
function createsprite(actor,monName) end

---ɾ��Ӣ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function delhero(actor) end

---ɾ��Ini�ļ�������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function deliniitem(actor) end

---ɾ��Ini�ļ�������(��Cache)
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function deliniitembycache(actor) end

---ɾ��Ini�ļ�������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function delinisection(actor) end

---ɾ��Ini�ļ������� ��Cache
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function delinisectionbycache(actor) end

---ͨ����ƷΨһid������Ʒ
---*  actor: ��Ҷ���
---*  makeindx: ��ƷΨһID,����(,)����
---*  count: ��Ҷ���
---@param actor userdata
---@param makeindx string|integer
---@param count? integer
---@return any
function delitembymakeindex(actor,makeindx,count) end

---ɾ����ͼ��Ч
---*  Id: ��Ч����ID
---@param Id integer
---@return any
function delmapeffect(Id) end

---ɾ����̬��ͼ����
---*  actor: ��Ҷ���
---*  MapId: ��ͼid
---@param actor userdata
---@param MapId string|integer
---@return any
function delmapgate(actor,MapId) end

---ɾ�������ͼ
---*  MapId: ��ͼID
---@param MapId string
---@return any
function delmirrormap(MapId) end

---ɾ������
---*  nIdx: ����ID
---@param nIdx integer
---@return any
function delnation(nIdx) end

---ɾ���Ǳ�ְҵ����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function delnojobskill(actor) end

---ɾ��NPC
---*  name: NPC����
---*  MapId: ��ͼ���
---@param name userdata
---@param MapId string|integer
---@return any
function delnpc(name,MapId) end

---ɾ��NPC��Ч
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---@param actor userdata
---@param NPCIndex integer
---@return any
function delnpceffect(actor,NPCIndex) end

---ɾ������
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor userdata
---@param idx integer
---@return any
function delpet(actor,idx) end

---ɾ������
---*  actor: ��Ҷ���
---*  skillid: ����ID
---@param actor userdata
---@param skillid integer
---@return any
function delskill(actor,skillid) end

---�жϽ�ɫ�Ƿ��и���Ʒ
---*  actor: ��Ҷ���
---*  itemmakeid: ɾ��ΨһID��Ʒ
---@param actor userdata
---@param itemmakeid integer
---@return any
function hasitem(actor,itemmakeid) end

---����ΨһIDɾ���ֿ���Ʒ
---*  actor: ��Ҷ���
---*  itemmakeid: ɾ��ΨһID��Ʒ
---@param actor userdata
---@param itemmakeid integer
---@return any
function delstorageitem(actor,itemmakeid) end

---����idxɾ���ֿ���Ʒ
---*  actor: ��Ҷ���
---*  itemidx: ɾ������Idx��Ʒ
---@param actor userdata
---@param itemidx integer
---@return any
function delstorageitembyidx(actor,itemidx) end

---ɾ���ƺ�
---*  actor: ��Ҷ���
---*  name: �ƺ���Ʒ����
---@param actor userdata
---@param name string
---@return any
function deprivetitle(actor,name) end

---ʹ�ýű�����ⶾ(���̶�)
---*  actor: ��Ҷ���
---*  opt: -1,�����ж�;0,�̶�;1,�춾;3,�϶�;5,���;6,����;7,����
---@param actor userdata
---@param opt string
---@return any
function detoxifcation(actor,opt) end

---����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function dismounthorse(actor) end

---ֹͣ��̯
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function forbidmyshop(actor) end

---��ȡ��ɫ����buff
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getallbuffid(actor) end

---��ȡ�����л����
---@return any
function getallguild() end

---��ȡ��ǰ����ģʽ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getattackmode(actor) end

---��ȡ����ʣ��ո���
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getbagblank(actor) end

---��ȡ������Ʒ����
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---@param actor userdata
---@param itemname string
---@return any
function getbagitemcount(actor,itemname) end

---��ȡ����������Ʒ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getbagitems(actor) end

---��ȡ ����|���� �����Ϣ
---*  object: ���|���� ����
---*  nID: ���� (���˵����)
---*  param3: ����3 (��ID=1ʱ����)
---@param object userdata
---@param nID integer
---@param param3? integer
---@return any
function getbaseinfo(object,nID,param3) end

---��ȡ����ͨ�û�������(����Ҽ���)
---*  actor: ��Ҷ���
---@param actor userdata
---@param moneyName string
---@return any
function getbindmoney(actor,moneyName) end

---��ȡbuff��Ϣ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getbuffinfo(actor) end

---��ȡ����
---*  actor: ��Ҷ���
---*  varname: ��������,���txt˵����
---@param actor userdata
---@param varname string
---@return any
function getconst(actor,varname) end

---��ȡ���ֵ
---*  object: ����|�������
---*  index: �±�ID 0-9
---@param object userdata
---@param index integer
---@return any
function getcurrent(object,index) end

---������Ʒ��ȡJson
---*  item: ��Ʒ����
---@param item userdata
---@return any
function getitemjson(item) end

---���װ�����ֵ���ɫ
---*  item: ��Ʒ����
---@param item userdata
---@return any
function getitemnamecolor(item) end

---��ȡ��ǰΨһID��Ʒ����������
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷΨһID
---@param actor userdata
---@param itemmakeid integer
---@return any
function getitemstars(actor,itemmakeid) end

---��ȡָ����ͼ�������
---*  actor: ��Ҷ���
---*  MapId: ��ͼID
---*  isAllgain: �Ƿ�ȫ����ȡ 0=ȫ����ȡ 1=�ų���������
---@param actor userdata
---@param MapId string
---@param isAllgain integer
---@return any
function getplaycountinmap(actor,MapId,isAllgain) end

---��ȡ��ұ���
---*  actor: ��Ҷ���
---*  varName: ������
---@param actor userdata
---@param varName string
---@return any
function getplaydef(actor,varName) end

---�������ΨһID��ȡ��Ҷ���
---*  userdata: ���ΨһID
---@param makeindex string
---@return any
function getplayerbyid(makeindex)  end

---�����������ȡ��Ҷ���
---*  name: �������
---@param name string
---@return any
function getplayerbyname(name) end

---��ȡ������������б�
---@return any
function getplayerlst() end

---��ȡ�л��Ա���л��е�ְλ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getplayguildlevel(actor) end

---��ȡ�Զ������
---*  actor: ��Ҷ���
---*  varName: ������
---@param actor userdata
---@param varName string
---@return any
function getplayvar(actor,varName) end

---��ȡ�ֿ�ʣ�������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getsblank(actor) end

---��ȡ���ܳ�ʼ��ȴʱ��
---*  skillname: ��Ҷ���
---@param skillname string
---@return any
function getskillcscd(skillname) end

---��ȡ��ǰ������ȴʱ��
---*  actor: ��Ҷ���
---*  skillname: ��������
---@param actor userdata
---@param skillname string
---@return any
function getskilldqcd(actor,skillname) end

---���ݼ���id��ȡ��������
---*  skillname: ��������
---@param skillname string
---@return any
function getskillindex(skillname) end

---��ȡ������Ϣ
---*  actor: ��Ҷ���
---*  skillid: ����ID
---*  type: ��ȡ����:1:�ȼ�;2:ǿ���ȼ�;3:������;4:����������;
---@param actor userdata
---@param skillid integer
---@param type integer
---@return any
function getskillinfo(actor,skillid,type) end

---��ȡ���ܵȼ�
---*  actor: ��Ҷ���
---*  skillid: ����ID
---@param actor userdata
---@param skillid integer
---@return any
function getskilllevel(actor,skillid)  end

---��ȡ����ǿ���ȼ�
---*  actor: ��Ҷ���
---*  skillid: ����ID
---@param actor userdata
---@param skillid integer
---@return any
function getskilllevelup(actor,skillid)  end

---���ݼ���id��ȡ��������
---*  actor: ��Ҷ���
---*  skillname: ��������
---@param actor userdata
---@param skillname string
---@return any
function getskillname(actor,skillname) end

---��ȡ����������
---*  actor: ��Ҷ���
---@param actor userdata
---@param skillid integer
---@return any
function getskilltrain(actor,skillid) end

---���ݱ���������ȡ��ɫ��������
---*  actor: ��Ҷ���
---@param actor userdata
---@param nIndex integer
---@return any
function getslavebyindex(actor,nIndex) end


---��ȡװ����ʯ��Ƕ���
---*  actor: ��Ҷ���
---*  item: װ������
---@param actor userdata
---@param item userdata
---@return any
function getsocketableitem(actor,item) end

---��ȡ��Ҳֿ���������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getssize(actor) end

---��ȡbuffģ����Ϣ
---*  buffinfo: buffID/buff����
---*  id: 0:idx1:����;2.���;3.����ʱ��;4.��������;
---@param buffinfo integer|string
---@param id integer
---@return any
function getstdbuffinfo(buffinfo,id) end

---��ȡ��Ʒ��������
---*  itemid: ��ƷID
---@param itemid integer
---@param id integer
---@return any
function getstditematt(itemid,id) end

---��ȡ��Ʒ������Ϣ
---*  item: ��ƷID/��Ʒ����
---*  id:��˵����
---@param item integer|string
---@param id integer
---@return any
function getstditeminfo(item,id) end

---��ȡ�ֿ�������Ʒ�б�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getstorageitems(actor) end

---��ȡ�����˺�����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getsuckdamage(actor) end

---��ȡȫ�ֱ���
---*  varName: ������
---@param varName string
---@return any
function getsysvar(varName) end

---��ȡȫ���Զ������
---*  varName: ������
---@param varName string
---@return any
function getsysvarex(varName) end

---��ȡ��������64λʱ���
---@return any
function gettcount64() end

---��ȡ��Ʒ��Դ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---@param actor userdata
---@param item userdata
---@return any
function getthrowitemly(actor,item) end

---��ȡ��ɫ���гƺ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function gettitlelist(actor) end

---��ȡ������������
---*  actor: ��Ҷ���
---*  nIndex: 	����
---@param actor userdata
---@param nIndex integer
---@return any
function getusebonuspoint(actor,nIndex) end

---����Ʒ
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---*  num: 	����
---*  bind: ��Ʒ����
---@param actor userdata
---@param itemname string
---@param num integer
---@param bind? integer
---@return any
function giveitem(actor,itemname,num,bind) end

---����json�ַ�������Ʒ
---*  actor: ��Ҷ���
---*  json: json�ַ���
---@param actor userdata
---@param json string
---@return any
function giveitembyjson(actor,json) end

---����Ʒ,��ֱ�Ӵ���
---*  actor: ��Ҷ���
---*  where: װ��λ��
---*  itemname: ��Ʒ����
---*  num: ����
---*  bind: ��Ʒ����
---@param actor userdata
---@param where integer
---@param itemname string
---@param num integer
---@param bind integer
---@return any
function giveonitem(actor,where,itemname,num,bind) end

---��ȡȫ����Ϣ
---*  id: ��˵����
---@param id integer
---@return any
function globalinfo(id) end

---ִ��GM����
---*  actor: ��Ҷ���
---*  GM: GM����
---*  ...: �������
---@param actor userdata
---@param GM string
---@param ... any
---@return any
function gmexecute(actor,GM,...) end

---�ص���������ĳ��а�ȫ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function gohome(actor) end

---���ô���
---*  actor: ��Ҷ���
---*  type: ����ģʽ
---*  label: ��ת��Ľӿ�
---*  range: ����ģʽ=3ʱָ���ķ�Χ��С
---@param actor userdata
---@param type integer
---@param label string
---@param range integer
---@return any
function gotolabel(actor,type,label,range) end

---������ҵ�ָ��λ��
---*  actor: ��Ҷ���
---*  x: X����
---*  y: Y����
---@param actor userdata
---@param x integer
---@param y integer
---@return any
function gotonow(actor,x,y) end

---����ͼ�߼���
---*  mapid: ��ͼId
---*  x: X����
---*  y: Y����
---@param mapid userdata
---@param x integer
---@param y integer
---@param type integer
---@param result boolean
---@return any
function gridattr(mapid,x,y,type,result) end

---��ȡȫ����Ϣ
---*  id: ��˵����
---@param id integer
---@return any
function grobalinfo(id) end

---�����ͼ����
---*  actor: ��Ҷ���
---*  mapid: ��ͼId
---*  x: X����
---*  y: Y����
---*  level: ���Դ�����͵ȼ�(����Ϊ�� Ϊ��ʱ������Ա�ĵȼ�ֱ�Ӵ���)
---*  value: ���ͷ�Χ��(�Զӳ�Ϊ���Ĵ��Ͷ��� 0Ϊ����Ҫ��Χ)
---*  obj: �����ֶ�(����Ϊ��)
---@param actor userdata
---@param mapid userdata
---@param x integer
---@param y integer
---@param level integer
---@param value integer
---@param obj? userdata
---@return any
function groupmapmove(actor,mapid,x,y,level,value,obj) end

---�����Զ�����ɫ��������Ϣ
---*  actor: ��Ҷ���
---*  FColor: ��ͼId
---*  BColor: X����
---*  Msg: Y����
---*  flag: ���Դ�����͵ȼ�(����Ϊ�� Ϊ��ʱ������Ա�ĵȼ�ֱ�Ӵ���)
---@param actor userdata
---@param FColor integer
---@param BColor integer
---@param Msg string
---@param flag string
---@return any
function guildnoticemsg(actor,FColor,BColor,Msg,flag) end

---�Ƿ���buff
---*  actor: ��Ҷ���
---*  buffid: buffID
---@param actor userdata
---@param buffid integer
---@return any
function hasbuff(actor,buffid) end

---�Ƿ���Ӣ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function hashero(actor) end

---ˢ��Ѫ��/����
---*  object: ���/�������
---@param object userdata
---@return any
function healthspellchanged(object) end

---������Ϣ�ϱ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function httppost(actor) end

---�޸����ﵱǰѪ��
---*  actor: ��Ҷ���
---*  operate: �������� [+����][-����][=����]
---*  nvalue: HP����
---*  effid: �ز�ID
---*  delay: ��ʱʱ��(��)
---*  hiter: �˺���Դ����
---@param actor userdata
---@param operate string
---@param nvalue integer
---@param effid? integer
---@param delay? integer
---@param hiter? userdata
---@return any
function humanhp(actor,operate,nvalue,effid,hiter,delay) end

---�޸����ﵱǰMP
---*  actor: ��Ҷ���
---*  operate: �������� [+����][-����][=����]
---*  nvalue: MP����
---@param actor userdata
---@param operate string
---@param nvalue integer
---@return any
function humanmp(actor,operate,nvalue) end

---ȡ�Զ������ֱ�����λ��
---*  actor: ��Ҷ���
---*  varName: ���������
---*  playflag: 0-������� 1-�������
---*  sortflag: 0-���� 1-����
---@param actor userdata
---@param varName string
---@param playflag integer
---@param sortflag integer
---@return any
function humvarrank(actor,varName,playflag,sortflag) end

---�����ļ�
---*  path: ·������(��ʼĿ¼Envir)
---@param path string
---@return any
function include(path) end

---��ʼ���л��Զ������
---*  guil: �л����
---*  varType: ��������
---*  varName: ������
---@param guil userdata
---@param varType string
---@param varName string
---@return any
function iniguildvar(guil,varType,varName) end

---��ʼ�������Զ������
---*  actor: ��Ҷ���
---*  varType: ��������(integer/string)
---*  varRage: ������Χ(HUMAN/GUILD) HUMANָ���˱��� GUILDָ�л����
---*  varName: ������
---@param actor userdata
---@param varType string
---@param varRage string
---@param varName string
---@return any
function iniplayvar(actor,varType,varRage,varName) end

---��ʼ��ȫ���Զ������
---*  type: ��������(integer/string)
---*  varName: ������
---@param type string
---@param varName string
---@return any
function inisysvar(type,varName) end

---�жϵ�ͼ�����Ƿ�Ϊ��
---*  mapname: ��ͼ����
---*  nX: ��ͼx����
---*  nY: ��ͼy����
---@param mapname userdata
---@param nX integer
---@param nY integer
---@return any
function isemptyinmap(mapname,nX,nY) end

---�ж�Ӣ���Ƿ�Ϊ����״̬
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function isherorecall(actor) end

---������ս��״̬
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function isnationswar(actor) end

---�����Ƿ����
---*  object: ���|�������
---@param object userdata
---@return any
function isnotnull(object) end


---�ж϶����Ƿ�ɱ�����
---*  Hiter: ��������(���/Ӣ��/����)
---*  Target: ����������(���/Ӣ��/����)
---@param Hiter userdata
---@param Target userdata
---@return any
function ispropertarget(Hiter,Target) end

---����/�˳�����
---*  actor: ��Ҷ���
---*  nIdx: ����ID (1~100),��0�˳�����
---*  jobIdx: ְλ��� 0-9 ���� Ĭ��Ϊ0 
---@param actor userdata
---@param nIdx integer
---@param jobIdx integer
---@return any
function joinnational(actor,nIdx,jobIdx) end

---�ַ���ת���ɱ��
---*  str: ��Ҷ���
---@param str string
---@return any
function json2tbl(str) end

---���֪ͨ��������QF
---*  id: ��Ϣid 1-99
---*  userid: ���userid
---*  parama: ���ݵ��ַ���1(�ַ���)
---*  paramb: ���ݵ��ַ���2(�ַ���)
---@param id integer
---@param userid string
---@param parama string
---@param paramb string
---@return any
function kfbackcall(id,userid,parama,paramb) end

---����ǿ�Ƶ���
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function kick(actor) end

---����ɱ����ɫ
---*  actor: ��ɫ�Ķ���
---*  actor: ���ֵĶ���
---@param actor userdata
---@param strKiller userdata
---@return any
function kill(actor,strKiller) end

---�ű����÷���ɱ����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function killedprotect(actor) end

---��ָ��λ�����ȴ�ָ�����
---*  actor: ��Ҷ���
---*  map: ��ͼ
---*  X: 	X����
---*  Y: 	Y����
---*  MonName: ���ȹ����Ĺ�������֧�ֶ����������,���������м��� | �ָ�
---@param actor userdata
---@param map string
---@param X integer
---@param Y integer
---@param MonName? string
---@return any
function killmobappoint(actor,map,X,Y,MonName) end

---ɱ��2
---*  actor: ��Ҷ���
---*  mon: �������
---*  drop: �Ƿ������Ʒ true����|false������
---*  trigger: �Ƿ񴥷�killmon
---*  showdie: �Ƿ���ʾ��������
---@param actor userdata
---@param mon userdata
---@param drop boolean
---@param trigger boolean
---@param showdie boolean
---@return any
function killmonbyobj(actor,mon,drop,trigger,showdie) end

---ɱ��1
---*  mapid: ��ͼid
---*  monname: ����ȫ�� �� nil|* ɱ��ȫ��
---*  count: ���� ��0ɱ������
---*  drop: �Ƿ������Ʒ
---@param mapid string
---@param monname string
---@param count integer
---@param drop boolean
---@return any
function killmonsters(actor,mapid,monname,count,drop) end

---���п����һر��� ����ִ���������д���
---@return any
function kuafuusergohome() end

---����װ����Ʒ
---*  actor: ��Ҷ���
---*  where: װ��λ��
---@param actor userdata
---@param where integer
---@return any
function linkbodyitem(actor,where) end

---�������ڲ�������Ʒ ��ȡ ���� ,����!!!!!!!!!!
---@return any
function linkpickupitem() end


---�ı� ��/���� ״̬
---*  object: ���/���� ����
---*  type: ����(0=�̶� 1=�춾 5=��� 12=���� 13= ���� ������Ч)
---*  time: ʱ��(��)
---*  value: ���� ֻ����̶�����
---@param object userdata
---@param type integer
---@param time integer
---@param value? integer
---@return any
function makeposion(object,type,time,value) end

---��ת��ͼ(�������)
---*  actor: ��Ҷ���
---*  mapname: ��ͼ��
---@param actor userdata
---@param mapname string
---@return any
function map(actor,mapname) end

---��ӵ�ͼ��Ч
---*  Id: ��Ч����ID �������ֶ����ͼ��Ч
---*  MapId: ��ͼID
---*  X: ����X
---*  Y: ����Y
---*  effId: ��ЧID
---*  time: ����ʱ��(��)
---*  mode: ģʽ:(0~4 0�����˿ɼ� 1�Լ��ɼ� 2��ӿɼ� 3�л��Ա�ɼ� 4�жԿɼ�)
---@param Id integer
---@param MapId string
---@param X integer
---@param Y integer
---@param effId integer
---@param time integer
---@param mode integer
---@return any
function mapeffect(Id,MapId,X,Y,effId,time,mode) end

---���õ�ͼɱ�־��鱶��
---*  actor: ��Ҷ���
---*  MapId: ��ͼid( * �ű�ʾ���е�ͼ)
---*  much: ���� Ϊɱ�־��鱶�� ��������100Ϊ�����ı���(200 Ϊ 2 ������ 150 Ϊ1.5��,0��ʾ�رյ�ͼ��ɱ�־��鱶��)
---@param actor userdata
---@param MapId string
---@param much integer
---@return any
function mapkillmonexprate(actor,MapId,much) end

---�ɵ�ͼ(ָ������)
---*  actor: ��Ҷ���
---*  mapname: ��ͼ��
---*  nX: X����
---*  nY: Y����
---*  nRange: ��Χ
---@param actor userdata
---@param mapname integer|string
---@param nX integer
---@param nY integer
---@param nRange? integer
---@return any
function mapmove(actor,mapname,nX,nY,nRange) end

---MD5����
---*  str: ��Ҫ���ܵ��ı�
---@param str string
---@return any
function md5str(str) end

---����������Ϣ
---*  actor: ��Ҷ���
---*  info: ��������
---*  flag1: ȷ������ת�Ľӿ�
---*  flag2: ȡ������ת�Ľӿ�
---@param actor userdata
---@param info string
---@param flag1 string
---@param flag2 string
---@return any
function messagebox(actor,info,flag1,flag2) end

---�ͻ��˸���
---*  actor: ��Ҷ���
---*  str: �ı�����
---@param actor userdata
---@param str string
---@return any
function mircopy(actor,str) end

---��ȡ/���� �����ͼʣ��ʱ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function mirrormaptime(actor) end

---���Ź⻷Ч��
---*  actor: ��Ҷ���
---*  mapid: ��ͼid
---*  x: ����x
---*  y: ����y
---*  type: �⻷����
---*  time: ʱ��(��)
---*  behind: ����ģʽ-0-ǰ��-1-����
---*  selfshow: ���Լ��ɼ�0-�� ��Ұ�ھ��ɼ� 1-��
---@param actor userdata
---@param mapid integer|string
---@param x integer
---@param y integer
---@param type integer
---@param time integer
---@param behind? integer
---@param selfshow? integer
---@return any
function mobfireburn(actor,mapid,x,y,type,time,behind,selfshow) end

---ɱ����Ʒ�ٱ�
---*  actor: ��Ҷ���
---*  count: ������Ʒ�������Ӵ���
---@param actor userdata
---@param count integer
---@return any
function monitems(actor,count) end

---��ĳ����ͼ�е����ȫ���ƶ�������һ����ͼ
---*  actor: ��Ҷ���
---*  aMapId: �ƶ�ǰ��ͼId
---*  bMapId: �ƶ����ͼId
---*  x: x����
---*  y: y����
---@param actor userdata
---@param aMapId string|integer
---@param bMapId string|integer
---@param x integer
---@param y integer
---@return any
function movemapplay(actor,aMapId,bMapId,x,y) end

---������ս
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function nationswar(actor) end

---���ֽ�����������
---*  actor: ��Ҷ���
---*  NPCIdx: ����ID
---*  BtnIdx: ��ť����
---*  sMsg: ��ʾ������
---@param actor userdata
---@param NPCIdx integer
---@param BtnIdx integer
---@param sMsg? string
---@return any
function navigation(actor,NPCIdx,BtnIdx,sMsg) end

---ˢ�½���������״̬
---*  actor: ��Ҷ���
---*  nId: ����ID
---*  ...:����1~����10
---@param actor userdata
---@param nId integer
---@param ... any
---@return any
function newchangetask(actor,nId,...) end

---�������
---*  actor: ��Ҷ���
---*  nId: ����
---@param actor userdata
---@param nId integer
---@return any
function newcompletetask(actor,nId) end

---ɾ������
---*  actor: ��Ҷ���
---*  nId: ����
---@param actor userdata
---@param nId integer
---@return any
function newdeletetask(actor,nId) end

---��ȡ������ĵڼ��еڼ�������(0��0�п�ʼ)
---*  filename: ��Ҷ���
---*  row: ��Ҷ���
---*  col: ��Ҷ���
---@param filename userdata
---@param row integer
---@param col integer
---@return any
function newdqcsv(filename,row,col) end


---�½�����
---*  actor: ��Ҷ���
---*  nId: 	����ID
---*  ...: ����1~����10 �����滻�����������%s
---@param actor userdata
---@param nId integer
---@param ... string|integer
---@return any
function newpicktask(actor,nId,...) end

---����csv�������
---*  filename: �ļ���
---@param filename string
---@return any
function newreadcsv(filename) end

---�Ƿ�����ָ���������� CanBuyShopItem������ʹ�� 
---*  actor: ��Ҷ���
---*  canbuy: 1-�������� 0-������
---@param actor userdata
---@param canbuy integer
---@return any
function notallowbuy(actor,canbuy) end

---�Ƿ�����ָ��������ʾ CanShowShopItem������ʹ�� 
---*  actor: ��Ҷ���
---*  canbuy: 1-����ʾ 0-��ʾ
---@param actor userdata
---@param canshow integer
---@return any
function notallowshow(actor,canshow) end

---�ر�ָ��װ���Ա���ʾ
---*  actor: ��Ҷ���
---*  order: 1=��ƷΨһID 2=��ƷIDX 3=��Ʒ����
---*  str: 	��Ӧ����2������ֵ
---@param actor userdata
---@param order integer
---@param str string
---@return any
function nothintitem(actor,order,str) end

---���߹һ�
---*  actor: ��Ҷ���
---*  time: ����ʱ��(��)
---@param actor userdata
---@param time integer
---@return any
function offlineplay(actor,time) end

---������Ϸ���
---*  actor: ��Ҷ���
---*  nId: 	���ID
---*  nState: 0=�� 1=������ظ��㰴ť����ر�,����������رհ�ť(һ��������������������õ�) 2=�رյ�ǰ���ID
---@param actor userdata
---@param nId integer
---@param nState integer
---@return any
function openhyperlink(actor,nId,nState) end

---��NPC�󴰿�
---*  path: ·��
---*  pos: ��ʾλ��
---*  x: X����
---*  y: Y����
---*  height: �߶�
---*  width: ���
---*  bool: �Ƿ���ʾ�رհ�ť
---*  closeX: �رհ�ťX����
---*  closeY: �رհ�ťY����
---*  isMove: �Ƿ�����ƶ�
---@param path string
---@param pos integer
---@param x integer
---@param y integer
---@param height integer
---@param width integer
---@param bool integer
---@param closeX integer
---@param closeY integer
---@param isMove integer
---@return any
function openmerchantbigdlg(path,pos,x,y,height,width,bool,closeX,closeY,isMove) end

---��ָ��NPC���
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---*  nRange: ��Χֵ �ڴ˷�Χ�������
---@param actor userdata
---@param NPCIndex integer
---@param nRange integer
---@return any
function opennpcshow(actor,NPCIndex,nRange) end

---�ƶ���ָ��NPC����
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID 
---*  nRange: ��Χֵ ���ڴ˷�Χ�����ƶ���NPC����
---*  actor: ��Χֵ2 �ƶ���NPC�����ķ�Χ��
---@param actor userdata
---@param NPCIndex integer
---@param nRange integer
---@param nRange2 integer
---@return any
function opennpcshowex(actor,NPCIndex,nRange,nRange2) end

---�򿪲ֿ����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function openstorage(actor) end

---��OK��
---*  actor: ��Ҷ���
---*  title: OK�����
---@param actor userdata
---@param title string
---@return any
function openupgradedlg(actor,title) end

---��Ϸ�д���վ
---*  actor: ��Ҷ���
---*  url: ��վ
---@param actor userdata
---@param url string
---@return any
function openwebsite(actor,url) end

---�鿴�Լ����
---*  actor: ��Ҷ���
---*  winID: 101=װ�� 102=״̬ 103=���� 104=���� 105=��Ф 106=�ƺ� 1011=ʱװ
---@param actor userdata
---@param winID integer
---@return any
function openwindows(actor,winID) end

---�����ı�
---*  text: 	�ı�����
---*  actor: ��Ҷ���
---@param text string
---@param actor userdata
---@return any
function parsetext(text,actor) end

---�û��������� *ֻ�û���������:���󡢹�������� ԭ������������ȫ������ �������
---*  actor: ��Ҷ���
---*  idx: 	�������
---*  monidx: 	����IDX
---@param actor userdata
---@param idx integer
---@param monidx integer
---@return any
function petmon(actor,idx,monidx) end

---��ȡ����״̬
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor userdata
---@param idx integer
---@return any
function petstate(actor,idx) end

---������װ�� �˽ӿڲ��ۼ���Ʒ ���ۼ��������϶�Ӧװ�����ԡ�
---*  actor: ��Ҷ���
---*  idx: �������
---*  item: װ������ ���װ����#�ָ� -1��ʾ����ȫ��װ��
---@param actor userdata
---@param idx integer
---@param item string
---@return any
function pettakeoff(actor,idx,item) end

---���ﴩװ�� �˽ӿڲ���������Ʒ ������Ʒ��������ӵ��������� �����浽���ݿ⡣
---*  actor: ��Ҷ���
---*  idx: �������
---*  item: װ������ ���װ����#�ָ�
---@param actor userdata
---@param idx integer
---@param item string
---@return any
function pettakeon(actor,idx,item) end

---ʰȡģʽ
---*  actor: ��Ҷ���
---*  mode: ģʽ 0=������Ϊ���ļ�ȡ 1=��С����Ϊ���ļ�ȡ
---*  Range: ��Χ
---*  interval: ��� ��С500ms
---@param actor userdata
---@param mode integer
---@param Range integer
---@param interval integer
---@return any
function pickupitems(actor,mode,Range,interval) end

---���������ϲ�����Ч
---*  actor: ��Ҷ���
---*  actor: ��ЧID
---*  actor: ���������ƫ�Ƶ�X����
---*  actor: ���������ƫ�Ƶ�Y����
---*  actor: ���Ŵ��� ��0��һֱ����
---*  actor: ����ģʽ0-ǰ��1-����
---*  actor: ���Լ��ɼ� 0-��(��Ұ�ھ��ɼ�) 1-��
---@param actor userdata
---@param effectid integer
---@param offsetX integer
---@param offsetY integer
---@param times integer
---@param behind integer
---@param selfshow integer
---@return any
function playeffect(actor,effectid,offsetX,offsetY,times,behind,selfshow) end

---������������
---*  actor: ��Ҷ���
---*  index: �����ļ������� ��Ӧ�������ñ�id(cfg_sound.xls)
---*  times: ѭ�����Ŵ���
---*  flag: ����ģʽ:0.���Ÿ��Լ� 1.���Ÿ�ȫ�� 2.���Ÿ�ͬһ��ͼ 4.���Ÿ�ͬ������
---@param actor userdata
---@param index integer
---@param times integer
---@param flag integer
---@return any
function playsound(actor,index,times,flag) end

---�������﹥������
---*  actor: ��Ҷ���
---*  rate: ������������ 100=100%
---*  time: ��Чʱ�� ����ʱ��ָ�����
---@param actor userdata
---@param rate integer
---@param time integer
---@return any
function powerrate(actor,rate,time) end

---��ȡ�ͻ��˳�ֵ�ӿ�
---*  actor: ��Ҷ���
---*  money: ���
---*  type: ��ֵ��ʽ 1-֧���� 2-���� 3-΢��
---*  flagid: ��Ҷ���
---@param actor userdata
---@param money integer
---@param type integer
---@param flagid integer
---@return any
function pullpay(actor,money,type,flagid) end

---��ѯ���������Ƿ����
---*  actor: ��Ҷ���
---*  name: Ҫ��ѯ������
---@param actor userdata
---@param name string
---@return any
function queryhumnameexist(actor,name) end

---��ѯ�������
---*  actor: ��Ҷ���
---*  id: ����ID 1-100 
---@param actor userdata
---@param id integer
---@return any
function querymoney(actor,id) end

---���ɱ����ͼ�еĹ���
---*  mapid: ��Ҷ���
---*  name: ��������
---*  num: ����(1-255)
---*  drop: �Ƿ���� 0=���� 1=������
---@param mapid string
---@param name integer
---@param num integer
---@param drop integer
---@return any
function randomkillmon(mapid,name,num,drop) end

---���Ӹ����˺�Ч��
---*  actor: ��Ҷ���
---*  targetX: X����
---*  targetY: Y����
---*  range: Ӱ�췶Χ
---*  power: ������
---*  addtype: ��������,��˵����
---*  addvalue: ��������ֵ,��˵����
---*  checkstate: �Ƿ��������/���/ʯ��/����/����/�춾/�̶�����0=ֱ������״̬;1=��������״̬)
---*  targettype: Ŀ������(0���=����Ŀ��;1=������;2=������)
---*  effectid: Ŀ�����ϲ��ŵ���ЧID
---@param actor userdata
---@param targetX integer
---@param targetY integer
---@param range integer
---@param power integer
---@param addtype integer
---@param addvalue integer
---@param checkstate integer
---@param targettype integer
---@param effectid? integer
---@return any
function rangeharm(actor,targetX,targetY,range,power,addtype,addvalue,checkstate,targettype,effectid) end

---��ȡIni�ļ��е��ֶ�ֵ
---*  actor: ��Ҷ���
---*  section: ��������
---*  item: ������
---@param actor userdata
---@param section string
---@param item string
---@return any
function readini(actor,section,item) end

---��ȡIni�ļ��е��ֶ�ֵ ��Cache
---*  path: ��Ҷ���
---*  section: ��������
---*  item: ������
---@param path string
---@param section string
---@param item string
---@return any
function readinibycache(path,section,item) end

---����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function realive(actor) end

---���ظ���ĳ������
---*  actor: ��Ҷ���
---*  idx: �������
---*  nHp: ������HP��
---*  type: 0-����ֵ 1-�ٷֱ�
---@param actor userdata
---@param idx integer
---@param nHp integer
---@param type integer
---@return any
function realivepet(actor,idx,nHp,type) end

---ˢ����������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function recalcabilitys(actor) end

---�ٻ�Ӣ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function recallhero(actor) end

---�ٻ�����
---*  actor: ��Ҷ���
---*  monName: ��������
---*  level: �����ȼ�(���Ϊ7)
---*  time: �ѱ�ʱ��(����)
---*  param1: Ԥ��(��0)
---*  param2: Ԥ��(��0)
---*  param3: ���ô���0 ���ʱ������ñ�������(��M2���Ƶ��ٻ�����)
---@param actor userdata
---@param monName string
---@param level integer
---@param time integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@return any
function recallmob(actor,monName,level,time,param1,param2,param3) end

---�����ٻ��ĳ������
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor userdata
---@param idx integer
---@return any
function recallpet(actor,idx) end

---����OK����Ʒ������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function reclaimitem(actor) end

---�����������Ʒ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function refreshbag(actor) end

---ˢ����Ʒ��Ϣ��ǰ��
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---@param actor userdata
---@param item userdata
---@return any
function refreshitem(actor,item) end

---��NPCע��Lua��Ϣ
---*  msgId: ��ϢID
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---@param msgId integer
---@param NPCIndex integer
---@return any
function regnpcmsg(msgId,NPCIndex) end

---�ýű������ͷż���
---*  actor: ��Ҷ���
---*  skillid: 	����ID
---*  type: ���� 1-��ͨ����2-ǿ������
---*  level: ���ܵȼ�
---*  target: ���ܶ���: 1-����Ŀ�� 2-����
---*  flag: �Ƿ���ʾʩ������ 0-����ʾ 1-��ʾ
---@param actor userdata
---@param skillid integer
---@param type integer
---@param level integer
---@param target integer
---@param flag integer
---@return any
function releasemagic(actor,skillid,type,level,target,flag) end

---����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function releasesprite(actor) end

---��ӡ��Ϣ������̨ ���濪��ģʽ �����������̨�� ����ģʽ ���¼��ScriptXX�ļ��� ���������Ų����
---@param ... any
---@return any
function release_print(...) end

---����ת������
---*  actor: ��Ҷ���
---*  rlevel: ת������һ��ת���ټ�(��ֵ��ΧΪ1-255)
---*  level: ת����ȼ�����ת��������ĵȼ� 0Ϊ���ı����ﵱǰ�ȼ�
---*  num: �������ת������Եõ��ĵ��� �˵������ܰ����������������Ե�(��ֵ��Χ 1 - 20000)
---@param actor userdata
---@param rlevel integer
---@param level integer|nil
---@param num integer|nil
---@return any
function renewlevel(actor,rlevel,level,num) end

---�޸�����װ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function repairall(actor) end

---�����ļ�
---*  path: ·������
---@param path string
---@return any
function require(path) end

---�ջس���
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function retractpettoitem(actor) end

---����
---*  actor: ��Ҷ���
---*  HorseAppr: �������
---*  HorseEff: ������Ч���
---*  HorseFature: �����������
---*  Type: �������� 0=���� 1=˫�� 2=����
---@param actor userdata
---@param HorseAppr integer
---@param HorseEff integer
---@param HorseFature integer
---@param Type integer
---@return any
function ridehorse(actor,HorseAppr,HorseEff,HorseFature,Type) end

---NPC�����ı�����
---*  actor: ��Ҷ���
---*  msg: �����ı�����
---@param actor userdata
---@param msg string
---@return any
function say(actor,msg) end

---��Ļ��
---*  actor: ��Ҷ���
---*  type: ģʽ(0~4)0.���Լ�;1.����������;2��Ļ��Χ������;3.��ǰ��ͼ��������;4.ָ����ͼ��������;
---*  level: ��(1~3)
---*  num: 	����
---*  mapid: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---@param actor userdata
---@param type integer
---@param level integer
---@param num integer
---@param mapid integer
---@return any
function scenevibration(actor,type,level,num,mapid) end

---������Ļ��Ч
---*  actor: ��Ҷ���
---*  id: ģʽ(0~4)0.���Լ�;1.����������;2��Ļ��Χ������;3.��ǰ��ͼ��������;4.ָ����ͼ��������;
---*  effectid: ��(1~3)
---*  X: ����
---*  Y: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---*  speed: ����
---*  times: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---*  type: ��ͼID(ģʽ����4ʱ ��Ҫ�ò���)
---@param actor userdata
---@param id integer
---@param effectid integer
---@param X integer
---@param Y integer
---@param speed integer
---@param times integer
---@param type integer
---@return any
function screffects(actor,id,effectid,X,Y,speed,times,type) end


---����������ѡ��Ʒ
---*  actor: ��Ҷ���
---*  makeindex: ѡ�е���ƷΨһID�����Ʒ��","�ָ�
---@param actor userdata
---@param makeindex string
---@return any
function selectbagitems(actor,makeindex) end

---����ƮѪƮ����Ч
---*  target: ƮѪƮ�ֵ����� һ��Ϊ�ܹ�����
---*  type: ��ʾ���� 1- �˺� 2- �����˺� 3- ����Ч�� 4- ��HP 5- �� 8- �ۼ�HP��MP 9- �˺� 10-�ۼ�MP 11- ����һ��
---*  damage: ��ʾ�ĵ���
---*  hitter: �ɿ���ƮѪƮ�ֵ����� һ��Ϊ������
---@param target userdata
---@param type integer
---@param damage integer
---@param hitter? userdata|string
---@return any
function sendattackeff(target,type,damage,hitter) end

---������Ļ�м��������Ϣ
---*  actor: ��Ҷ���
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  Msg: ��Ϣ����
---*  flag: ���Ͷ���
---*  time: ��ʾʱ��
---*  func: ����ʱ�����󴥷��ص�
---@param actor userdata
---@param FColor integer
---@param BColor integer
---@param Msg string
---@param flag? string|integer
---@param time? integer
---@param func? string
---@return any
function sendcentermsg(actor,FColor,BColor,Msg,flag,time,func) end

---��Ļ�������귢�͹�����Ϣ
---*  actor: ��Ҷ���
---*  type: ��Ϣ����0-ȫ�� 1-�Լ� 2-��� 3-�л� 4-��ǰ��ͼ
---*  msg: ��Ϣ����
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  X: X����
---*  Y: Y����
---@param actor userdata
---@param type integer
---@param msg string
---@param FColor integer
---@param BColor integer
---@param X integer
---@param Y integer
---@return any
function sendcustommsg(actor,type,msg,FColor,BColor,X,Y) end

---��ʾ����ʱ��Ϣ��ʾ
---*  actor: ��Ҷ���
---*  msg: ��Ϣ����
---*  time: ʱ�� ��
---*  FColor: ���徰ɫ
---*  mapdelete: ����ͼ�Ƿ�ɾ�� 0-��ɾ�� 1-ɾ��
---*  func: ��ת�ĺ���
---*  Y: Y����
---@param actor userdata
---@param msg string
---@param time integer
---@param FColor integer
---@param mapdelete integer
---@param func string
---@param Y integer
---@return any
function senddelaymsg(actor,msg,time,FColor,mapdelete,func,Y) end

---������Ϣ
---*  actor:    ��Ҷ���
---*  msgid:    ��ϢID
---*  param1: 	����1
---*  param2: 	����2
---*  param3: 	����3
---*  sMsg: 	��Ϣ��
---@param actor userdata
---@param msgid integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@param sMsg? string
---@return any
function sendluamsg(actor,msgid,param1,param2,param3,sMsg) end

---�����ʼ�
---*  userid: ��UserId ���������� ��Ҫ��ǰ���#(��:#����)
---*  id: �Զ����ʼ�ID
---*  title: �ʼ�����
---*  memo: �ʼ�����
---*  rewards: ��������: ��Ʒ1#����#�󶨱��&��Ʒ2#����#�󶨱�� &���� #�ָ�
---@param userid string
---@param id integer
---@param title string
---@param memo string
---@param rewards string
---@return any
function sendmail(userid,id,title,memo,rewards) end

---������Ļ������Ϣ
---*  actor: ��Ҷ���
---*  type: ģʽ ���Ͷ��� 0-�Լ� 1-������ 2-�л� 3-��ǰ��ͼ 4-���
---*  FColor: ���徰ɫ
---*  BColor: ����ɫ
---*  Y: Y����
---*  scroll: ��������
---*  msg: 	��Ϣ����
---@param actor userdata
---@param type integer
---@param FColor integer
---@param BColor integer
---@param Y integer
---@param scroll integer
---@param msg integer
---@return any
function sendmovemsg(actor,type,FColor,BColor,Y,scroll,msg) end

---�����������Ϣ
---*  actor: ��Ҷ���
---*  type: ��Ҷ���
---*  msg: ��Ҷ���
---@param actor userdata|nil
---@param type integer
---@param msg string
---@return any
function sendmsg(actor,type,msg) end

---����Ļ��������
---*  actor: ��Ҷ���
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  msg: ��������
---*  type: ģʽ ���Ͷ��� 0-�Լ� 1-������ 2-�л� 3-��ǰ��ͼ 4-���
---*  time: ��ʾʱ��
---@param actor userdata
---@param FColor integer
---@param BColor integer
---@param msg string
---@param type integer
---@param time integer
---@return any
function sendmsgnew(actor,FColor,BColor,msg,type,time) end

---������Ұ�ڹ㲥��Ϣ
---*  actor:    ��Ҷ���
---*  msgid:    ��ϢID
---*  param1: 	����1
---*  param2: 	����2
---*  param3: 	����3
---*  sMsg: 	��Ϣ��
---@param actor userdata
---@param msgid integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@param sMsg? string
---@return any
function sendrefluamsg(actor,msgid,param1,param2,param3,sMsg) end

---���������̶���Ϣ
---*  actor: ��Ҷ���
---*  type: ģʽ ���Ͷ��� 0-�Լ� 1-������ 2-�л� 3-��ǰ��ͼ 4-���
---*  FColor: ǰ��ɫ
---*  BColor: ����ɫ
---*  time: ��ʾʱ��
---*  msg: ��������
---*  showflag: �Ƿ���ʾ�������� 0-�� 1-��
---@param actor userdata
---@param type integer
---@param FColor integer
---@param BColor integer
---@param time integer
---@param msg string
---@param showflag integer
---@return any
function sendtopchatboardmsg(actor,type,FColor,BColor,time,msg,showflag) end

---�趨���﹥��ƮѪƮ������
---*  actor: ��Ҷ���
---*  actor: ��ʾ���� ��˵����
---@param actor userdata
---@param type integer
---@return any
function setattackefftype(actor,type) end

---ǿ���޸Ĺ���ģʽ
---*  actor: ��Ҷ���
---*  mode: ����ģʽ
---*  time: ǿ���л�ʱ��ʱ��
---@param actor userdata
---@param mode integer
---@param time integer
---@return any
function setattackmode(actor,mode,time) end

---�����ݵ㾭��
---*  actor: ��Ҷ���
---*  evetime: ʱ��
---*  experience: 	����
---*  isSafe: �Ƿ�ȫ��(��0Ϊ�κεط�)
---*  mapid: ��ͼ��(�κε�ͼʹ��*��)
---*  opt: �������Ƿ��ܻ�ȡ����(0=������ 1= ����)
---*  alltime: ʱ��:��(�ݵ��þ����ʱ��)
---*  level: �ȼ�(���ټ����»�þ���)
---@param actor userdata
---@param evetime integer
---@param experience integer
---@param isSafe integer
---@param mapid integer
---@param opt integer
---@param alltime integer
---@param level integer
---@return any
function setautogetexp(actor,evetime,experience,isSafe,mapid,opt,alltime,level) end

---�������ﱳ��������
---*  actor: ��Ҷ���
---*  count: ���Ӵ�С *��С��46 ������126
---@param actor userdata
---@param count integer
---@return any
function setbagcount(actor,count) end

---��������/���������Ϣ
---*  actor: ��Ҷ���
---*  nID: ����(���˵��)
---*  value: ����ֵ
---@param actor userdata
---@param nID integer
---@param value integer
---@return any
function setbaseinfo(actor,nID,value) end

---�����ɫ
---*  actor: ��Ҷ���
---*  color: ��ɫ(0~255); 255ʱ�����ɫ; -1��Ϊת�����õ���ɫ�����������Ͻ��б�ɫ
---*  time: �ı�ʱ��(��)
---@param actor userdata
---@param color integer
---@param time integer
---@return any
function setbodycolor(actor,color,time) end

---��������ǰ׺
---*  actor: ��Ҷ���
---*  Prefix: ǰ׺��Ϣ �����������ǰ׺
---*  color: ����ɫ
---@param actor userdata
---@param Prefix string
---@param color integer
---@return any
function setchatprefix(actor,Prefix,color) end

---���ñ��ֵ
---*  object: ����������
---*  index: �±�ID 0-9
---*  value: ���ֵ
---@param object userdata
---@param index integer
---@param value integer
---@return any
function setcurrent(object,index,value) end

---�����Զ������������
---*  actor: ��Ҷ���
---*  item: װ������
---*  index: װ������������ 0~2
---*  json: ���������� json�ַ���
---@param actor userdata
---@param item userdata
---@param index integer
---@param json string
---@return any
function setcustomitemprogressbar(actor,item,index,json) end

---�޸���Ʒ�־ö�
---*  actor: ��Ҷ���
---*  itemmakeid: ΨһID
---*  char: ������(+ - =)
---*  dura: �־ö�
---@param actor userdata
---@param itemmakeid integer
---@param char string
---@param dura integer
---@return any
function setdura(actor,itemmakeid,char,dura) end

---�رյ�ͼ��ʱ��
---*  MapId: ��ͼID
---*  Idx: ��ʱ��ID
---@param MapId integer|string
---@param Idx integer
---@return any
function setenvirofftimer(MapId,Idx) end

---�趨��ͼ��ʱ��
---*  MapId: ��ͼID
---*  Idx: ��ʱ��ID
---*  second: ʱ��(��)
---*  func: ������ת�ĺ���
---@param MapId integer|string
---@param Idx integer
---@param second integer
---@param func string
---@return any
function setenvirontimer(MapId,Idx,second,func) end

---����������/��ʶֵ
---*  actor: ��Ҷ���
---*  nIndex: ���� 0-800
---*  nvalue: ��Ӧ����ֵ
---@param actor userdata
---@param nIndex integer
---@param nvalue integer
---@return any
function setflagstatus(actor,nIndex,nvalue) end

---�������GMȨ��ֵ
---*  actor: ��Ҷ���
---*  gmlevel: GMȨ��ֵ
---@param actor userdata
---@param gmlevel integer
---@return any
function setgmlevel(actor,gmlevel) end

---�����л���Ϣ
---*  actor: ��Ҷ���
---*  index: ����   0-�лṫ��
---*  value: ����ֵ
---@param actor userdata
---@param index integer
---@param value string
---@return any
function setguildinfo(actor,index,value) end

---���л��Զ��������ֵ
---*  guild: ��Ҷ���
---*  varName: ������
---*  value: ����ֵ
---*  isSave: �Ƿ񱣴浽���ݿ�(0/1)
---@param guild userdata
---@param varName string
---@param value integer|string
---@param isSave? integer
---@return any
function setguildvar(guild,varName,value,isSave) end

---��������
---*  actor: ��Ҷ���
---*  where: λ�� 0-9
---*  effType: ����Ч��(0ͼƬ���� 1��ЧID)
---*  resName: X���� (Ϊ��ʱĬ��X=0)
---*  x: Y���� (Ϊ��ʱĬ��Y=0)
---*  y: Y���� (Ϊ��ʱĬ��Y=0)
---*  autoDrop: �Զ���ȫ�հ�λ��0,1(0=�� 1=����)
---*  selfSee: �Ƿ�ֻ���Լ�����0=�����˶��ɼ�;1=�����Լ��ɼ�;
---*  posM: ����λ��(����Ĭ��Ϊ0)0=�ڽ�ɫ֮��;1=�ڽ�ɫ֮��;
---@param actor userdata
---@param where integer
---@param effType integer
---@param resName string
---@param x? integer
---@param y? integer
---@param autoDrop? integer
---@param selfSee? integer
---@param posM? integer
---@return any
function seticon(actor,where,effType,resName,x,y,autoDrop,selfSee,posM) end

---������Ʒ��¼��Ϣ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  type: [1,2]
---*  position: ��type=1,ȡֵ��Χ[0..49]type=2,ȡֵ��Χ[0..19]
---*  value: ������Ʒ��Ӧλ��ֵ
---@param actor userdata
---@param item userdata
---@param type integer
---@param position integer
---@param value integer
---@return any
function setitemaddvalue(actor,item,type,position,value) end

---�����Զ�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  value: Json�ַ��� �Զ�����������
---@param actor userdata
---@param item userdata
---@param value string
---@return any
function setitemcustomabil(actor,item,value) end

---������Ʒ��Ч
---*  actor: ��Ҷ���
---*  index: װ��λ�� -1~OK���е���Ʒ
---*  bageffectid: ������Ч���
---*  ineffectid: �ڹ���Ч���
---@param actor userdata
---@param index integer
---@param bageffectid integer
---@param ineffectid integer
---@return any
function setitemeffect(actor,index,bageffectid,ineffectid) end

---�޸�װ���ڹ�Looksֵ
---*  actor: ��Ҷ���
---*  pos: װ��λ�� (-1ʱ��OK���е�װ��0~16 17~46 55)
---*  char: ������(+ - =)
---*  actor: �ڹ�ͼƬ
---@param actor userdata
---@param pos integer
---@param char string
---@param pictrue integer
---@return any
function setitemlooks(actor,pos,char,pictrue) end

---������Ʒ��״̬
---*  item: ��Ʒ����
---*  bind: ������(0-8)
---*  state: ��״̬(0Ϊ����,1Ϊ��)
---@param item userdata
---@param bind integer
---@param state integer
---@return any
function setitemstate(item,bind,state) end

---���Ӽ��ܷ�����
---*  actor: ��Ҷ���
---*  skillname: ��������
---*  value: ��������ֵ
---*  type: ���㷽ʽ(0����������,1���ٷֱȼ���)
---@param actor userdata
---@param skillname string
---@param value integer
---@param type integer
---@return any
function setmagicdefpower(actor,skillname,value,type) end

---���Ӽ�������
---*  actor: ��Ҷ���
---*  skillname: ��������
---*  actor: ����ֵ
---*  type: ���㷽ʽ(0����������,1���ٷֱȼ���)
---@param actor userdata
---@param skillname string
---@param value integer
---@param type integer
---@return any
function setmagicpower(actor,skillname,value,type) end

---�ѹ������óɱ���
---*  mon: �������
---*  actor: ��Ҷ���
---@param mon userdata
---@param actor userdata
---@return any
function setmonmaster(mon,actor) end

---���õ�ǰ�����ڹ��ҵ�ְλ��ʽ
---*  actor: ��Ҷ���
---*  jobIdx: ְλ���
---@param actor userdata
---@param jobIdx integer
---@return any
function setnationking(actor,jobIdx) end

---�޸Ĺ���ְλ����
---*  actor: ��Ҷ���
---*  nIdx: ����ID (1~100)
---*  jobIdx: ְλ���
---*  jobName: ְλ����
---@param actor userdata
---@param nIdx integer
---@param jobIdx integer
---@param jobName string
---@return any
function setnationrank(actor,nIdx,jobIdx,jobName) end

---����װ����Ԫ������
---*  actor: ��Ҷ���
---*  where: װ��λ��-1-OK���е�װ�� 0~55-���ϵ�װ��
---*  iAttr: ����
---*  sFlag: �ȽϷ�(=+-)
---*  iValue: ��ֵ(1-100)���ٷֱ�
---@param actor userdata
---@param where integer
---@param iAttr integer
---@param sFlag string
---@param iValue integer
---@return any
function setnewitemvalue(actor,where,iAttr,sFlag,iValue) end

---����NPC��Ч
---*  actor: ��Ҷ���
---*  NPCIndex: NPC���� NPC���ñ��е�ID
---*  Effect: ��ЧID 5055-��̾�� 5056-�ʺ�
---*  X: X����
---*  Y: Y����
---@param actor userdata
---@param NPCIndex integer
---@param Effect integer
---@param X integer
---@param Y integer
---@return any
function setnpceffect(actor,NPCIndex,Effect,X,Y) end

---�Ƴ�ȫ�ֶ�ʱ��
---*  id: ��ʱ��ID
---@param id integer
---@return any
function setofftimerex(id) end

---�Ƴ����˶�ʱ��
---*  actor: ��Ҷ���
---*  id: ��ʱ��ID
---@param actor userdata
---@param id integer
---@return any
function setofftimer(actor,id,RunTick,RunTime,kf) end

---��Ӹ��˶�ʱ��
---*  actor: ��Ҷ���
---*  id: ��ʱ��ID
---*  RunTick: ִ�м�� ��
---*  RunTime: ִ�д��� >0ִ����ɺ� �Զ��Ƴ�
---*  kf: ����Ƿ����ִ�� 1:����
---@param actor userdata
---@param id integer
---@param RunTick integer
---@param RunTime? integer
---@param kf? integer
---@return any
function setontimer(actor,id,RunTick,RunTime,kf) end

------���ȫ�ֶ�ʱ��
---*  id: ��ʱ��ID
---*  tick: ִ�м�� ��
---*  count: ִ�д��� Ϊ0ʱ���޴���
---@param id integer
---@param tick integer
---@param count? integer
---@return any
function setontimerex(id,tick,count) end

---��ȡ���ﵰ�ȼ�
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷMakeIndex
---*  level: �ȼ�: -1��ʾ���޸�ֵ
---*  zlevel: ת���ȼ�: -1��ʾ���޸�ֵ
---*  exp: ����ֵ: -1��ʾ���޸�ֵ
---@param actor userdata
---@param itemmakeid integer
---@param level integer
---@param zlevel integer
---@param exp integer
---@return any
function setpetegglevel(actor,itemmakeid,level,zlevel,exp) end

---���ó���ģʽ
---*  actor: ��Ҷ���
---*  mode: ����ģʽ:1-����;2-����;3-����(������ʱ���趨Ŀ��);4-��Ϣ
---@param actor userdata
---@param mode integer
---@return any
function setpetmode(actor,mode) end

---������ұ���
---*  actor: ��Ҷ���
---*  varName: ������
---*  varValue: ����ֵ
---@param actor userdata
---@param varName string
---@param varValue string|integer
---@return any
function setplaydef(actor,varName,varValue) end

---�����л��Ա���л��е�ְλ;
---*  actor: ��Ҷ���
---*  pos: ���л��е�ְλ 0:�᳤;1:���᳤;2:�л��Ա1;3:�л��Ա2;4:�л��Ա3;
---@param actor userdata
---@param pos integer
---@return any
function setplayguildlevel(actor,pos) end

---������Զ��������ֵ
---*  actor: ��Ҷ���
---*  varType: ������Χ(HUMAN/GUILD)
---*  varName: ������
---*  varValue: ����ֵ
---*  isSave: �Ƿ񱣴浽���ݿ�(0/1)
---@param actor userdata
---@param varType string
---@param varName string
---@param varValue string|integer
---@param isSave? integer
---@return any
function setplayvar(actor,varType,varName,varValue,isSave) end

---��ʾ����ĳƺ�
---*  actor: ��Ҷ���
---*  levelname: �ƺ��ı�: ������һ����ʾ
---@param actor userdata
---@param levelname string
---@return any
function setranklevelname(actor,levelname) end

---���ټ���CD��ȴʱ��
---*  actor: ��Ҷ���
---*  skillname: ��������
---*  char: ������(+/-/=)=0���ǻ�ԭ����CD
---*  time: ʱ�� ��
---@param actor userdata
---@param skillname string
---@param char string
---@param time integer
---@return any
function setskilldeccd(actor,skillname,char,time) end

---���ü��ܵȼ�
---*  actor: ��Ҷ���
---*  skillid: ����ID
---*  flag: ����: 1-���ܵȼ� 2-ǿ���ȼ� 3-������
---*  point: ����ֵ
---@param actor userdata
---@param skillid integer
---@param flag integer
---@param point integer
---@return any
function setskillinfo(actor,skillid,flag,point) end

---��/�����κ�
---*  actor: ��Ҷ���
---*  bState: 0:�ر�: 1:����
---@param actor userdata
---@param bState integer
---@return any
function setsndaitembox(actor,bState) end

---���������˺�����
---*  actor: ��Ҷ���
---*  operate: �������� "+"���� "-"���� "="����
---*  sum: ��������
---*  rate: ���ձ���ǧ�ֱ� 1=0.1%100=10%
---*  success: ���ճɹ���
---@param actor userdata
---@param operate string
---@param sum integer
---@param rate integer
---@param success integer
---@return any
function setsuckdamage(actor,operate,sum,rate,success) end

---����ȫ�ֱ���
---*  varName: ������
---*  varValue: ����ֵ
---@param varName string
---@param varValue string|integer
---@return any
function setsysvar(varName,varValue) end

---��ȫ���Զ��������ֵ
---*  varName: ������
---*  varValue: ����ֵ
---*  isSave: �Ƿ񱣴�(0/1)
---@param varName string
---@param varValue string|integer
---@param isSave? integer
---@return any
function setsysvarex(varName,varValue,isSave) end

---���õ�ǰ����Ŀ��
---*  Hiter: ������(���/Ӣ��/����)
---*  Target: ��������(���/Ӣ��/����)
---@param Hiter userdata
---@param Target userdata
---@return any
function settargetcert(Hiter,Target) end

---������Ʒ��Դ
---*  jsonStr: ��Ҷ���
---@param jsonStr string
---@return any
function setthrowitemly(jsonStr) end

---������Ʒ��Դ(ʹ����Ʒ����)
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  jsonStr: json�ַ���
---@param actor userdata
---@param item userdata
---@param jsonStr string
---@return any
function setthrowitemly2(actor,item,jsonStr) end

---����������������
---*  actor: ��Ҷ���
---*  nIndex: ���� ��˵����
---*  nvalue: ��Ӧ����ֵ
---@param actor userdata
---@param nIndex integer
---@param nvalue integer
---@return any
function setusebonuspoint(actor,nIndex,nvalue) end

---�ɼ��ڿ�Ƚ���������
---*  actor: ��Ҷ���
---*  time: ������ʱ�� ��
---*  succ: �ɹ�����ת�ĺ���
---*  msg: ��ʾ��Ϣ
---*  canstop: �ܷ��ж� 0-�����ж� 1-�����ж�
---*  fail: �жϴ����ĺ���
---@param actor userdata
---@param time integer
---@param succ string
---@param msg string
---@param canstop integer
---@param fail string
---@return any
function showprogressbardlg(actor,time,succ,msg,canstop,fail) end

---װ����Ƕ��ʯ
---*  actor: ��Ҷ���
---*  item: װ������
---*  hole: װ��������� 0~9
---*  index: ��Ƕ��ʯ��index װ�����ܵ�Index
---@param actor userdata
---@param item userdata
---@param hole integer
---@param index integer
---@return any
function socketableitem(actor,item,hole,index) end

---�Զ����������
---*  varName: ��Ҷ���
---*  playflag: 0-������� 1-������� 2-�л�
---*  sortflag: 0-���� 1-����
---*  count: ��ȡ�������� Ϊ�ջ�0ȡ���� ȡǰ����
---@param varName userdata
---@param playflag integer
---@param sortflag integer
---@param count integer
---@return any
function sorthumvar(varName,playflag,sortflag,count) end

---�����Զ��һ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function startautoattack(actor) end

---ִֹͣ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function stop(actor) end

---ֹͣ�Զ��һ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function stopautoattack(actor) end

---ֹͣʰȡ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function stoppickupitems(actor) end

---�����������
---*  itype: �������� 1=ȫ��G���� 2=ȫ��A���� 3=ȫ���Զ������ 4=�л����
---*  astr: ���ȫ�ֱ���
---*  bstr: ���뱾��ȫ�ֱ���
---*  id: ��Ϣid
---@param itype integer
---@param astr string
---@param bstr string
---@param id integer
---@return any
function synzvar(itype,astr,bstr,id) end

---����OK����Ʒ
---*  actor: ��Ҷ���
---*  count: ���� (��Ե�����Ʒ��Ч)
---@param actor userdata
---@param count integer
---@return any
function takedlgitem(actor,count) end

---����Ʒ
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---*  qty: ����
---*  IgnoreJP: ���Լ�Ʒ0 ���ж��۳�1 ��Ʒ���۳�
---@param actor userdata
---@param itemname string
---@param qty integer
---@param IgnoreJP integer
---@return any
function takeitem(actor,itemname,qty,IgnoreJP) return boolean end

---����װ��
---*  actor: ��Ҷ���
---*  where: λ��
---*  makeindex: ��ƷΨһID
---@param actor userdata
---@param where integer
---@param makeindex integer
---@return any
function takeoffitem(actor,where,makeindex) end

---����װ��
---*  actor: ��Ҷ���
---*  where: λ��
---*  makeindex: ��ƷΨһID
---@param actor userdata
---@param where integer
---@param makeindex integer
---@return any
function takeonitem(actor,where,makeindex) end

---�����ö���ʾ
---*  actor: ��Ҷ���
---*  nId: ����ID
---@param actor userdata
---@param nId integer
---@return any
function tasktopshow(actor,nId) end

---���ת�����ַ���
---*  tbl: ��Ҷ���
---@param tbl table
---@return any
function tbl2json(tbl) end

---�޳����߹һ���ɫ
---*  mapID: ��ͼ�� ��*����ʾȫ����ͼ
---*  level: �޳��ȼ� ���ڴ˵ȼ����޳���*����ʾ����
---*  count: ����޳������ ��*����ʾ����
---@param mapID string|integer
---@param level string|integer
---@param count string|integer
---@return any
function tdummy(mapID,level,count) end

---������Ҵ��˴���
---*  actor: ��Ҷ���
---*  type: ģʽ 0-�ָ�Ĭ�� 1-���� 2-���� 3-���˴���
---*  time: ʱ��(��)
---*  objtype: ����  0-��� 1-����
---@param actor userdata
---@param type integer
---@param time integer
---@param objtype integer
---@return any
function throughhum(actor,type,time,objtype) end

---�ڵ�ͼ�Ϸ�����Ʒ
---*  actor: ��Ҷ���
---*  MapId: 	��ͼID
---*  X: ����X
---*  Y: ����Y
---*  range: ��Χ
---*  itemName: ��Ʒ��
---*  count: ����
---*  time: ʱ��(��)
---*  hint: true-������ʾ
---*  take: true-����ʰȡ
---*  onlyself: true-���Լ�ʰȡ
---*  xyinorder: true-��λ��˳�� false-���λ��
---@param actor userdata
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param itemName string
---@param count integer
---@param time integer
---@param hint boolean
---@param take boolean
---@param onlyself boolean
---@param xyinorder boolean
---@return any
function throwitem(actor,MapId,X,Y,range,itemName,count,time,hint,take,onlyself,xyinorder) end

---�ջ�Ӣ��
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function unrecallhero(actor) end

---�����ջصĳ������
---*  actor: ��Ҷ���
---*  idx: �������
---@param actor userdata
---@param idx integer
---@return any
function unrecallpet(actor,idx) end

---������װ��������Ч
---*  actor: ��Ҷ���
---*  effectid: ��ЧID  0-ɾ����Ч
---*  position: ��ʾλ�� 0-ǰ�� 1-����
---@param actor userdata
---@param effectid integer
---@param position integer
---@return any
function updateequipeffect(actor,effectid,position) end

---�鿴���������Ϣ
---*  actor: ��Ҷ���
---*  userid: ������ҵ�UserID
---*  winID: ���ID 101-װ�� 106-�ƺ� 1011-ʱװ
---@param actor userdata
---@param userid string
---@param winID integer
---@return any
function viewplayer(actor,userid,winID) end

---д��Ini�ļ��е��ֶ�ֵ
---*  filename: �ļ���
---*  section: ��������
---*  item: ������
---*  value: ������ֵ
---@param filename userdata
---@param section string
---@param item string
---@param value string
---@return any
function writeini(filename,section,item,value) end

---д��Ini�ļ��е��ֶ�ֵ ��Cache
---*  filename: �ļ���
---*  section: ��������
---*  item: ������
---*  value: ������ֵ
---@param filename userdata
---@param section string
---@param item string
---@param value string
---@return any
function writeinibycache(filename,section,item,value) end

---��ȡ��̬��ͼ����
---*  actor: ��Ҷ���
---*  mapID: ��ͼID
---@param actor userdata
---@param mapID string|integer
---@return any
function getmapgate(actor,mapID) end

---�������ƻ�ȡ��ͼ������Ϣ
---*  mapname: ��ͼ����
---*  nIndex: 0:��ͼ�� 1:��ͼ��
---@param mapname userdata
---@param nIndex integer
---@return any
function getmapinfo(mapname,nIndex) end

---��ȡ��ͼָ����Χ�ڵĹ�������б�
---*  mapID: ��ͼID
---*  monName: ��ͼ����
---*  nIndex: ������ Ϊ�� or * Ϊ������й�
---*  nx: ����X
---*  ny: ����Y
---*  nRange: ��Χ
---@param mapID string|integer
---@param monName userdata
---@param nx integer
---@param ny integer
---@param nRange integer
---@return any
function getmapmon(mapID,monName,nx,ny,nRange) end

---���ݵ�ͼid���ص�ͼ��
---*  mapID: ��ͼID
---@param mapID string|integer
---@return any
function getmapname(mapID) end

---���ع��������Ϣ
---*  monidx: ����idx
---*  id: idȡֵ:1-��������;2-����������ɫ;3-ɱ�������õľ���ֵ;
---@param monidx userdata
---@param id integer
---@return any
function getmonbaseinfo(monidx,id) end

---����UserId���ع������
---*  mapID: ��ͼID
---*  monUserId: ����userid
---@param mapID string|integer
---@param monUserId string
---@return any
function getmonbyuserid(mapID,monUserId) end

---��ȡָ����ͼ��������
---*  mapID: ��ͼID
---*  MonId: ����idx
---*  isAllMon: �Ƿ���Ա���
---@param mapID string|integer
---@param MonId integer
---@param isAllMon boolean
---@return any
function getmoncount(mapID,MonId,isAllMon) end

---��ȡ����λ�ü�����ʱ�䣨��֧��С��ͼ����ʾ�Ĺ��
---*  mapID: ��ͼID
---@param mapID string|integer
---@return any
function getmonrefresh(mapID) end

---��ȡ������ڵ��л����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getmyguild(actor) end

---��ȡ��Ʒ�ĸ�������
---*  item: ��Ҷ���
---*  value: Ԫ������ ��˵����
---@param item userdata
---@param value integer
---@return any
function getnewitemaddvalue(item,value) end

---����ID��ȡNPC����
---*  npcIdx: NPC���ڵ�idx
---@param npcIdx integer
---@return any
function getnpcbyindex(npcIdx) end

---��ȡNPC�����Idx
---*  npc: npc����
---@param npc userdata
---@return any
function getnpcindex(npc) end

---��ȡ��ͼ��ָ����Χ�ڵĶ���
---*  mapID: ��ͼID
---*  X: ����X
---*  Y: ����Y
---*  range: ��Χ
---*  flag: ���ֵ ������λ��ʾ 1-��� 2-����4-NPC 8-��Ʒ16-��ͼ�¼�
---@param mapID string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param flag integer
---@return any
function getobjectinmap(mapID,X,Y,range,flag) end

---��ȡ�������������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getoppositeobj(actor) end

---��ȡ����
---*  actor: ��Ҷ���
---*  idx: ������Ż�""X"��ʾ��ǰ����
---@param actor userdata
---@param idx integer
---@return any
function getpet(actor,idx) end

---��ȡ��������װ���б�
---*  idx: �������
---@param actor userdata
---@param idx integer
---@return any
function getpetbodyitem(actor,idx) end

---��ȡ���ﵰ��Ϣ
---*  actor: ��Ҷ���
---*  itemmakeid: ��ƷMakeIndex
---*  type: ��Ҫ���ص���ֵ1-ת���ȼ�;2-�ȼ�;3-����;0-ͬʱ��������ֵ
---@param actor userdata
---@param itemmakeid integer
---@param type integer
---@return any
function getpetegglevel(actor,itemmakeid,type) end

---��ȡ���pk�ȼ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getpklevel(actor) end

---��ȡ��ǰNPC����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getcurrnpc(actor) end

---��ȡ�Զ������������
---*  actor: ��Ҷ���
---*  item: װ������
---*  actor: װ������������ 0~2
---@param actor userdata
---@param item userdata
---@param index integer
---@return any
function getcustomitemprogressbar(actor,item,index) end

---��ȡװ����������
---*  actor: ��Ҷ���
---*  item: װ������
---@param actor userdata
---@param item userdata
---@return any
function getdrillhole(actor,item) end


---��ȡEnvir�ļ������ļ��б�
---@return any
function getenvirfilelist() end

---��ȡ������/��ʶֵ
---*  actor: �������
---*  index:  ���� 0-800
---@param actor userdata
---@param index integer
---@return any
function getflagstatus(actor,index) end

---��ȡ��Һ����б�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getfriendnamelist(actor) end

---ȡ�ַ�����csv����е��к�
---@return any
function getgjcsv() end

---��ȡ���GMȨ��ֵ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getgmlevel(actor) end

---��ȡ��Ա�б�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getgroupmember(actor) end

---��ȡ�л���Ϣ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getguildinfo(actor) end

---��ȡ���������л��Ա����
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getguildmembercount(actor) end

---��ȡ�л��Զ������
---*  guild: �л����
---*  varName: ������
---@param guild userdata
---@param varName string
---@return any
function getguildvar(guild,varName) end

---��ȡӢ�۶���
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function gethero(actor) end

---��ȡ��ǰ�������������ͻ�ȡ����������
---*  filename: �ļ���
---*  type: ��ȡĿ�꣺0-���� 1-����
---@param filename string
---@param type integer
---@return any
function gethlcsv(filename,type) end

---��ȡ��������
---*  actor: ��Ҷ���
---*  actor: ����ID��1-20��
---@param actor userdata
---@param id integer
---@return any
function gethumability(actor,id) end

---��ȡ������ʱ����
---*  actor: ��Ҷ���
---*  nWhere: λ�� ��Ӧcfg_att_score ����ID
---@param actor userdata
---@param nWhere integer
---@return any
function gethumnewvalue(actor,nWhere) end

---��ȡ��Ʒ��¼��Ϣ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  type: [1,2,3]
---*  position: ��type=1,ȡֵ��Χ[0..49] type=2,ȡֵ��Χ[0..19]
---@param actor userdata
---@param item userdata
---@param type integer
---@param position integer
---@return any
function getitemaddvalue(actor,item,type,position) end

---������ƷΨһID�����Ʒ����
---*  actor: ��Ҷ���
---*  makeindex: ��ƷΨһID
---@param actor userdata
---@param makeindex integer
---@return any
function getitembymakeindex(actor,makeindex) end

---��ȡ�Զ�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---@param actor userdata
---@param item userdata
---@return any
function getitemcustomabil(actor,item) end

---��ȡ��Ʒ��Ϣ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  id: 1:ΨһID2:��ƷID3:ʣ��־�4:���־�5:��������6:��״̬
---@param actor userdata
---@param item userdata
---@param id integer
---@return any
function getiteminfo(actor,item,id) end

---�����������ر�����Ʒ��Ϣ
---*  actor: ��Ҷ���
---*  index: ������,0��ʼ
---@param actor userdata
---@param index integer
---@return any
function getiteminfobyindex(actor,index) end

---�������
---*  actor: ��Ҷ���
---*  distance: �������������
---*  grade: �ܳ���Ӱ��Ĺ���ȼ�����
---@param actor userdata
---@param distance integer
---@param grade integer
---@return any
function dotaunt(actor,distance,grade) end

---װ������
---*  actor: ��Ҷ���
---*  item: װ������
---*  holejson: ������� json�ַ��� ֧��0~9��10����
---@param actor userdata
---@param item userdata
---@param holejson string
---@return any
function drillhole(actor,item,holejson) end

---ʹ����Ʒ����ҩ��ʹ��������Ʒ�ȣ�
---*  actor: ��Ҷ���
---*  itemname: ��Ʒ����
---*  count: ��Ҷ���
---@param actor userdata
---@param itemname string
---@param count integer
---@return any
function eatitem(actor,itemname,count) end

---���дʻ���
---*  str: Ҫ�����ı�
---@param str string
---@return any
function exisitssensitiveword(str) end

---����ȫ����ʾ��Ϣ
---*  actor: ��Ҷ���
---*  flag: �Ƿ���� 0-������ 1-����
---@param actor userdata
---@param flag integer
---@return any
function filterglobalmsg(actor,flag) end

---�����л�
---*  index: �����ؼ��� 0-�л�ID 1-�л�����
---*  key: 	�����ؼ���
---@param index integer
---@param key string
---@return any
function findguild(index,key) end

---�����������
---*  actor: ��Ҷ���
---*  idx: 	�������
---*  attrName: ��ն�Ӧ�����������;nil�������������
---@param actor userdata
---@param idx integer
---@param attrName? integer
---@return any
function delpetattlist(actor,idx,attrName) end

---ɾ�����﹥������
---*  actor: ��Ҷ���
---*  idx: ������Ż�"X"��ʾ��ǰ����
---*  skillid: ���ӵĹ�������ID Ϊcfg_monattack���е�ID
---@param actor userdata
---@param idx integer
---@param skillid integer
---@return any
function delpetskill(actor,idx,skillid) end

---�ڳ��Զ�Ѱ·��ָ������
---*  actor: ��Ҷ���
---*  aimX: Ŀ��X����
---*  aimY: Ŀ��Y����
---*  range: �������ڳ��������Զ�Ѱ·ȡֵ��Χ 0-120-�����
---@param actor userdata
---@param aimX integer
---@param aimY integer
---@param range integer
---@return any
function dartmap(actor,aimX,aimY,range) end

---�������� �ڳ��������
---*  actor: ��Ҷ���
---*  time: �ڳ����ʱ�� ��
---*  isdie: �����Ƿ���ʧ0-��ʧ 1-ʱ�䵽����ʧ
---@param actor userdata
---@param time integer
---@param isdie integer
---@return any
function darttime(actor,time,isdie) end

---��ʱ��ת
---*  actor: ��Ҷ���
---*  time: ʱ��(����)
---*  func: ��������
---*  del: ����ͼ�Ƿ�ɾ������ʱ 0��Ϊ��ʱ=��ɾ�� 1=ɾ��
---@param actor userdata
---@param time integer
---@param func string
---@param del? integer
---@return any
function delaygoto(actor,time,func,del) end

---��ʱ��Ϣ��ת
---*  actor: ��Ҷ���
---*  time: ʱ��(����)
---*  func: ��������
---@param actor userdata
---@param time integer
---@param func string
---@return any
function delaymsggoto(actor,time,func) end

---ɾ��buff
---*  actor: ��Ҷ���
---*  buffid: buffID
---@param actor userdata
---@param buffid integer
---@return any
function delbuff(actor,buffid) end

---ɾ������
---*  actor: ��Ҷ���
---*  id: ��Ҷ���
---@param actor userdata
---@param id integer
---@return any
function delbutshow(actor,id) end

---ɾ���Զ��尴ť
---*  actor: ��Ҷ���
---*  windowid: ������ID
---*  buttonid: ��ťID
---@param actor userdata
---@param windowid integer
---@param buttonid integer
---@return any
function delbutton(actor,windowid,buttonid) end

---�ر���Ļ��Ч
---*  actor: ��Ҷ���
---*  id: ��������Ч���
---*  type: ����ģʽ 0-�Լ� 1-������
---@param actor userdata
---@param id integer
---@param type integer
---@return any
function deleffects(actor,id,type) end

---ɾ����Ա
---*  actor: ��Ҷ���
---*  memberId: ��ԱUserId
---@param actor userdata
---@param memberId string
---@return any
function delgroupmember(actor,memberId) end

---��ӳƺ�
---*  actor: ��Ҷ���
---*  name: �ƺ���Ʒ����
---*  use: �������� 1����
---@param actor userdata
---@param name string
---@param use integer
---@return any
function confertitle(actor,name,use) end

---�۳�����ͨ�û�������(��������μ���)
---*  actor: ��Ҷ���
---*  moneyname: ��������
---*  actor: ��Ӧ����ֵ
---@param actor userdata
---@param moneyname string
---@param count integer
---@return any
function consumebindmoney(actor,moneyname,count) end

---��������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function creategroup(actor) end

---����Ӣ��
---*  actor: ��Ҷ���
---*  name: Ӣ������
---*  job: 	ְҵ
---*  sex: �Ա�
---@param actor userdata
---@param name string
---@param job integer
---@param sex integer
---@return any
function createhero(actor,name,job,sex) end

---��������
---*  actor: ��Ҷ���
---*  nIdx: ����ID (1~100)
---*  maxNum: ��������
---@param actor userdata
---@param nIdx integer
---@param maxNum integer
---@return any
function createnation(actor,nIdx,maxNum) end

---������ʱNPC
---*  actor: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  npcJosn: NPC��Ϣ json�ַ���
---@param actor userdata
---@param X integer
---@param Y integer
---@param npcJosn string
---@return any
function createnpc(actor,X,Y,npcJosn) end

---�ٻ�����(������ﵰ)
---*  actor: ��Ҷ���
---*  monname: �Զ����������
---*  level: ����ȼ�
---@param actor userdata
---@param monname string
---@param level integer
---@return any
function createpet(actor,monname,level) end

---�޸�������ʱ���ԣ�����Ч�ڣ�
---*  actor: ��Ҷ���
---*  nWhere: λ�� ��Ӧcfg_att_score ����ID
---*  nValue: ��Ӧ����ֵ
---*  nTime: ��Чʱ�� ��
---@param actor userdata
---@param nWhere integer
---@param nValue integer
---@param nTime integer
---@return any
function changehumnewvalue(actor,nWhere,nValue,nTime) end

---����ƷΨһIDת���ɵ��߱����Ӧ��IDX��Ʒ
---*  actor: ��Ҷ���
---*  itemmakeid: ΨһID
---*  itemidx: 	����ID
---@param actor userdata
---@param itemmakeid integer
---@param itemidx integer
---@return any
function changeitemidx(actor,itemmakeid,itemidx) end

---��������������Ʒװ��������ɫ
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  color: ��ɫ(0-255)��ɫ=0ʱ�ָ�Ĭ����ɫ
---@param actor userdata
---@param item userdata
---@param color integer
---@return any
function changeitemnamecolor(actor,item,color) end

---�޸��������·����
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  looks: ���ֵ
---@param actor userdata
---@param item userdata
---@param looks integer
---@return any
function changeitemshape(actor,item,looks) end

---��������ȼ�
---*  actor: ��Ҷ���
---*  opt: ������ + - =
---*  count: ����
---@param actor userdata
---@param opt string
---@param count integer
---@return any
function changelevel(actor,opt,count) end

---�޸ı�������ֵ
---*  actor: ��Ҷ���
---*  mob: 	��������
---*  attr: ����λ��
---*  method: ������(+ - =)
---*  value: ����ֵ
---*  time: ��Чʱ��
---@param actor userdata
---@param mob userdata
---@param attr integer
---@param method string
---@param value integer
---@param time integer
---@return any
function changemobability(actor,mob,attr,method,value,time) end

---�ı�����ģʽ
---*  actor: ��Ҷ���
---*  mode: ģʽ1~24
---*  time: ʱ��(��)
---*  param1: ����1,12-13 18 20 21������ �����������ֵ
---*  param2: ����2 ��������ֵ
---@param actor userdata
---@param mode integer
---@param time integer
---@param param1? integer
---@param param2? integer
---@return any
function changemode(actor,mode,time,param1,param2) end

---�����������
---*  actor: ��Ҷ���
---*  id: ����ID 1-100
---*  opt: 	������ + - =
---*  count: ����
---*  msg: ��ע����
---*  send: �Ƿ����͵��ͻ���
---@param actor userdata
---@param id integer
---@param opt string
---@param count integer
---@param msg? string
---@param send? boolean
---@return any
function changemoney(actor,id,opt,count,msg,send) end

---�޸ı�������
---*  mon: ��������
---*  name: ��������
---@param mon userdata
---@param name string
---@return any
function changemonname(mon,name) end

---�޸�����������ɫ
---*  actor: ��Ҷ���
---*  color: ��ɫ����
---@param actor userdata
---@param color integer
---@return any
function changenamecolor(actor,color) end

---�޸ı����ȼ�
---*  actor: ��Ҷ���
---*  mon: ��������
---*  opt: ������ + - =
---*  nLevel:�ȼ�
---@param actor userdata
---@param mon userdata
---@param opt string
---@param nLevel integer
---@return any
function changeslavelevel(actor,mon,opt,nLevel) end

---�ı�����ٶ�
---*  actor: ��Ҷ���
---*  type: �ٶ����� 1-�ƶ��ٶ� 2-�����ٶ� 3-ʩ���ٶ�
---*  level: �ٶȵȼ� -10~100-ԭʼ�ٶȣ�-1ʱ��������10%+1ʱ��������10%
---@param actor userdata
---@param type integer
---@param level integer
---@return any
function changespeed(actor,type,level) end

---�½����ֿ����
---*  actor: ��Ҷ���
---*  nCount: �½����ĸ�����
---@param actor userdata
---@param nCount integer
---@return any
function changestorage(actor,nCount) end

---�������Ƿ񴴽�
---*  nIdx: ����ID
---@param nIdx integer
---@return any
function checkation(nIdx) end

---����Ӣ������
---*  actor: ��Ҷ���
---*  name: Ӣ������
---@param actor userdata
---@param name string
---@return any
function checkheroname(actor,name) end

---��� ��/���� ״̬
---*  object: ���/���� ����
---*  type: ���� ��˵����
---@param object userdata
---@param type integer
---@return any
function checkhumanstate(object,type) end

---��⵱ǰ�����Ƿ��ڿ���ĵ�ͼ
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function checkkuafu(actor) end

---����������Ƿ���������
---@return any
function checkkuafuconnect() end

---��⵱ǰ�������Ƿ�Ϊ���������
---@return any
function checkkuafuserver() end

---��⾵���ͼ�Ƿ����
---*  MapId: ��ͼID
---@param MapId string|integer
---@return any
function checkmirrormap(MapId) end

---���������
---*  actor: ��Ҷ���
---*  nIdx: ���ұ�� 0~100 0����û�м������
---@param actor userdata
---@param nIdx integer
---@return any
function checknational(actor,nIdx) end

---��������������
---*  actor: ��Ҷ���
---*  sFlag: �ȽϷ� =<>
---*  iValue: 	����
---@param actor userdata
---@param sFlag string
---@param iValue integer
---@return any
function checknationhumcount(actor,sFlag,iValue) end

---���װ����Ԫ������
---*  actor: ��Ҷ���
---*  where: װ��λ�ã�-1-OK���е�װ�� 0~55-���ϵ�װ��
---*  iAttr: ����
---*  sFlag: �ȽϷ�=<>
---*  iValue: ��ֵ(1-100)���ٷֱ�
---@param actor userdata
---@param where integer
---@param iAttr integer
---@param sFlag string
---@param iValue integer
---@return any
function checknewitemvalue(actor,where,iAttr,sFlag,iValue) end

---�Ƿ�������
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function checkonhorse(actor) end

---��ⷶΧ�ڹ�������
---*  actor: ��Ҷ���
---*  monName: ��������Ϊ�� or * Ϊ������й�
---*  nx: ����X
---*  ny: ����Y
---*  nRange: ��Χ
---@param actor userdata
---@param monName string
---@param nx integer
---@param ny integer
---@param nRange integer
---@return any
function checkrangemoncount(actor,monName,nx,ny,nRange) end

---���ʰȡС����
---*  actor: ��Ҷ���
---*  monName: ��������,Ϊ�� ����ȫ��
---@param actor userdata
---@param monName string
---@return any
function checkspritelevel(actor,monName) end

---�������ƺ�
---*  actor: ��Ҷ���
---*  title: �ƺ�
---@param actor userdata
---@param title string
---@return any
function checktitle(actor,title) end

---ɾ���ӳ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function cleardelaygoto(actor) end

---�����Զ���ȫ�ֱ���
---*  varName: ������, * -���б���
---@param varName string
---@return any
function clearglobalcustvar(varName) end

---�����Զ����л����
---*  guild: �л�����,* -�����л�
---*  varName: ������,* -���б���
---@param actor string
---@param varName string
---@return any
function clearguildcustvar(actor,varName) end

---��������Զ������
---*  actor: Ҫ������������ ���� * ��ʾ�����������
---*  varName: ������,* -���б���
---@param actor userdata|string
---@param varName string
---@return any
function clearhumcustvar(actor,varName) end

---������Ʒ�Զ�������
---*  actor: ��Ҷ���
---*  item: ��Ʒ����
---*  group: ���-1 ������ 0~5��Ӧ���
---@param actor userdata
---@param item userdata
---@param group integer
---@return any
function clearitemcustomabil(actor,item,group) end

---�����ͼ��ָ�����ֵ���Ʒ
---*  MapId: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  range: ��Χ
---*  itemName: ��Ʒ��
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param itemName string
---@return any
function clearitemmap(MapId,X,Y,range,itemName) end

---ˢ��
---*  mapid: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  monname: ��������
---*  range: ��Χ
---*  count: ����
---*  color: ��ɫ(0~255)
---@param mapid integer|string
---@param X integer
---@param Y integer
---@param monname string
---@param range integer
---@param count integer
---@param color? integer
---@return any
function genmon(mapid,X,Y,monname,range,count,color) end

---ˢ��
---*  mapid: ��Ҷ���
---*  X: X����
---*  Y: Y����
---*  monname: ��������
---*  range: ��Χ
---*  count: ����
---*  color: ��ɫ(0~255)
---@param mapid integer|string
---@param X integer
---@param Y integer
---@param monname string
---@param range integer
---@param count integer
---@param owner? integer|userdata
---@param color? integer
---@param showName? string
---@param isFilt? integer
---@return any
function genmonex(mapid,X,Y,monname,range,count,owner,color,showName,isFilt) end


---ͨ���ַ������Ӷ�Ӧ����ֵ(����cfg_equip.xls�����ֶ�)
---*  actor: ��Ҷ���
---*  attridx: �Զ�������������
---*  opt: ������ +��-��=
---*  attrStr: �����ַ���(3#1#100|3#2#100|3#3#10|3#4#10)
---*  type: 0���=������װ�������� 1=���ӹ̶�ֵ;��������װ����(���Լӳ�����Ч)
---@param actor userdata
---@param attridx string
---@param opt string
---@param attrStr string
---@param type? integer
---@return any
function addattlist(actor,attridx,opt,attrStr,type) end

---����ַ�������
---*  actor: ��Ҷ���
---*  attridx: �Զ�������������
---@param actor userdata
---@param attridx string
---@return any
function delattlist(actor,attridx) end

---�Ѱ����е���Ʒ�����Զ���OK����
---*  actor: ��Ҷ���
---*  itemName: ��Ʒ����
---*  idx: OK����(0~99)
---@param actor userdata
---@param itemName string
---@param idx integer
---@return any
function bagitemintobox(actor,itemName,idx) end

---���Զ���OK����Ʒ���ص�����
---*  actor: ��Ҷ���
---*  idx: OK����(0~99)
---@param actor userdata
---@param idx integer
---@return any
function returnboxitem(actor,idx) end

---ɾ���Զ���OK���е���Ʒ
---*  actor: ��Ҷ���
---*  idx: OK����(0~99)
---*  num: ɾ������;����ֻ���ǵ�����Ʒʱ�Ż���Ч��Ϊ����ȫ��ɾ��
---@param actor userdata
---@param idx integer
---@param num integer
---@return any
function delboxitem(actor,idx,num) end

---���Զ���OK����Ʒ���ص�����
---*  actor: ��Ҷ���
---*  idx: OK����(0~99)
---@param actor userdata
---@param idx integer
---@return any
function getboxitem(actor,idx) end

---�����л�
---*  role_name: ��Ҷ���
---*  guild_name: �л���
---@param role_name userdata
---@param guild_name integer
---@return any
function addguildmember(role_name,guild_name) end

---�˳��л�
---*  any: ��Ҷ���/�����/ΨһID
---*  guild_name: �л���
---*  type: 0 = ����1����Ҷ���;1 = ����1���������;2 = ����1�����ΨһID;
---@param any userdata
---@param guild_name userdata
---@param type integer
---@return any
function delguildmember(any,guild_name,type) end

---��ȡ��Ʒ�־ö�
---*  actor: ��Ҷ���
---*  itemmakeid: ΨһID
---@param actor userdata
---@param itemmakeid integer
---@return any
function getdura(actor,itemmakeid) end

---��ȡ�����ȼ�
---*  monobj: ��������
---@param monobj userdata
---@return any
function getslavelevel(monobj) end

---�ж���Ʒ�Ƿ�Ʒ
---*  itemobj: ��Ʒ����
---@param itemobj userdata
---@return any
function isitemjp(itemobj) end

---�ж��Ƿ�Ӣ��
---*  object: ��ѯ����
---@param actor userdata
---@return any
function ishero(actor) end

---�ж��Ƿ񱦱�
---*  object: ��ѯ����
---@param object userdata
---@return any
function ismob(object) end

---�ж��Ƿ����
---*  object: ��ѯ����
---@param object userdata
---@return any
function ismon(object) end

---�ж��Ƿ����
---*  object: ��ѯ����
---@param object userdata
---@return any
function isplayer(object) end

---�ж��Ƿ����ι�
---*  object: ��ѯ����
---@param object userdata
---@return any
function isplaymon(object) end

---�ж�LUA�ļ��Ƿ����
---*  path: LUA�ļ����·��
---@param path string
---@return any
function luafileexist(path) end

---�ж�LUA�ļ��Ƿ����
---*  path: LUA�ļ����·��
---@param path string
---@return any
function mongenex(path) end


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getsys(actor) end

---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function postgifttype(actor) end

---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function sendboxtype(actor) end

---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function setitembyjson(actor) end

---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getattlist(actor) end

---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getcsvbyhl(actor) end

---δ֪�ӿ�
---*  actor: ��Ҷ���
---@param actor userdata
---@return any
function getgiftlist(actor) end