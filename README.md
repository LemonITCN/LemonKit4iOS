# LemonKit4iOS
> 作者：1em0nsOft-LiuRi
>
> 版本：1.0.11
>
> **你有什么需求想集成到LemonKit中吗？您在使用过程中发现了什么Bug吗？快来告诉我！**
>
> **建议意见反馈QQ群号：370157608** 
>
> **作者邮箱：liuri@lemonsoft.net**
>
> **我的QQ：188443213**



- 你可能还不知道！！LemonKit是全平台的哦！有以下三种~ 欢迎关注哦

| 版本名称        | Github地址                                 |
| ----------- | ---------------------------------------- |
| Android版本   | https://github.com/1em0nsOft/LemonKit4Android |
| iOS ObjC版本  | https://github.com/1em0nsOft/LemonKit4iOS |
| iOS Swift版本 | https://github.com/1em0nsOft/LemonKit4iOS-Swift |



### LemonKit 的集成

> 为了方便大家，LemonKit可以使用Cocoapods快速集成哦！

```shell
pod 'LemonKit','1.0.11'
```



### LemonKit扩展视图

> LemonKit中的超级炫酷控件**（全平台哦）从现在起都会被抽出来单独作为开源项目哦！大家可以自行使用Cocoapods单独集成使用，下表是当前已经拆分完的控件，欢迎大家关注哦！

| 控件名称        | 版本             | Github地址                                 |
| ----------- | -------------- | ---------------------------------------- |
| LemonBubble | iOS Objc 1.0.0 | https://github.com/1em0nsOft/LemonBubble |



### LemonKit可以做什么呢？



#### LKInstance

> 可以帮助你通过类名或者关键字来创建实例，方便你动态的创建对象。你可以在plist中配置你ViewController的别名，然后快速的通过`[LKInstance findViewControllerWithKey: @""]; `获取对象实例哦，这只是个小栗子~您可以看看Demo中



#### LKInstancePool

> 可以通过[LKInstance pool]方法获取实例池，这是一个弱引用池，你可以在一个ViewController中把一个对象放到LKInstancePool中，然后去另一个ViewContorller中进行获取使用。



#### LKFreeCtrl

> 这是一个可以快速帮你操作ViewController的工具，他可以自动帮你获取当前屏幕上正在显示的ViewController并进行push、present等操作。有了LKFreeCtrl，你甚至可以在你的（普通继承自NSObject的）模型类中进行pushViewController等操作。



#### LKLocalStr

> 你的项目需要本地化吗？或者你使用XXX.strings文件的方式存储界面中的字符串？那么使用NSString+LKLocalStr，他会帮你少写很多代码的！配置代替变成，你只要按照LemonKit中要求的配置方式进行命名即可，so easy！具体的可以参考Demo哦~



#### LKDefine

> 宏定义是个好东西，他可以让你少写代码，LemonKit中给大家抽出了许多开发中常用的宏，比如说`LKLog()`,使用LKLog可以让你打印出Log输出的所在类和所在行号，而且在Release的时候自动屏蔽掉所有的Log，是不是很方便呢？



#### LKUIViewController等基础ViewController

> 针对各种ViewController，LemonKit对其进行了封装和增强，我们让ViewController可以支持全屏返回手势~默认隐藏系统的NavigationBar，而是使用自己扩展的lkNavigationBar，每个页面独立的导航栏，但是你可以根据系统的主题在配置文件中配置全局导航栏颜色！说起来麻烦，不妨您去Demo中看看哦~

#### 更多功能我就不一一列出来啦，大家自己摸索哦~

#### 如果你需要什么功能可以告诉我~我给您加进来！





### 更多的功能正在开发中~

