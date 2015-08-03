param(
  [string]$m,
  [string]$tag
)

docpad generate
cd out
git add -A
git commit -a -m "$m"

if($tag)
{
    git tag "$tag"
}
git push origin master
cd ..
Start-Process chrome blog.tankstudios.net