--��Ϸ���ǵĻ��࣬�����ֻ��ɶ�����Ҽ��Ĵ���
Legend=Life:new() --ÿһ����ɫ������һ������
function Legend:new()
  local obj={}
  obj.mx=0
  obj.my=0
  self.timer=0
  self.speed=10
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function Legend:onRDown(x,y) --��Ӧ�Ҽ�����
    self.mx=x-WX --���°������ʱ������λ��
    self.my=y-WY
    self.changed=1
    self.direction=DIRECTION(self.x,self.y,x,y)

  --���ݵ�ǰ����ѡ�񶯻�
    if self.direction==EAST  then
       self.animation:setImage(4)
    elseif self.direction==NORTH then
       self.animation:setImage(5)
    elseif self.direction==WEST then
       self.animation:setImage(3)
    elseif  self.direction==SOUTH then
       self.animation:setImage(6)
    elseif self.direction==NORTHEAST then
       self.animation:setImage(8)
    elseif self.direction==NORTHWEST then
       self.animation:setImage(7)
    elseif  self.direction==SOUTHEAST then
       self.animation:setImage(10)
    elseif self.direction==SOUTHWEST then
        self.animation:setImage(9)
    end
    self.timer=8;
end

function Legend:change() --״̬�ı�
    HX=self.x  --����������Ļλ�ø�ȫ��
    HY=self.y
    if self.timer>0 then
             self:findRoute()
             self.timer=self.timer-1
    else
          if self.direction==EAST then  --�ѵ���
          self.animation:setImage(2)
          else
          self.animation:setImage(1)
          end
          self.changed=0
    end
end

function Legend:findRoute()  --Ѱ·���ߣ���������Ч�����д��Ż��Ľ���
    local dv=self.speed*0.707
    if self.direction==EAST  then
       self.wx=self.wx+self.speed
    elseif self.direction==NORTH then
       self.wy=self.wy-self.speed
    elseif self.direction==WEST then
       self.wx=self.wx-self.speed
    elseif  self.direction==SOUTH then
       self.wy=self.wy+self.speed
    elseif self.direction==NORTHEAST then
       self.wx=self.wx+dv
       self.wy=self.wy-dv
    elseif self.direction==NORTHWEST then
       self.wx=self.wx-dv
       self.wy=self.wy-dv
    elseif  self.direction==SOUTHEAST then
       self.wx=self.wx+dv
       self.wy=self.wy+dv
    elseif self.direction==SOUTHWEST then
       self.wx=self.wx-dv
       self.wy=self.wy+dv
    end
end

function Legend:onCKeyDown(nKey,nRep)

end

--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
