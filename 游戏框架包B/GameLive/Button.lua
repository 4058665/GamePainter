--��ť����
Button=UI:new()

function Button:new(x,y,rx,ry)
   local obj={}
	 obj.x=x  --��ͼ����
	 obj.y=y
     obj.rx=rx  --ƫ�����꣨�����ӿؼ���
     obj.ry=ry
     obj.frame=1
     obj.onClick={} --�ص�����
     obj.imgID=Res.BTN_CHECK
     obj.width=45
     obj.height=24
   setmetatable(obj,self)
   self.__index=self
   return obj
end

function Button:onLDown(x,y)
if IN_BOX(x,y,self.x,self.y,self.width,self.height)==1 then
    self.frame=2
    self.mDown=1
end
end

function Button:onLUp(x,y)
	self.mDown=0
	self.frame=1
if IN_BOX(x,y,self.x,self.y,self.width,self.height)==1 then
   self:onClick()
end
end

function Button:update()
    self:change()
	self:draw()
end

--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
