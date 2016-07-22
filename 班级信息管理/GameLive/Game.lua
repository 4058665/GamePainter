--��Ϸ���ƽű�����ܣ�����GamePainter������л��ƺͱ��
--�ű��б��뺬��GameLoop()������ÿ��һ��ʱ������GamePainter������һ��
package.path = package.path..";GameLive/?.lua;"
package.cpath = package.cpath..";GameLive/?.dll;"
require("Painter") --GamePainter���ݵ�C������
require("Define") --ȫ�ֳ���/����
require("World")  --���������
require("SlideBar")
require("EditCtrl")
require("Button")
require("TextBox")
require("GridCard")
require("ClassCard")
require("Board")
------���������-------

g_Class={}  --�༶�����
g_InfoCard={}  --��Ϣ�����
g_RtnButton={}  --���ذ�ť
g_DelClassButton={}  --ɾ���༶��ť
g_NewCardButton={} --�½���ť
g_NewClassButton={}--�½��༶��ť
g_NameEdit={}  --���Ʊ༭��
g_Slider={}  --����
g_TitleBoard={}  --�����
g_InfoChange=false --�޸ı�־
g_DelClass=false
g_Info={} --��ǰ��Ϣ��
g_InfoPath=""--��ǰ��·��
function GameInit()  --��ʼ������(�ӿں���)
  require("Res")
  Painter.setCanvas(1280,720)
  Painter.setPen(RGB(20,100,220),2)
  Painter.setGameName("�װ���ͬѧ��")
  Painter.setCursor("GameRes/Cursor/blue.cur")
  Painter.playMusic(Res.MUSIC_SUMMER)
  Painter.setClock(80)
  --------------------------------------
    g_Slider=SlideBar:new(1225,40)
    g_TitleBoard=Board:new(500,20,"�༶��Ϣ������")
	g_NameEdit=EditCtrl:new(0,0,100,60)
	g_NameEdit.charH=25
    g_Slider.onSlide=function(y)  g_Class.y=-y+160 end
    g_Class=ClassCard:new(150,120,1000,1000)
	g_RtnButton=Button:new(960,650,0,0,"����")
	g_NewCardButton=Button:new(850,650,0,0,"�½�")
	g_NewCardButton.onClick=onNewCard
	g_NewClassButton=Button:new(950,650,0,0,"�½�")
	g_NewClassButton.onClick=onNewClass
	g_DelClassButton=Button:new(850,650,0,0,"�༭")
	g_DelClassButton.onClick=function()
	    if g_DelClass==true  then
		   g_DelClass=false
		   g_DelClassButton.text="�༭"
		else
		   g_DelClass=true
		   g_DelClassButton.text="���"
		end
	end
	g_RtnButton.onClick=function() 
	  if  g_Class.enable==0  then
        g_Slider.onSlide=function(y)  g_Class.y=-y+160 end
		 world:add(g_Class) 
		 g_Class.enable=1
		 world:add(g_NewClassButton)
		 world:add(g_DelClassButton)
		 world:del(g_InfoCard)
		 world:del(g_RtnButton)
		 world:del(g_NewCardButton)
		 if g_InfoChange==true then
		     Painter.beginThread(0,"saveThread")
		 end
	  end
     end
	 world:add(g_Slider)
	 world:add(g_Class)
	 world:add(g_TitleBoard)
	 world:add(g_NewClassButton)
	 world:add(g_DelClassButton)
end

function GameLoop() --��Ϸ��ѭ������(�ӿں���)
  Painter.drawImage(Res.BACK,0,0,0,0)
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

function OnCKeyDown(word,nRep) --�ַ�������(�ӿں���)
   for k,obj in pairs(world.Active) do
      if obj.onCKeyDown then
	     obj:onCKeyDown(word,nRep)
	  end
   end
end

Exiting=0 --�˳��ź�
function OnExit() --��������˳�ʱ(�ӿں���)
    Exiting=1
end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015






