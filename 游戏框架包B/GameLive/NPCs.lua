FoodSaler=NPC:new() --������
function FoodSaler:new(x,y)
   local obj={}
    self.wx=x
    self.wy=y
   local image={}
   image[1]={}
   image[1].ID=Res.NPC_FOODSALER
   image[1].F=4--֡��
   image[1].FW=80 --ÿ֡���
   self.animation=Animation:new(image)
   self.animation.frameDelay=2
   setmetatable(obj,self)  --�½�����
   self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
   return obj
end

function FoodSaler:near(x,y)  --�ж�λ���Ƿ��ڽ�ɫ����
    if x>self.x and x<self.x+50 then
        if y>self.y and y<self.y+50 then
           return 1
        end
    end
    return 0
end

function FoodSaler:storyBegin()   --��������
     local t=TextBox:new(100,100,"�����Ŀڣ����������ɽ�����ȣ������Բ�")
     local b=Button:new(0,0,btnX,btnY)
     b.onClick=function() world:del(t.ID) end
     t:addChild(b)
     world:add(t)
end

