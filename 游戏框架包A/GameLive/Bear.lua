--Ұ�ֱ�����
Bear=Monster:new()
function Bear:new(x,y)
  local obj={}
   self.wx=x
   self.wy=y
   local image={}
   image[1]={}
   image[1].ID=Res.MON_BEARL
   image[1].F=8 --֡��
   image[1].FW=81 --ÿ֡���
   image[1].dx=42
   image[1].dy=99  
   image[2]={}
   image[2].ID=Res.MON_BEARR
   image[2].F=8 --֡��
   image[2].FW=81 --ÿ֡���
   image[1].dx=37
   image[1].dy=99
   self.animation=Animation:new(image)
   self.animation.frameDelay=2  --֡�ظ�����
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function Bear:onLDown(x,y)
    if IN_BOX(x,y,self.x,self.y,80,80)==1 then
        local t=TextBox:new(self.x-200,self.y-120,"���ֵ�ζ���治��")
        t.imgID=Res.BOX_SAY
        t.lock=1
        t.width=244
        t.height=113
        t.textX=19
        t.textY=21
        world:add(t)
    end
end

--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
