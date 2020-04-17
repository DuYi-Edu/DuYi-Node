# 如何获取所有分支

该仓库有很多的分支，可以通过下面的做法获取所有分支

1. 克隆仓库

```shell
git clone https://github.com/DuYi-Edu/DuYi-Node.git
```

2. 获取所有远程分支并映射到本地

```shell
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
```

3. 查看目前所有的分支

此时，你已经可以看到所有的分支了

```shell
git branch
```

# 分支说明

每一节课都是一个分支，分支名为课程名称编号

要切换到相应的课程，仅需切换分支即可

例如要切换到第一章第一节课，运行下面的命令即可：

```shell
git checkout 1-1
```