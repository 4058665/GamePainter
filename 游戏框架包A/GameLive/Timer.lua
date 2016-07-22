--[[
���ģ��ϣ��ʵ������һ�ֻ��ƣ�
��Ϸ�������ط���Ҫ��ʱ���ܣ��簴���������ɫ��Ҫ�ں�ʱֹͣ�������ڵ������������Ч�����٣�NPC���೤ʱ����������һ�µȣ�
��ǰ�ҵ������ǰ���Щ����Ҳ�����д��һЩ��Ϣ��Ӧ�����У���onChange��onKeyDown���棬�����������е�ȷ�Եò��ɾ���ࣻ����
��΢�ܽ�һ�¹��Ժ󣬱���дһ����ʱ��ģ�飬������ͳһ������Щ�Ͷ�ʱ�йصĳ����
--]]

Timer={}

function Timer:new()  
    local obj={}
	obj.timerList={}   --��ʱ����
	obj.id=0
    setmetatable(obj,self)
	self.__index=self
	return obj
end	

function Timer:add(func,dt,rpt) --�����Ƕ�ʱ���򣬴���������ظ�����
    self.id=self.id+1
	local i=self.id
	self.timerList[i]={}
    self.timerList[i].process=func
	self.timerList[i].dt=dt
	self.timerList[i].rpt=rpt
	self.timerList[i].tm=0    --��ʱ
	self.timerList[i].cnt=0	--�ƴ�
	self.timerList[i].on=0    --����
end

function  Timer:doTimer()
   for k,v in pairs(self.timerList) do
       if  v.on==1 then
	      if  v.cnt>=v.rpt and v.rpt~=-1 then
		       v.on=0
	       elseif v.dt==v.tm  then --�������
		       v.process()
		       v.tm=0
		       v.cnt=v.cnt+1
		    else
		        v.tm=v.tm+1
		    end
		end
   end
end

function  Timer:enable(i)
	self.timerList[i].on=1    --��i�ż�ʱ��
	self.timerList[i].cnt=0
	self.timerList[i].tm=0	
end

function  Timer:disable(i)
	self.timerList[i].on=0    --�ر�i�ż�ʱ��
end


--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015