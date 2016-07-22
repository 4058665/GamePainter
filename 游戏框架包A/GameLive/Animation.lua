--��������
--[[
�����ṹԼ����
�����imageΪͼƬ��Ϣ��ÿһ��ͼƬԪ����{ID,F,FW}���ʾ
����F��ͼƬ֡����FW��ÿ֡���
����д������Ϊ�˾����ܱ�����д�����������߳�
--]]
Animation={}

function Animation:new(image)  --����ͼ��ID��
    local obj={}
    obj.image=image
	obj.lock=0
	obj.actImage=1  --��ǰͼ������
	obj.actFrame=1 --��ǰ֡
	obj.frameDelay=1  --ÿ֡�ظ��������ɿ���֡��
	obj.frameTime=1   --��ǰ֡�ѻ�����
	setmetatable(obj,self)
	self.__index=self
	return obj
end

function Animation:lockFrame(frame)
   self.lock=1
   self.actFrame=frame
end

function Animation:show(x,y)
    local i=self.actImage
	local sx,sy=self:getFrameXY(self.actFrame)
	Painter.drawImageR(self.image[i].ID,x-self.image[i].dx,y-self.image[i].dy,sx,sy,self.image[i].FW,self.image[i].FH)
	if self.lock==0 then
	   if  self.frameTime<self.frameDelay then
	       self.frameTime=self.frameTime+1
	   else
	       if self.actFrame==self.image[i].XF*self.image[i].YF then
	          self.actFrame=1
	       else
		      self.actFrame=self.actFrame+1
	       end
		   self.frameTime=1
		end
	end
end

function Animation:getFrameXY(frame)
    local i=self.actImage
	local sx=self.image[i].FW*math.floor((frame-1)%self.image[i].XF)
	local sy=self.image[i].FH*math.floor((frame-1)/self.image[i].XF)
	return sx,sy
end

function Animation:setImage(i)
   if self.actImage~=i then
   self.actImage=i
   self.actFrame=1
   end
end

--����Դ������������ҵ������Ϸ����     ������2015

