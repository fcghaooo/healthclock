REM  ++++++++++++++++++++++++++++++++++++++++ 

REM               ��ʱ��������
REM                            by fcghao 2015.12.3  
REM  ++++++++++++++++++++++++++++++++++++++++
REM ����������
REM  ������ÿ��һ��Сʱ����һ�εĹ��ܣ�
REM	ǿ������1���ӣ����Զ��壩
REM	�ŵ���Ժ��ÿ������֮�����һ�����ѿ򣨿��Զ���ʱ�䣩
REM	�������Ի����ʱ��Ҫ���֮�� ����ſ��Լ���ִ��  ���������ͣ����������������

REM ��װ��  ˫���󣬰ѱ��ļ�Ҫ����win7 ���� �ļ������� ���������� 
REM C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM ȡ���� ����һ ��ȥ �����ļ����µĸ��ļ�����������
REM        ������  cmd��ִ�� taskkill /im:wscript.exe /f /t ���Գ�ȥ���������  ���ǿ������У�Ҫ�ֶ�������ȥ��
REM �Զ���  ���޸ĸô�����   ++++++     �Զ���ʱ������޸Ĵ˴�      +++++++++++++++




REM ���ļ�Ҫ����win7 ���� �ļ������� ���������� 
REM C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
REM ������ʵ�ֿ�����ÿ��һ��Сʱ����һ�εĹ��ܣ�Ϊ���������彡������ע����Ϣ��
DIM ONEHOUR
Dim sleephou
Dim sleepmin

REM +++++++++++++++++++++++      �Զ���ʱ������޸Ĵ˴�      +++++++++++++++
REM ÿ���������һ�� Ҫ�޸�ʱ����Ըô˴�  ����������60����    60*60*1000
REM ONEHOUR = 3600000
ONEHOUR = 3600000

REM ǿ����Ϣʱ�� 5��
GETOUT = 5

REM ���� 21��30���� ������Ի�����
sleephou = 21
REM ���� 30����
sleepmin = 30

REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM �ű������ļ��������ű�
Set ws = CreateObject("WScript.Shell")
REM ��ʱ����ѭ��ʼ��ִ��
do while true
	REM ��˯60min
	WScript.Sleep ONEHOUR

	REM ˯��֮���¼��ʼʱ��
	startTime = time
	startHour = Hour(startTime)
	startMin = Minute(startTime)
	startSecond = Second(Digital)
	startSum = startHour*60*60+startMin*60+startSecond
	REM ѭ��������ǣ��ж�ǿ����Ϣʱ���Ƿ��ѵ�
	flag = 0
	do While (flag = 0)
		REM ������������
		ws.Run "rundll32.exe user32.dll,LockWorkStation"
		REM ����ʱ��
		nowTime = time
		nowHour = Hour(nowTime)
		nowMin = Minute(nowTime)
		nowSecond = Second(Digital)
		nowSum = nowHour*60*60+nowMin*60+nowSecond
		REM ��ǰʱ����֮ǰʱ���ֵ����GETOUT �˳�ǿ��������ps �����ж��ǽ������nowSum��startSumС�����⣩
		if ((nowSum - startSum >= GETOUT) OR (startSum - nowSum >= GETOUT)) then
			flag = 1
		end If
	Loop

	REM ���´����ھŵ���Ժ��ÿ������֮�����һ�����ѿ�
	REM �������Ի����ʱ��Ҫ���֮�� ����ſ��Լ���ִ��  ���������ͣ�������ġ�
	Digital=time
	hours=Hour(Digital)
	minutes=Minute(Digital)
	seconds=Second(Digital)

	REM 21��30�Ժ� �������ѿ�
	if ((hours = sleephou AND minutes >= sleepmin)  OR (hours >= sleephou+1)) then
		if (minutes<=9) then
			minutes="0" & minutes
		end if
		if (seconds<=9) then
			seconds="0" & seconds
		end if
		ctime="            ����ʱ�� " & hours & ":" & minutes & ":" & seconds & " " & vbcrlf & _ 
		vbcrlf & _
		"       �����ˣ�ҹ���ˣ���ȥ˯���ˣ�  (�񡪡�) "
		Msgbox ctime
	end if
REM ��ѭ������
loop


