# ZLGithubClient
[<img src="https://api.gitsponsors.com/api/badge/img?id=165685490" height="20">](https://api.gitsponsors.com/api/badge/link?p=k4476jmSTzX/CkhGD8R0k2RR6YBPcs9f5RsSLUBfr7twVzgajNVIPunZPrPI2S4oPK4b+KhvfWsLiJ5rCD80x8A/3iBOxOdYK/eCgPpYKFhVxXjbIhJn5jGE3LueNY3WEdhrepPZUQ4UpHNyog8aEA==)
![ZLGithub TestFlight](https://github.com/MengAndJie/GithubClient/workflows/ZLGithub%20TestFlight/badge.svg)
![language](https://img.shields.io/github/languages/top/existorlive/githubclient)
![CodeSize](https://img.shields.io/github/languages/code-size/existorlive/GitHubClient)
![license](https://img.shields.io/github/license/existorlive/githubclient)
![commit](https://img.shields.io/github/last-commit/mengandjie/githubclient)
![stars](https://img.shields.io/github/stars/existorlive/githubclient)


基于 [Github REST V3 API](https://docs.github.com/en/rest) 和 [Github GraphQL V4 API](https://docs.github.com/en/free-pro-team@latest/graphql) 开发的Github iOS客户端

## 安装

- [App Store Release](https://apps.apple.com/app/gorillas/id1498787032)

- [TestFlight Beta](https://testflight.apple.com/join/kCFO5joL)

## 基本功能

1. 搜索开源仓库和开发者
2. 支持浏览每日/周/月开源仓库和开发者趋势榜单
3. 支持浏览开源仓库的基本信息，包括code，commits，issues，pull requests等等
4. 支持fork，watch，star开源仓库
5. 支持浏览登录用户的公开及私有仓库
6. 浏览开发者的基本信息，follow开发者
7. 支持查看follow的开发者和watch的开源repository的最新动态
8. 简单查阅通知
9. 在工作台固定收藏的仓库
10. 在工作台查阅登录用户的issue和pull request


#### Github OAuth login and Access Token login 

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/001.jpeg"/>
</div>

#### Workboard 

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/002.jpeg"/>
</div>


#### Notification 

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/003.jpeg"/>
</div>


#### Trending 

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/004.jpeg"/>
</div>

#### Profile

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/005.jpeg"/>
</div>

#### Search

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/006.jpeg"/>
</div>

#### User Info

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/007.jpeg"/>
</div>


#### Repository Info

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/008.jpeg"/>
</div>



#### View markdown and code 

<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/009.jpeg"/>
</div>
<div align="left">
<img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/010.jpeg"/>
</div>



## 开始项目

1. 准备开发环境
   
    - **xcode**
    - **ruby**
    - **git**

2. 安装**bundle**
   
   ```sh 
   gem install bundle 
   ```

3. 下载项目源码 

    ```sh 
    git clone https://github.com/ExistOrLive/GithubClient.git
    ```

4. 切换至 `ZLGithubClient/ZLGithubClient` 目录下，执行 `bundle install`，安装依赖的ruby工具，如 **cocoapods** ，**fastlane** 等 

    ```sh

    cd ZLGithubClient/ZLGithubClient

    bundle install 
    ```

5. 执行 `bundle exec pod install` 

    ```sh 
    bundle exec pod install 
    ```

    <div align="left">
    <img src="https://gitee.com/zxhubs/git-hub-client-material/raw/master/GitHubClientMaterial/pod_install.jpg" width="450"/>
    </div>

6. 在使用源码前，需要 Github 的账户下创建一个 OAuth Application，具体请参考官方文档 [Creating an OAuth App](https://docs.github.com/en/developers/apps/creating-an-oauth-app); 创建 OAuth Application 后，获得`Client ID` 和 `Client Secret` 

7. ZLGithubClient 使用 [Bugly](https://bugly.qq.com/v2/) 和 [Firebase](https://firebase.google.com/) 作为分析工具，因此需要创建对应应用并获取 `Bugly App Id` 和 `GoogleService-Info.plist`

8. 将 `GoogleService-Info.plist` 拷贝到项目对应目录下；创建 `ZLGithubAppKey.h` 文件，提供宏定义 ，并拷贝到对应的目录下

    <div align="left">
    <img src="https://github.com/ExistOrLive/existorlivepic/raw/master/202204050025208.png" width="450"/>
    </div>

    <div align="left">
    <img src="https://github.com/ExistOrLive/existorlivepic/raw/master/202204050026633.png" width="200"/>
    </div>
    
9. 构建工程

## 常见问题解答

[常见问题解答](Document/Troubleshooting/TronbleShooting_Readme.md)

## 贡献者 ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/ExistOrLive"><img src="https://avatars.githubusercontent.com/u/18443373?v=4?s=100" width="100px;" alt=""/><br /><sub><b>朱猛</b></sub></a><br /><a href="https://github.com/MengAndJie/GithubClient/commits?author=ExistOrLive" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/longxiaochi"><img src="https://avatars.githubusercontent.com/u/18322377?v=4?s=100" width="100px;" alt=""/><br /><sub><b>longxiaochi</b></sub></a><br /><a href="https://github.com/MengAndJie/GithubClient/commits?author=longxiaochi" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/ZXHubs"><img src="https://avatars.githubusercontent.com/u/53455473?v=4?s=100" width="100px;" alt=""/><br /><sub><b>ZXHubs</b></sub></a><br /><a href="https://github.com/MengAndJie/GithubClient/commits?author=ZXHubs" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## 结语
普通的代码千篇一律，优秀的代码万里挑一。开源就如星星之火正在燎原，本项目是开源世界中小小一隅，如果有感兴趣的开发者欢迎加入, 若有意请联系<a src="2068531506@qq.com">2068531506@qq.com</a>.
