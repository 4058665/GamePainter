NPC=Life:new() --������ɫ�Ļ���

function NPC:new()
  local obj={}
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function NPC:onLDown(x,y)  --NPC��Ӧ�������
    if self:near(x,y)==1 then
       self:storyBegin()
   end
end

function NPC:storyBegin()

end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015