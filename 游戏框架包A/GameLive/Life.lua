--���лԪ�صĻ���
--���ڴ�������Զ������й����ԣ���������Lifeֻ���в��ַ����ϵĹ淶
--[[
������Լ��
x,y      ��Ļ����(��������ʾ����Ļ�׼�㣬һ��ѡ��������λ��)
wx,wy ��������(��Ա�����ͼ��)
animation  ����Ķ����������
��Life�����Ķ������ٰ�����Щ����
]]

Life={}
function Life:new()
  local obj={}
--[[
  obj.x=0     --����ı���ֻ��������Լ�����ã����������ϲ���Ӧ�����¶��壬�������������߼�����
  obj.y=0     --����ʹ�÷�����ο������������Life������ģ�飬�Ա���Ϥ����ģʽ
  obj.wx=0
  obj.wy=0
  obj.animation={}
--]]
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function Life:update()  --��������
    self:transXY()
    self:change()
    self:draw()
end

function Life:draw() --����ͼ��
    self.animation:show(self.x,self.y)
end

function Life:change()  --״̬���£��ɾ����ɫʵ��

end

function Life:transXY()  --����任�����������ڵ�ͼ,self.x����Ļ���꣬self.wx���������꣩
    self.x=self.wx+WX
    self.y=self.wy+WY
end

function Life:onLDown(x,y)

end

function Life:onRDown(x,y)

end

function Life:onLUp(x,y)

end

--����Դ ������������ҵ����
--��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�       ������2015
