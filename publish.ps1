param(
  [string]$m
)

docpad generate
cd out
git commit -a -m "$m"
git push origin master
Start-Process chrome blog.tankstudios.net