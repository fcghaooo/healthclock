REM  ++++++++++++++++++++++++++++++++++++++++ 

REM               定时锁屏程序
REM                            by fcghao 2015.12.3  
REM  ++++++++++++++++++++++++++++++++++++++++
REM 功能描述：
REM  开机后每隔一个小时锁屏一次的功能，
REM	强制锁屏1分钟（可自定义）
REM	九点半以后的每次锁屏之后产生一个提醒框（可自定义时间）
REM	当弹出对话框的时候要叉掉之后 程序才可以继续执行  否则程序暂停不计数，不锁屏。

REM 安装：  双击后，把本文件要放在win7 启动 文件夹下面 开机自启动 
REM C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM 取消： 方法一 除去 启动文件夹下的该文件，重启电脑
REM        方法二  cmd中执行 taskkill /im:wscript.exe /f /t 可以除去今天的提醒  但是开机还有，要手动启动中去掉
REM 自定义  请修改该处内容   ++++++     自定义时间可以修改此处      +++++++++++++++




REM 本文件要放在win7 启动 文件夹下面 开机自启动 
REM C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
REM 本程序实现开机后每隔一个小时锁屏一次的功能，为了您的身体健康，请注意休息。
DIM ONEHOUR
Dim sleephou
Dim sleepmin

REM +++++++++++++++++++++++      自定义时间可以修改此处      +++++++++++++++
REM 每隔多久锁屏一次 要修改时间可以该此处  现在设置了60分钟    60*60*1000
REM ONEHOUR = 3600000
ONEHOUR = 3600000

REM 强制休息时间 5秒
GETOUT = 5

REM 设置 21点30分钟 后产生对话提醒
sleephou = 21
REM 设置 30分钟
sleepmin = 30

REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM 脚本宿主文件，解析脚本
Set ws = CreateObject("WScript.Shell")
REM 定时程序循环始终执行
do while true
	REM 沉睡60min
	WScript.Sleep ONEHOUR

	REM 睡醒之后记录开始时间
	startTime = time
	startHour = Hour(startTime)
	startMin = Minute(startTime)
	startSecond = Second(Digital)
	startSum = startHour*60*60+startMin*60+startSecond
	REM 循环结束标记，判断强制休息时间是否已到
	flag = 0
	do While (flag = 0)
		REM 触发锁屏程序
		ws.Run "rundll32.exe user32.dll,LockWorkStation"
		REM 现在时间
		nowTime = time
		nowHour = Hour(nowTime)
		nowMin = Minute(nowTime)
		nowSecond = Second(Digital)
		nowSum = nowHour*60*60+nowMin*60+nowSecond
		REM 当前时间与之前时间差值大于GETOUT 退出强制锁屏（ps 后面判断是解决隔天nowSum比startSum小的问题）
		if ((nowSum - startSum >= GETOUT) OR (startSum - nowSum >= GETOUT)) then
			flag = 1
		end If
	Loop

	REM 以下代码在九点半以后的每次锁屏之后产生一个提醒框
	REM 当弹出对话框的时候要叉掉之后 程序才可以继续执行  否则程序暂停不计数的。
	Digital=time
	hours=Hour(Digital)
	minutes=Minute(Digital)
	seconds=Second(Digital)

	REM 21点30以后 产生提醒框
	if ((hours = sleephou AND minutes >= sleepmin)  OR (hours >= sleephou+1)) then
		if (minutes<=9) then
			minutes="0" & minutes
		end if
		if (seconds<=9) then
			seconds="0" & seconds
		end if
		ctime="            现在时间 " & hours & ":" & minutes & ":" & seconds & " " & vbcrlf & _ 
		vbcrlf & _
		"       不早了，夜深了，该去睡觉了！  (●—●) "
		Msgbox ctime
	end if
REM 主循环结束
loop


