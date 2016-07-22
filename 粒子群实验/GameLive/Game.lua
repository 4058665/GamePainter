--��Ϸ���ƽű�����ܣ�����GamePainter������л��ƺͱ��
--�ű��б��뺬��GameLoop()������ÿ��һ��ʱ������GamePainter������һ��
package.path = package.path..";GameLive/?.lua;"
require("Painter") --GamePainter���ݵ�C������
require("Define") --ȫ�ֳ���/����
require("World")  --���������
require("Atom")   --����ʵ��ģ��
------��ܳ���

function GameInit()  --��ʼ������(�ӿں���)
  require("Res")
  Painter.setCanvas(WIDTH,HEIGHT)
  Painter.setTextColor(RGB(20,100,255))
  --ˢ��Ƶ��(ms)��DT��Atom.lua�ļ��ж��壬��λ���룬����ʹˢ�¼���ͼ�������ͬ���Ա�֤�۲�ͬ��
  Painter.setClock(DT*1000) --Ҳ�ɲ����ã���Ĭ����10֡ÿ�룬��ʱ���DT����ѡ���С�Ա�֤���㾫�ȣ�ֻ�ǹ۲�ʱ�仯�����
------------��������Ԫ��-------------------
  world:add(Atom:new(500,400))

  Painter.playMusic(Res.MUSIC_SUMMER)
  Painter.setGameName("����ʵ��")
  Painter.setCursor("GameRes/Cursor/blue.cur")
end

function GameLoop() --��Ϸ��ѭ������(�ӿں���)
  Painter.drawSolidRect(0,0,WIDTH,HEIGHT,RGB(0,0,0)) --������ɫ
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






