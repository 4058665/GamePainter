--��Ϸ����֮һ
--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
Me=Legend:new()

function Me:new(x,y)
  local obj={}
  self.wx=x
  self.wy=y
   local image={}
   image[1]={}
   image[1].ID=Res.HERO_STANDL
   image[1].F=4 --֡��
   image[1].FW=200 --ÿ֡���
   image[2]={}
   image[2].ID=Res.HERO_STANDR
   image[2].F=4 --֡��
   image[2].FW=200 --ÿ֡���
   image[3]={}
   image[3].ID=Res.HERO_RUNL
   image[3].F=6 --֡��
   image[3].FW=200 --ÿ֡���
   image[4]={}
   image[4].ID=Res.HERO_RUNR
   image[4].F=6--֡��
   image[4].FW=200 --ÿ֡���
   image[5]={}
   image[5].ID=Res.HERO_RUNU
   image[5].F=6--֡��
   image[5].FW=200 --ÿ֡���
   image[6]={}
   image[6].ID=Res.HERO_RUND
   image[6].F=6--֡��
   image[6].FW=200 --ÿ֡���
   image[7]={}
   image[7].ID=Res.HERO_RUNUL
   image[7].F=6 --֡��
   image[7].FW=200 --ÿ֡���
   image[8]={}
   image[8].ID=Res.HERO_RUNUR
   image[8].F=6--֡��
   image[8].FW=200 --ÿ֡���
   image[9]={}
   image[9].ID=Res.HERO_RUNDL
   image[9].F=6--֡��
   image[9].FW=200 --ÿ֡���
   image[10]={}
   image[10].ID=Res.HERO_RUNDR
   image[10].F=6--֡��
   image[10].FW=200 --ÿ֡���
   self.animation=Animation:new(image)
   self.animation.dx=100
   self.animation.dy=85
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

