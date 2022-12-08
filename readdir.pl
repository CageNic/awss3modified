# to work on for folder date modified - alternate to ls command with relevant flags

$dir = "/home/dir";
opendir (DIR, $dir);
     @dir=readdir(DIR);
        closedir(DIR);
         @dir = sort { -M "$dir/$a" <=> -M "$dir/$b" } (@dir);
