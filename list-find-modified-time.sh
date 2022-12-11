ls -lt --time atime
# same as ls -lt
# both show folder modification date
# t is for sorting by date
# use awk for ouput filtering

ls -lt| awk '{print $6,$7,$8,$9}'

# find command

# find directories with modification time less than 1 day
# not using min or max depth to limit sub-directories

find /home -mtime -1 -type d -print

# good resource examples
https://alvinalexander.com/unix/edu/examples/find.shtml
