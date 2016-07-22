--��Ϸ���ƽű�����ܣ�����GamePainter������л��ƺͱ��
--�ű��б��뺬��GameLoop()������ÿ��һ��ʱ������GamePainter������һ��
package.path = package.path..";GameLive/?.lua;"
require("Painter") --GamePainter���ݵ�C������
require("State")   --״̬��
require("Define") --ȫ�ֳ���/����
require("World")  --���������
require("Animation") --������
require("Number") --������
--------------------------------------------
require("Me") --���ǻ���
require("MuMu")
require("NPCs")
require("Map")     --��ͼ�ļ�
require("Button")
require("TextBox")
require("Board")
------��ܳ���

function GameInit()  --��ʼ������(�ӿں���)
  require("Res")
  Painter.setCanvas(WIDTH,HEIGHT)
  Painter.setTextColor(RGB(142,108,69))
  Painter.setBrush(RGB(123,125,200))
------------��������Ԫ��-------------------
  map=Map:new("GameRes/Image/Ұ��.jpg",0,0,2000,600)
  world:add(map)
  world:add(MuMu:new(400,400))
  world:add(FoodSaler:new(970,318))
  world:add(Me:new(206,400))
  Painter.playMusic(Res.MUSIC_SUMMER)
  Painter.setGameName("�ν���")
  Painter.setCursor("GameRes/Cursor/blue.cur")
end

function GameLoop() --��Ϸ��ѭ������(�ӿں���)
  Painter.drawSolidRect(0,0,1200,600,RGB(255,255,123))
  for k,obj in pairs(world.Active) do
     obj:update()
  end
  Painter.updateCanvas()
end

function OnLDown(x,y) --����������(�ӿں���)
    for k,obj in pairs(world.Active) do
	if obj.onLDown then
     obj:onLDown(x,y)
	 end
    end
end

function OnLUp(x,y)--�������ͷ�(�ӿں���)
    for k,obj in pairs(world.Active) do
	if obj.onLUp then
     obj:onLUp(x,y)
	 end
  end
end

--Ϊ������Ч�ʣ��������ֱ�Ӵ�������ƶ���Ϣ
function OnMouseMove(x,y)  --����ƶ���Ϣ(�ӿں���)
   MX=x
   MY=y
end

function OnRDown(x,y) --����Ҽ�����(�ӿں���)
    for k,obj in pairs(world.Active) do
	if obj.onRDown then
      obj:onRDown(x,y)
	 end
   end
end

function OnLDoubleClick(x,y) --������˫��(�ӿں���)

end

function OnMouseWheel(x,y,nDelta) --����ֹ���(�ӿں���)

end

function OnVKeyDown(nKey,nRep) --���������(�ӿں���)

end

function OnCKeyDown(nKey,nRep) --�ַ�������(�ӿں���)
   for k,obj in pairs(world.Active) do
      if obj.onCKeyDown then
	     obj:onCKeyDown(nKey,nRep)
	  end
   end
end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015






