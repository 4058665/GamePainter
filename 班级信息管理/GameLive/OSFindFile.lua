--����dos����dir������Ŀ¼���������ʧ�ܣ�������IFSFindFileģ��
function  getAllFiles(path)
   info = io.popen("dir "..path.." /b")
   local fileArr={}
   local i
   for line in info:lines() do
       i=#fileArr+1
	   line=path..line
	   line=line:gsub("\\","/")
       fileArr[i]=line
   end
   return fileArr
end