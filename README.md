# oneindex-cf
Oneindex Cloudfoundry版本

教程：[IBMCLoud(Cloud Foundry) 部署Oneindex教程](https://hexo.aragon.wang/2019/12/14/IBMCLoud-Cloud-Foundry-%E9%83%A8%E7%BD%B2Oneindex%E6%95%99%E7%A8%8B/)

# 准备
IBMCloud 注册账号，邮箱注册即可，地址：<br>
[https://cloud.ibm.com/login](https://cloud.ibm.com/login)
OneDrive 账号，获取教程:
[https://saodaye.com/sharel/1951.html](https://saodaye.com/sharel/1951.html)

# 部署教程
## 1. 创建项目
登陆账号成功后选择左边栏的的Cloud Foundry打开。<br>
![1.PNG](https://i.loli.net/2019/12/14/dLvz8bTeYmuBtrZ.png)<br>
选择公共的应用程序，点击创建<br>
![2.PNG](https://i.loli.net/2019/12/14/wHWDaTkGcKgI8Ns.png)<br>
程序选择PHP,内存128M或者256M，这里可能会不出现免费选项，刷新一下就好<br>
域一定要是"us-south.cf.appdomain.cloud",其他的都被墙了<br>
程序名必须使用不一样的，不然会报错。记住，这后面会用到。最后点击右侧创建<br>
![3.PNG](https://i.loli.net/2019/12/14/cQgKIDLiqlCfa8O.png)<br>
等待一段时间以后，创建完成。点击左边的概述，再点击 启动 开始连续交付<br>
![4.PNG](https://i.loli.net/2019/12/14/BKUtnRFjaufTxVd.png)<br>
切换到 ”delibery pipeline“, 点击 创建 确定后创建密钥<br>
![5.PNG](https://i.loli.net/2019/12/14/iZ87pBak9FnGSoR.png)<br>
切换到 ”git存储和问题追踪“，存储库类型选择 克隆 ，github链接为：<br>
[https://github.com/AragonSnow/oneindex-cf](https://github.com/AragonSnow/oneindex-cf)<br>
取消 ”启用问题“和 ”跟踪代码更改部署“,将仓库设为私人的，防止别人看到你账号密码。<br>
最后点击左上角完成创建
![6.PNG](https://i.loli.net/2019/12/14/7Ci4UFAm9JqjwN3.png)<br>
这些配置完成后，可以暂时退出IBMCloud,获取口令后再来重新使用。


## 2. 获取OneDrive口令
打开链接[https://oneindex-gettoken.us-south.cf.appdomain.cloud/](https://oneindex-gettoken.us-south.cf.appdomain.cloud/) 注册OneDrive APP<br>
![7.PNG](https://i.loli.net/2019/12/14/osgDlvH93nu5Ym8.png)<br>
如图获取到登陆使用的Secret 和 Client ID<br>
![install.gif](https://i.loli.net/2019/12/14/7aIH1oJicbD4Twk.gif)<br>
返回[https://oneindex-gettoken.us-south.cf.appdomain.cloud/](https://oneindex-gettoken.us-south.cf.appdomain.cloud/)，输入刚刚获取到的Secret 和 Client ID，等待页面返回Access_token和Refresh_Token,并记录下来<br>
![8.PNG](https://i.loli.net/2019/12/14/AejKvC5duGfLl1D.png)<br>
以上就是获取口令的过程

## 3. 输入口令
返回IBMcloud,打开概述，点击查看工具链，点击GIT<br>
![9.PNG](https://i.loli.net/2019/12/14/MYpTNEnDmcaAvZX.png)<br>
![10.PNG](https://i.loli.net/2019/12/14/aeyCXiNEU7oAOBj.png)<br>
需要修改三个文件，第一个：manifest.yml<br>
点击manifest.yml文件打开，点击右边 Edit 修改成对应的项目名，比如我之前创建的Oneindex-cf-sample, 最后点击下方的Commit 按钮提交修改<br>
![11.PNG](https://i.loli.net/2019/12/14/teRxLOwoAE2klIG.png)<br>
![12.PNG](https://i.loli.net/2019/12/14/OcMNWHhyf85CBTo.png)<br>
![13.PNG](https://i.loli.net/2019/12/14/rytiRJbYk5jwZXh.png)<br>
在 /web/config目录下打开base.php，点击右边 Edit<br>
site_name 是你的网站标题<br>
password 是你后台登陆密码<br>
password 是你后台登陆密码<br>
client_secret 替换 之前获取的secret<br>
client_id 替换 之前获取的Client ID<br>
refresh_token 替换成 获取到的Refresh_token<br>
![14.PNG](https://i.loli.net/2019/12/14/L6K2RpsCJyMbnxv.png)<br>
![15.PNG](https://i.loli.net/2019/12/14/YIMc2jzk8XDtNmE.png)<br>
![16.PNG](https://i.loli.net/2019/12/14/jgtRZ2UCecWk1oL.png)<br>
在 /web/config目录下打开token.php，点击右边 Edit<br>
access_token 替换 之前获取的access_token<br>
refresh_token 替换成 获取到的Refresh_token<br>
![17.PNG](https://i.loli.net/2019/12/14/d3y8hJIc5YXRtlD.png)<br>
以上即可完成配置的修改

## 4. 打开网站
等待5分钟左右，自动部署完成，返回点击访问网站URL即开打开网站。<br>
![18.PNG](https://i.loli.net/2019/12/14/I7PWfmEG8reVubl.png)<br>
![19.PNG](https://i.loli.net/2019/12/14/FR4UhQ7rKq5be2j.png)<br>

以上就是IBMCloud 部署Oneindex的教程。谢谢观看，如果有问题请在博客下给我留言。

# 无限试用
参考之前的[IBMCloud部署onelist一直试用教程](https://hexo.aragon.wang/2019/08/28/IBMCloud%E9%83%A8%E7%BD%B2onelist%E4%B8%80%E7%9B%B4%E8%AF%95%E7%94%A8%E6%95%99%E7%A8%8B/)使用VPS定时任务实现无限试用。
后期我会搭建重启平台供大家来实现无主机重启。

谢谢观看