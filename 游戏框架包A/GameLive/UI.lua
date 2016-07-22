--���潻���ؼ��Ļ���
UI={}
function UI:new()
  local obj={}
  --����ı���ֻ��������Լ�����ã����������ϲ���Ӧ�����¶��壬�������������߼�����
  obj.mDown=0  --�������Ƿ���
  obj.imgID=-1
  obj.width=0
  obj.height=0
  obj.frame=1   --��ǰ֡
  obj.enable=1  --�ؼ��Ƿ����
  obj.child={}    --�ӿؼ���
  obj.nChild=0  --�ӿؼ�����
  obj.mx=0
  obj.my=0
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function UI:update()  --�������£���Ա����
if self.enable==1 then
    self:change()
    self:draw()
end
end

function UI:draw()
    Painter.drawImage(self.imgID,self.x,self.y,(self.frame-1)*self.width,self.width)
end

function UI:change()

end

function UI:onLDown(x,y)
    for k,v in pairs(self.child) do
       v:onLDown(x,y)
    end
    if IN_BOX(MX,MY,self.x,self.y,self.width,self.height) then
        self.mDown=1
    end
end

function UI:onLUp(x,y)
    for k,v in pairs(self.child) do
       v:onLUp(x,y)
    end
    self.mDown=0
end

function UI:onRDown(x,y)
    for k,v in pairs(self.child) do
       v:onRDown(x,y)
    end
end

function UI:addChild(obj)
   self.nChild=self.nChild+1
   self.child[self.nChild]=obj
end

--����Դ������������ҵ������Ϸ����     ������2015
