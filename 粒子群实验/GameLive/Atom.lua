Atom={}
--Լ��������������Ϊ1
K_G=-100  --����ϵ��
K_R=100   --����ϵ��
DT=0.01           --ʱ����
COUNT=100

function Atom:new(x,y)
    local obj={}
	setmetatable(obj,self)
	self.__index=self
	obj.atoms={}
--[[	for i=1,100 do      --���������
	   obj.atoms[i]={}
	   obj.atoms[i].x=x+math.random(300) --�����Ƴ�300
	   obj.atoms[i].y=y+math.random(50)   --�����Ƹ�50
	   obj.atoms[i].fx=0  --��������
	   obj.atoms[i].fy=0
	   obj.atoms[i].vx=0 --�����ٶ�
	   obj.atoms[i].vy=0
	end
	 obj.atoms[1].x=615
	 obj.atoms[1].y=400--]]

 for i=1,4 do             --���򾧸�
	     for j=1,25 do
	   obj.atoms[i*25-25+j]={}
	   obj.atoms[i*25-25+j].x=x+(j-1)*20
	   obj.atoms[i*25-25+j].y=y+(i-1)*20
	   obj.atoms[i*25-25+j].fx=0  --��������
	   obj.atoms[i*25-25+j].fy=0
	   obj.atoms[i*25-25+j].vx=0 --�����ٶ�
	   obj.atoms[i*25-25+j].vy=0
		 end
	 end

	return obj
end

function Atom:update()
    self:Process()
	 for i=1,COUNT do
		    self.atoms[i].x=self.atoms[i].x+self.atoms[i].vx*DT  --λ����������£��Ա�֤�໥֮��ͬʱ����
		    self.atoms[i].y=self.atoms[i].y+self.atoms[i].vy*DT
		    Painter.drawImage(Res.ATOM,self.atoms[i].x,self.atoms[i].y,0,0,0,0)
	 end
end

function Atom:Process()
	 local fx,fy,dx,dy
	 local j
	 for i=1,COUNT do
	     j=1
		 self.atoms[i].fx=0
	     self.atoms[i].fy=0
		 while j<=COUNT do  --�����i�������ܵĺ���
		     if i~=j then
 	             dx=self.atoms[i].x-self.atoms[j].x
	             dy=self.atoms[i].y-self.atoms[j].y
                 fx,fy=self:WeiGuan(dx,dy)     --ѡ��һ�����Ӽ�������ģ�ʹ���
	             self.atoms[i].fx=self.atoms[i].fx+fx
	             self.atoms[i].fy=self.atoms[i].fy+fy
			 end
			 j=j+1
		 end
		 if i==1 then
		    --self:ExtForce()    --�༭��������������ɶ�һЩ����ʩ�Ӷ�����
		 end
	     self.atoms[i].vx=self.atoms[i].vx+self.atoms[i].fx*DT  --�����ٶȣ���������Ϊ1������f����a
	     self.atoms[i].vy=self.atoms[i].vy+self.atoms[i].fy*DT
	 end
end

------------������������½�һЩ�໥������ģ��------------------
function  Atom:TanLi(dx,dy) --����
   local fx=K_G*dx
   local fy=K_G*dy
   return fx,fy
end

function Atom:WeiGuan(dx,dy) --�����΢��������ĳ����Χ���ǳ�������֮������
     local  r=dx*dx+dy*dy
     if math.sqrt(r)>5 then
        return self:YinLi(dx,dy)
     else
        return self:ChiLi(dx,dy)
     end
end

function Atom:YinLi(dx,dy) --����
    local  r=dx*dx+dy*dy
	local fx=0
	local fy=0
	local c,s
	if r~=0 then
	    c=dx/math.sqrt(r)
		s=dy/math.sqrt(r)
		fx=K_G*c/r
		fy=K_G*s/r
	end
	return fx,fy
end

function Atom:ChiLi(dx,dy) --����
    local  r=dx*dx+dy*dy
	local fx=0
	local fy=0
	local c,s
	if r~=0 then
	    c=dx/math.sqrt(r)
		s=dy/math.sqrt(r)
		fx=K_R*c/r
		fy=K_R*s/r
	end
	return fx,fy
end

function Atom:ExtForce() --����
    self.atoms[1].fx=self.atoms[1].fx+0 --���������һ������ʩ�Ӻ���
	self.atoms[1].fy=self.atoms[1].fy+100
end
-----------------------------------------------------------------



