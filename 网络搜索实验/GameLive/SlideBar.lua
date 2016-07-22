require("UI")
SlideBar=UI:new()

function SlideBar:new(x,y)
  local obj={}
  obj.x=x
  obj.y=y
  obj.pathX=x+3
  obj.pathY=0

  obj.mx=0  --���������µ�λ��
  obj.my=0
  obj.ox=0   --����������ʱ�ؼ�λ��
  obj.oy=0

  obj.imgID=Res.SLIDER   --Ĭ�϶Ի��򱳾�
  obj.width=49
  obj.height=51
  
  obj.onSlide={}  --�ص�����
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function SlideBar:draw() 
    --Painter.drawImage(Res.SLIDER_PATH,self.pathX,self.pathY,0,0)   
    Painter.drawImage(self.imgID,self.x,self.y,(self.frame-1)*self.width,self.width)
end

function SlideBar:onLDown(x,y)
    if IN_BOX(MX,MY,self.x,self.y,self.width,self.height)==1 then
     self.mDown=1
	 self.mx=x
	 self.my=y
	 self.ox=self.x
	 self.oy=self.y
	 end
end

function SlideBar:change() --״̬�ı�
    for k,v in pairs(self.child) do
       v:change()
    end
    if self.mDown==1 then
       --self.x=MX-self.mx+self.ox
       self.y=MY-self.my+self.oy
	   self.onSlide(self.y)
	end
end