charH=13  --�ָ�
charW=13
btnX=302
btnY=190

function chineseSub(str,i,j) --���ִ���ȡ��GB����
 local start=2*(i-1)+1
  return str:sub(start,2*j)
end

TextBox=UI:new()  --�ı�����
function TextBox:new(x,y,text)
  local obj={}
  obj.x=x
  obj.y=y
  obj.wx=x-WX
  obj.wy=y-WY
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
  obj.imgID=Res.BOX_TEXT   --Ĭ�϶Ի��򱳾�
  obj.width=380
  obj.height=240
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function TextBox:draw()
	local i=1  --������
	local j=0  --����
    if self.lock==1 then
       self.x=self.wx+WX
       self.y=self.wy+WY
    end
	Painter.drawImage(self.imgID,self.x,self.y,0,0)
	while i<self.len do
	   if i+self.lineChars <self.len  then
          Painter.drawText(self.x+self.textX,j*charH+self.y+self.textY,chineseSub(self.text,i,i+self.lineChars))
		  j=j+1  --����
		else
          Painter.drawText(self.x+self.textX,j*charH+self.y+self.textY,chineseSub(self.text,i,self.len))
		end
		i=i+self.lineChars
	end
	for k,v in pairs(self.child) do
	   v.x=self.x+v.rx
	   v.y=self.y+v.ry
       v:draw()
     end
end

function TextBox:onLDown(x,y)
    for k,v in pairs(self.child) do
       v:onLDown(x,y)
    end
    if IN_BOX(MX,MY,self.x,self.y,self.width,self.height)==1 then
     self.mDown=1
	 self.mx=x
	 self.my=y
	 self.ox=self.x
	 self.oy=self.y
	 end
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



