--����ʱ�������������������
--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
World={}

function World:new()
   local obj={}
   obj.Active={}--������
   obj.nID=0   --��ǰID
   setmetatable(obj,self)
   self.__index=self
   return obj
end

function World:add(obj)
   self.nID=self.nID+1
   table.insert(self.Active,self.nID,obj)
   obj.ID=self.nID
   return obj.ID  --��Щʱ�������Ҫ֪������ID
end

function World:del(id)
     table.remove(self.Active,id)
     self.nID=self.nID-1
end

function World:release()
   for i=1,self.nID do
      self.Active:remove(i) --�ȴ��������մ���
   end
end

 world=World:new() --����ʵ��
