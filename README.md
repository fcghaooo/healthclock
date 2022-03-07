# healthclock
定时锁屏程序

by fcghao 2015.12.3  

# 功能描述：

1、开机后每隔一个小时锁屏一次的功能，
2、强制锁屏1分钟（可自定义）
3、九点半以后的每次锁屏之后产生一个提醒框（可自定义时间）
4、当弹出对话框的时候要叉掉之后 程序才可以继续执行  否则程序暂停不计数，不锁屏。

# 安装：  

双击就直接运行了。
如果要开机自动运行，就将本文件要放在 启动 文件夹下面

win7目录
C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

win10目录
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp

# 取消：
方法一 双击 kill.vbs
方法二 任务管理器中，杀掉wscript.exe任务
方法三 除去 启动 文件夹下的该文件，重启电脑
方法四  cmd中执行 taskkill /im:wscript.exe /f /t 可以除去今天的提醒  但是开机还有，要手动启动中去掉





