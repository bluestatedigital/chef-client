## aborts a chef run if /etc/nochef exists.  this allows for manual maintenance
## to be performed without worrying about someone (or some *thing*) coming along
## and restarting chef on you.

if ::File.exists?("/etc/nochef") then
    ctime = ::File::Stat.new("/etc/nochef").ctime().utc().iso8601()
    
    msg = IO.read("/etc/nochef").strip
    if msg.length == 0 then
        msg = "no reason given"
    end
    
    raise "/etc/nochef created at #{ctime}: #{msg}"
end
