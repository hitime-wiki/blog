#--------------------------------------------
#!/bin/bash
# author：shenliyang
# website：https://github.com/shenliyang
# slogan：梦想还是要有的，万一实现了呢。
#--------------------------------------------

#定义时间
time=`date +%Y-%m-%d\ %H:%M:%S`

#执行成功
function success(){
   echo "success"
}

#执行失败
function failure(){
   echo "failure"
}

#默认执行
function default(){


  git init
  git config user.name "zhangdp"
  git config user.email "zhangdp@hitime.wiki"
  git add .
  git commit -m "Update Blog By TravisCI With Build $TRAVIS_BUILD_NUMBER"
  # Github Pages
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master

  # Create Tag
  git tag v1.2.$TRAVIS_BUILD_NUMBER -a -m "Auto Taged By TravisCI With Build $TRAVIS_BUILD_NUMBER"
  # Github Pages
  git push --quiet "https://${GH_TOKEN}@${GH_REF}" master:master --tags
}

case $1 in
    "success")
	     success
       ;;
    "failure")
	     failure
	     ;;
	         *)
       default
esac

