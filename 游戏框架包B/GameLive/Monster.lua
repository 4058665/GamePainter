--Ұ�ֺ͵��˵Ļ���
--����һ�������ƶ��Ķ���
--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
Monster=Life:new()
function Monster:new()
  local obj={}
  obj.state=State:new()
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function Monster:change() --�����ƶ�
      if self.timer>0 then
         self.timer=self.timer-1
         if self.direction==EAST then
            self.wx=self.wx+self.speed
         else
            self.wx=self.wx-self.speed
         end
      else
         self.timer=16
         if self.direction==EAST then
           self.direction=WEST
           self.animation:setImage(1)
         else
            self.direction=EAST
            self.animation:setImage(2)
         end
      end

      self:onAttacked()
end

function Monster:draw()
       self.animation:show(self.x,self.y)
       Painter.drawText(self.x+30,self.y-20,"����ֵ"..tostring(self.state.life))
end

function Monster:onAttacked()
   if MYSTATE.attacking==1 then
      self.state.life=self.state.life-MYSTATE.power
   end
end


