NPC=Life:new() --������ɫ�Ļ���
--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
function NPC:new()
  local obj={}
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function NPC:onRDown(x,y)
     if self:near(x,y)==1 then
       slef:storyBegin()
     end
end

function NPC:onLDown(x,y)  --NPC��Ӧ�������
    if self:near(x,y)==1 then
       self:storyBegin()
   end
end


function NPC:change() --״̬�ı�

end
