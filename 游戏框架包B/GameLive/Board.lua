--�̶����ؼ�
Board=UI:new()

function Board:new(x,y)
    local obj={}
	self.x=x
	self.y=y
	obj.image={}
	obj.imgID=Res.BRD_TOOL
	obj.width=800
	obj.height=205
	obj.child={} --�ӿؼ���
	setmetatable(obj,self)
	self.__index=self
	return obj
end
