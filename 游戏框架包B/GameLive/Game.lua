--��Ϸ���ƽű�����ܣ�����GamePainter������л��ƺͱ��
--�ű��б��뺬��GameLoop()������ÿ��һ��ʱ������GamePainter������һ��
--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
package.path = package.path..";GameLive/?.lua;"
require("Painter") --GamePainter���ݵ�C������
require("State")   --״̬��
require("Define") --ȫ�ֳ���/����
require("World")  --���������
require("Animation") --������
require("UI")   --�������
require("Life")    --���������
require("Legend") --��ɫ����
require("NPC")   --NPC����
--------------------------------------------
require("Me") --���ǻ���
require("Monster") --Ұ����
require("Mumu")  --Ұ�ְ�ľľ
require("Bear")     --Ұ�ֱ�����
require("NPCs")
require("Map")     --��ͼ�ļ�
require("Button")
require("TextBox")
require("Board")
------��ܳ���
function GameInit()
  require("Res")
  Painter.setCanvas(WIDTH,HEIGHT)
  Painter.setTextColor(RGB(170,160,150))
  Painter.setBrush(RGB(123,125,200))

------------��������Ԫ��-------------------
  map=Map:new("GameRes/Image/������b.jpg",-349,-1225,3800,2438)
  world:add(map)
  world:add(Bear:new(904,1089))
  world:add(MuMu:new(126,2137))
  world:add(FoodSaler:new(803,1637))
  MY_ID=world:add(Me:new(971,1728))
 -- world:add(Board:new(200,395))

  Painter.playMusic(Res.MUSIC_SUMMER);--��������
end

function GameLoop() --��Ϸ��ѭ�����������뺬��
  Painter.drawSolidRect(0,0,1200,600,RGB(255,255,123))
  for k,obj in pairs(world.Active) do
     obj:update()
  end
  MYSTATE.attacking=0
  Painter.updateCanvas()
end

function OnLDown(x,y) --����������
    for k,obj in pairs(world.Active) do
	if obj.onLDown then
     obj:onLDown(x,y)
	 end
    end
end

function OnLUp(x,y)
    for k,obj in pairs(world.Active) do
	if obj.onLUp then
     obj:onLUp(x,y)
	 end
  end
end

function OnMouseMove(x,y)  --Ϊ������Ч�ʣ��������ֱ�Ӵ�������ƶ���Ϣ
   MX=x
   MY=y
end

function OnRDown(x,y) --����Ҽ�����
    for k,obj in pairs(world.Active) do
	if obj.onRDown then
     obj:onRDown(x,y)
	 end
   end
end

function OnLDoubleClick(x,y) --������˫��

end

function OnMouseWheel(x,y,nDelta) --����ֹ���

end

function OnVKeyDown(nKey,nRep) --���������

end

function OnCKeyDown(nKey,nRep) --�ַ�������
   for k,obj in pairs(world.Active) do
      if obj.onCKeyDown then
	     obj:onCKeyDown(nKey,nRep)
	  end
   end
end







