--���лԪ�صĻ���
--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
Life={}
function Life:new()
  local obj={}
  obj.ID=0           --����������������е�ID
  obj.x=0
  obj.y=0
  obj.wx=0
  obj.wy=0
  obj.animation={} --����Ķ���������
  obj.direction=WEST--����
  obj.timer=16    --������
  obj.life=100     --����ֵ
  obj.speed=0    --�ƶ��ٶ�
  obj.changed=0  --״̬�ı��־
  setmetatable(obj,self)  --�½�����
  self.__index=self   --���û���(Ԫ��)��__indexΪ����ʹ��������ɷ��������Ա
  return obj
end

function Life:update()  --�������£���Ա����
    self:transXY()
    self:change()
    self:draw()
end

function Life:draw()
    self.animation:show(self.x,self.y)
end

function Life:change()  --״̬���£��ɾ����ɫʵ��

end

function Life:transXY()  --����任�����������ڵ�ͼ,self.x�ǻ�ͼ���꣬self.wx���������꣩
    self.x=self.wx+WX
    self.y=self.wy+WY
end
function Life:onLDown(x,y)

end

function Life:onRDown(x,y)

end

function Life:onLUp(x,y)

end

