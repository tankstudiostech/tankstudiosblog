param(
  [string]$m
)

docpad generate
cd out
git add -a
git commit -a -m "$m"
git push origin master
cd ..
Start-Process chrome blog.tankstudios.net