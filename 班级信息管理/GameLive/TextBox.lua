require("UI")

TextBox=UI:new()  --�ı�����
function TextBox:new(x,y,text)
  local obj={}
  obj.x=x
  obj.y=y
  obj.textX=89
  obj.textY=69
  obj.lineChars=16  --ÿ���ַ���
  obj.text=text
  obj.len=string.len(text)/2  --����
  obj.lock=0  --�Ƿ�̶�
  obj.mx=0  --���������µ�λ��
  obj.my=0
  obj.ox=0   --����������ʱ�ؼ�λ��
  obj.oy=0
  obj.child={}  --�ӿؼ���
  obj.imgID=Res.BOX1   --Ĭ�϶Ի��򱳾�
  obj.width=331
  obj.height=429
  obj.mDown=0
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function TextBox:draw()
    Painter.setFont("����",12)
    Painter.setTextColor(RGB(179,177,137)) 
	Painter.drawImage(self.imgID,self.x,self.y,0,0)
    Painter.drawTextR(self.text,self.x+20,self.y+20,self.x+self.width-20,self.y+self.height-20,0x2010)
	for k,v in pairs(self.child) do
	   v.x=self.x+v.rx
	   v.y=self.y+v.ry
       v:draw()
     end
end

function TextBox:onLDown(x,y)
    for i=1,#self.child do
       self.child[i]:onLDown(x,y)
    end
    if IN_BOX(MX,MY,self.x,self.y,self.width,self.height)==1 then
     self.mDown=1
	 self.mx=x
	 self.my=y
	 self.ox=self.x
	 self.oy=self.y
	 end
end

function TextBox:onLUp(x,y)
    for k,v in pairs(self.child) do
         v:onLUp(x,y)
    end
    self.mDown=0
end

function TextBox:change() --״̬�ı�
    for k,v in pairs(self.child) do
       v:change()
    end
    if self.mDown==1 then
       self.x=self.ox+MX-self.mx
       self.y=self.oy+MY-self.my
	end
end

--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015



