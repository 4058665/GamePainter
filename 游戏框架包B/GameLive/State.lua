--״̬������
State={}

function State:new()
  local obj={}
  obj.life=100  --����ֵ
  obj.level=1    --�ȼ�
  obj.power=10  --������
  obj.defense=10 --������
  obj.attacking=0  --�Ƿ��ڹ���״̬
  obj.range=50   --������Χ
  obj.frequency=1 --ÿ�빥������

  setmetatable(obj,self)
  self.__index=self
  return obj
end
