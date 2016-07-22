--��ͼ����
--����Դ����Ȩ����������������ҵ������Ϸ����     ������201self.speed
Map={}
function Map:new(imagePath,x,y,w,h)
    local obj={}
	obj.ID=-1           --����������������е�ID
	obj.x=x   --��ͼ���
	obj.y=y
	obj.imageID=Painter.addJPG(imagePath)
	obj.width=w
	obj.height=h
	obj.speed=6
	obj.haveMask=0 --��������
	obj.maskID=-1 --����ͼID
    setmetatable(obj,self)  --�½�����
    self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
    return obj
end

function Map:loadMask(imagePath) --���·������
   self.maskID=Painter.addImage(imagePath)
   self.haveMask=1
end

function Map:update()  --����״̬
    self:change()
    self:draw()
end

function Map:draw()
   Painter.drawImage(self.imageID,self.x,self.y,0,0)  --���Ƶؾ�
end

function Map:change()
   WX=self.x
   WY=self.y
   if  HX>2*WIDTH/3 then
        if self.width+self.x-self.speed>WIDTH then
		   self.x=self.x-self.speed
		else
		   self.x=WIDTH-self.width
		end
   elseif HX<WIDTH/4 then
        if self.x+self.speed<0 then
		   self.x=self.x+self.speed
		else
		   self.x=0
		end
   end

   if  HY>2*HEIGHT/3 then
        if self.height+self.y-self.speed>HEIGHT then
		   self.y=self.y-self.speed
		else
		   self.y=HEIGHT-self.height
		end
   elseif HY<HEIGHT/4 then
        if self.y+self.speed<0 then
		   self.y=self.y+self.speed
		else
		   self.y=0
		end
   end
end

function Map:maskCheck() --���ּ��

end

function Map:onRDown(x,y)

end

function Map:onLDown(x,y)

end

function Map:onLUp(x,y)

end
