 --Ұ�ְ�ľľ
 --����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
MuMu=Monster:new()
function MuMu:new(x,y)
  local obj={}
   self.speed=5
   self.wx=x
   self.wy=y
   local image={}
   image[1]={}
   image[1].ID=Res.MON_MUMUL
   image[1].F=8 --֡��
   image[1].FW=80 --ÿ֡���
   image[2]={}
   image[2].ID=Res.MON_MUMUR
   image[2].F=8 --֡��
   image[2].FW=80 --ÿ֡���
   self.animation=Animation:new(image)
   self.animation.frameDelay=3
   setmetatable(obj,self)  --�½�����
   self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

