g_keyWord="www"  --��������
g_wordStatistics=0  --�ؼ��ʳ��ִ���
g_keywordURLs="���Ϸ�����������ַ��:\r\n"  --���ֹ��ؼ��ʵ���ַ
g_curPage={} --��ǰҳ����ı�
g_nextURL="δ���ô˱���"
g_nowURL="δ���ô˱���"
g_urlPattern="http://www*%.%w*%.%a*"
function  AnalysePage(url,text) --������Ҫ������ҳ�ı�text�������ʾ��ֻ��ͳ�ƹؼ��ʳ��ֵĴ���
	 local inPage=false
	 for word in string.gfind(text,g_keyWord) do
          g_wordStatistics=g_wordStatistics+1
		  inPage=true
     end
	 if inPage==true then
	       g_keywordURLs=g_keywordURLs.."\r\n"..url --��ӷ��ϵ���ַ
	 end
end

function Search(url) --���ʲ�����һ����ҳ
        local text=Painter.getNetText(url)
        text=transText(text) 
        g_curPage=text
		AnalysePage(url,text)
end

function SingleJump(url,n)  --������ת��ÿ��һ��ҳ�棬��������һ����ͬ�ڱ�ҳ���ַ����ַ����Ϊ��һ����nΪ����
    if n~=0 then 
	    local i,j
        local text=Painter.getNetText(url)
        text=transText(text)	
		g_curPage=text
		g_nowURL=url

		local nextURL=url	
		j=1
		while nextURL==url do
           i,j=string.find(text,g_urlPattern,j)
		   if j==nil then  --��ƥ��
			      break
		   end
           nextURL=text:sub(i,j)
		 end
		 --------------������Ҫ������ǰ��ҳ------------------
		  AnalysePage(url,text)
		 ------------------------------------------------------
	    SingleJump(nextURL,n-1)--��һ��
	  end
end

function MultiJump(urls,n) --������ת��������ҳ�����е���ַ�����ʷ�����nΪ����
    if n~=0 and #urls>0 then 
	    local i,j
		local unique=true
		local text
		local nextURLs={}
		local nexturl={}
		local nURL=0
		for k,URL in pairs(urls) do
		if  urls[k+1] then
		    g_nextURL=urls[k+1]
		end
			text=Painter.getNetText(URL)
            text=transText(text)
			g_curPage=text
			g_nowURL=URL
		for nexturl in string.gfind(text,"http://www%.%w*%.%a*") do
			    if nexturl~=URL then
				    unique=true
					for k,v in pairs(nextURLs) do
					    if v==nexturl then
						     unique=false
						end
					end
					if unique==true then
			           nURL=nURL+1
					   nextURLs[nURL]={}
				       nextURLs[nURL]=nexturl
					 end
				end
		end

		 --------------������Ҫ������ǰ��ҳ------------------
		    AnalysePage(URL,text)
		 ------------------------------------------------------
		 end
		 MultiJump(nextURLs,n-1)
	  end
end

function transText(text)
        local i
		i=text:find("charset=gb")
		if i then  --gb����
                   return text
		end
		return Painter.utf8ToGB2312(text)  --utf-8����
end


function  uniqueTable(urls)
     local hash={}
	 local n=0
        for k,v in pairs(urls) do
			n=0
			for i=1,string.len(v) do
			   n=n+v:byte(i)
			end
			 if  hash[n] then
			    table.remove(urls,k)
			 else
			   table.insert(hash,n,1)
			 end
		end
end