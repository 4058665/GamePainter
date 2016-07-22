--��Ϸ���ƽű�����ܣ�����GamePainter������л��ƺͱ��
--�ű��б��뺬��GameLoop()������ÿ��һ��ʱ������GamePainter������һ��
package.path = package.path..";GameLive/?.lua;"
require("Painter") --GamePainter���ݵ�C������
require("Define") --ȫ�ֳ���/����
require("World")  --���������
require("Searcher")
require("SlideBar")
------���������-------
textX=200
textY=100
Exiting=0
text="��ǰδ�����κ������ı�"
timer=50

function thread1()
	urls={}
	urls[1]={}
	urls[1]="http://news.baidu.com"
	text="��������..."
	--SingleJump("http://www.sina.com.cn",3)
	MultiJump(urls,4)
	text="�������"
--[[
  while Exiting==0 do
     if timer==50 then
	     Search(nextURL,1)
		 timer=0
	 end
  end
  --]]
end

function GameInit()  --��ʼ������(�ӿں���)
  require("Res")
  Painter.setCanvas(1280,720)
  Painter.setTextColor(RGB(179,177,137))
  Painter.setPen(RGB(20,100,220),2)
  Painter.setGameName("����ʵ��")
  Painter.setCursor("GameRes/Cursor/blue.cur")
  Painter.playMusic(Res.MUSIC_SUMMER)
  --Painter.setNetOption(1000,1000,1000,2)   --�����������������ʳ�ʱ�ȴ����ظ�������Ĭ����5s/1��
  --------------------------------------
  local slider=SlideBar:new(1230,30)
  slider.onSlide=function(y)  textY=-y*10+380 end
  world:add(slider)
  Painter.beginThread(0,"thread1")--���������߳�
 -- Painter.getNetFile("http://www.baidu.com","C://baidu.html") --���ز������ļ�
end

function GameLoop() --��Ϸ��ѭ������(�ӿں���)
  Painter.drawImage(Res.BACK,0,0,0,0)
  for k,obj in pairs(world.Active) do
     obj:update()
  end

  --timer=timer+1
  Painter.drawTextR(g_curPage,textX+100,textY+80,textX+850,1000,0x2010)
  Painter.drawTextR(g_keywordURLs,0,textY+90,300,1000,0x2010)
  Painter.drawText(0,textY,text)
  Painter.drawText(0,textY+30,"��ǰURL: "..g_nowURL.."  ��һ��URL:"..g_nextURL)
  Painter.drawText(0,textY+60,"ͳ�ƽ��: ����"..g_keyWord.."�Ĵ���Ϊ"..tostring(g_wordStatistics))

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
	      textY=textY+nDelta
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

function OnExit() --��������˳�ʱ(�ӿں���)
    Exiting=1
end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015






