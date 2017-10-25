# WinHosts 




一款简易的hosts替换脚本

```
git clone https://github.com/Junyangz/WinHosts.git 
```

双击AutoChangehosts_v3.4.bat运行自动替换hosts批处理...

针对不同网络环境可以自主选择IPv6/IPv4 hosts。

-

脚本会自动以管理员身份运行，CMD运行后会弹出一个提示，

请点击“是/Y”


按提示选择

 	1.使用IPv6-hosts

	2.使用IPv4-hosts
	
	3.使用网络版IPv6-hosts
	
	4.使用网络版IPv4-hosts

	5.恢复初始hosts

	6.退出

输入相对应数字并回车执行命令

执行脚本会把当前文件夹下的hosts文件（或者网络下载的hosts文件）替换系统

C:\Windows\System32\drivers\etc\hosts 文件

并使用ipconfig /flushdns命令清除DNS缓存！

-
