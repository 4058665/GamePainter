--��ť����
require("UI")
Button=UI:new()

function Button:new(x,y,rx,ry,text)
   local obj={}
	 obj.x=x  --��ͼ����
	 obj.y=y
     obj.rx=rx  --ƫ�����꣨�����ӿؼ���
     obj.ry=ry
	 obj.text=text or ""
     obj.imgID=Res.BUTTON2
	 obj.frame=1
	 obj.maxFrame=2
     obj.width=90
     obj.height=30
     obj.enable=1
	 obj.mDown=0
     obj.onClick=nil --�ص�����

     obj.child={}    --�ӿؼ���
     obj.nChild=0  --�ӿؼ�����
   setmetatable(obj,self)
   self.__index=self
   return obj
end
function Button:draw()
    Painter.setFont("΢���ź�",20)
	Painter.setTextColor(RGB(230,190,50))
    Painter.drawImage(self.imgID,self.x,self.y,(self.frame-1)*self.width,self.width)
	Painter.drawText(self.x+30,self.y+2,self.text)
end


function Button:onLDown(x,y)
if IN_BOX(x,y,self.x,self.y,self.width,self.height)==1 then
    if self.maxFrame>2 then
        self.frame=3
    end
    self.mDown=1
end
end

function Button:onLUp(x,y)
	self.mDown=0
	self.frame=1
	if IN_BOX(x,y,self.x,self.y,self.width,self.height)==1 then
	   if self.onClick then --�����������
	      self:onClick()
	   end
	end
end

function  Button:change() 
	if IN_BOX(MX,MY,self.x,self.y,self.width,self.height)==1 then
		if self.maxFrame>1 then
			self.frame=2
		end
	else
	     self.frame=1
	end
end

--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
