 --Ұ�ְ�ľľ
 require("Monster")
MuMu=Monster:new()
function MuMu:new(x,y)
  local obj={}
   self.speed=5  --��������
   obj.wx=x
   obj.wy=y
   local image={}
   image[1]={}
   image[1].ID=Res.MON_MUMUL
   image[1].XF=8 --֡��
   image[1].YF=1
   image[1].FW=80 --ÿ֡���
   image[1].FH=100
   image[1].dx=47
   image[1].dy=91
   image[2]={}
   image[2].ID=Res.MON_MUMUR
   image[2].XF=8 --֡��
   image[2].YF=1
   image[2].FW=80 --ÿ֡���
   image[2].FH=100
   image[2].dx=31
   image[2].dy=93
   obj.animation=Animation:new(image)
   obj.animation.frameDelay=3
   setmetatable(obj,self)  --�½�����
   self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015

