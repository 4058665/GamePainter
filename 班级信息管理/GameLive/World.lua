--����ʱ�������������������

World={}

function World:new()
   local obj={}
   obj.Active={}--������
   obj.focus=nil --��ǰ�������
   obj.nID=0   --��ǰID
   setmetatable(obj,self)
   self.__index=self
   return obj
end

function World:add(obj)
   self.nID=self.nID+1
   self.Active[self.nID]=obj
end

--ͨ������ָ��ɾ������
function World:del(obj)
	 for k,v in pairs(self.Active) do
	    if v==obj then
           table.remove(self.Active,k)
		   self.nID=self.nID-1
		end
	 end
end

function World:release()
   for i=1,self.nID do
      self.Active:remove(i)
   end
end

 world=World:new() --����ȫ���������������

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015
