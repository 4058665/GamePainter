require("NPC")
FoodSaler=NPC:new() --ʳƷ����
function FoodSaler:new(x,y)
    local obj={}
    obj.wx=x
    obj.wy=y
	obj.x=0
	obj.y=0
	obj.width=23
	obj.height=67
	local image={}
    image={}
    image[1]={}
    image[1].ID=Res.NPC_FOODSALER
    image[1].XF=4--֡��
    image[1].YF=1
    image[1].FW=80 --ÿ֡���
    image[1].FH=80
    image[1].dx=28
    image[1].dy=73
    obj.animation=Animation:new(image)
    obj.animation.frameDelay=2
    setmetatable(obj,self)
    self.__index=self  
    return obj
end

function FoodSaler:near(x,y)  --�ж�λ���Ƿ��ڽ�ɫ����
    if x>self.x-self.width/2 and x<self.x+self.width/2 then
        if y>self.y-self.height and y<self.y then
           return 1
        end
    end
    return 0
end

function FoodSaler:storyBegin()   --��������
     local t=TextBox:new(100,100,"�����Ŀڣ����������ɽ�����ȣ������Բ�")
     local b=Button:new(0,0,btnX,btnY)
     b.onClick=function() world:del(t) end
     t:addChild(b)
     world:add(t)
end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015
