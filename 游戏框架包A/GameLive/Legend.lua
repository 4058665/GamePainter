--��Ϸ���ǵĻ��࣬�������ɶ�����Ҽ��Ȳ����Ĵ���
require("Life")
require("Timer")

Legend=Life:new() --ÿһ����ɫ������һ������
function Legend:new()
  local obj={}
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function Legend:onRDown(x,y) --��Ӧ�Ҽ�����
    self.mx=x-WX --���°������ʱ������λ��
    self.my=y-WY
    self.direction=DIRECTION(self.x,self.y,x,y)
    if self.direction==EAST then
      self.animation:setImage(2)
    elseif self.direction==WEST then
      self.animation:setImage(4)
    end
    self.walking=1
	self.timer:enable(2)  --��1��ʱ��
	self.timer:enable(1)  --��2��ʱ��
end

--�հ�ʱ�Ӻ���(���ñհ��Ƿ����ⲿ����self����)
function Legend:timer1() --�л�Ϊ��ֹ̬
	return function()  
	    self.animation:setImage(1)    
	end
end

function Legend:timer2() --����
	return function()  
	    if self.animation.actImage==2 or self.animation.actImage==4 then  
	      self:findRoute()
        end		  
	end
end

function  Legend:timer3()
	return function()
	     MYSTATE.attacking=0
		 self.animation:setImage(1)
	end
end

function Legend:change() --״̬�ı�
    HX=self.x  --����������Ļλ�ø�ȫ��
    HY=self.y 
	self.timer:doTimer()
end

function Legend:findRoute()  --Ѱ·����
    if self.direction==EAST then
     self.wx=self.wx+self.speed
    elseif self.direction==WEST then
     self.wx=self.wx-self.speed
     elseif self.direction==NORTH then
     self.wy=self.wy-self.speed/2
     elseif self.direction==SOUTH then
     self.wy=self.wy+self.speed/2
    end
end

function Legend:onCKeyDown(nKey,nRep) --�ַ�������
   if nKey==65 then   --����A��
        MYSTATE.atkX=self.x+142   --���¹�����λ��
		MYSTATE.atkY=self.y+77 
		MYSTATE.attacking=1
        self.animation:setImage(3)
		self.timer:enable(3)
    end
end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015
