# hello

A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


iOS利用vscode创建插件有坑 
不指定语言默认会创建swift和kotlin
生成文件的时候需要指定语言 -i ios -a java
创建文件后vscode侧需要 先拉取依赖包 在运行flutter才会生成插件代码
flutter create --org chaoyang.com --template=plugin --platforms=android,ios -i objc -a java hello1
