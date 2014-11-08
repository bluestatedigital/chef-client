## aborts a chef run if /etc/nochef exists.  this allows for manual maintenance
## to be performed without worrying about someone (or some *thing*) coming along
## and restarting chef on you.

if ::File.exists?("/etc/nochef") then
    raise "aborting chef run; /etc/nochef exists"
end
