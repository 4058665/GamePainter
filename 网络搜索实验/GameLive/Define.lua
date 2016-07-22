------ȫ����-------
--���ڿ��--
WIDTH=1000
HEIGHT=665
--������--
NORTH=1
SOUTH=2
WEST=3
EAST=4
NORTHWEST=5
NORTHEAST=6
SOUTHWEST=7
SOUTHEAST=8
--��ѧ����--
PI=3.1415927    --Բ����
EPI=0.392699    --�˷�֮һPI
RAD=0.017453  --1���ȵĶ���

MX=0
MY=0
------ȫ�ֺ���-------
function RGB(r,g,b)       --�ϳ�RGB
  local c=r+g*256+b*65536
  return c
end

function IN_BOX(x,y,lx,ly,w,h)
   if x>lx and x<lx+w then
      if y>ly and y<ly+h then
         return 1
       end
    end
    return 0
end

function DIRECTION(x0,y0,x,y)
    local sita=0
    if x>x0 and y<y0 then
        sita=math.atan((y0-y)/(x-x0))
        if sita<EPI then
           return EAST
         end
         if sita>EPI and sita<3*EPI then
            return NORTHEAST
         end
         return NORTH
    end

    if x<x0 and y<y0 then
        sita=math.atan((y0-y)/(x0-x))
        if sita<EPI then
           return WEST
         end
         if sita>EPI and sita<3*EPI then
            return NORTHWEST
         end
         return NORTH
    end

    if x<x0 and y>y0 then
        sita=math.atan((y-y0)/(x0-x))
        if sita<EPI then
           return WEST
         end
         if sita>EPI and sita<3*EPI then
            return SOUTHWEST
         end
         return SOUTH
    end
    if x>x0 and y>y0 then
        sita=math.atan((y-y0)/(x-x0))
        if sita<EPI then
           return EAST
         end
         if sita>EPI and sita<3*EPI then
            return SOUTHEAST
         end
         return SOUTH
    end
end

--����Դ����Ȩ����������������ҵ������Ϸ����     ������2015
