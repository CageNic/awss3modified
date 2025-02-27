aws s3 ls | awk '$3 ~ /projectbucket/ {print $3}' > projectlog.txt
# change log.txt to inlcude date in filename

 aws s3api list-objects-v2 --bucket $project --query 'Contents[?LastModified>`2022-10-10`].Key'


############################
# DAP bucket read contents #
############################

##############################
# get bucket names to a list #
##############################

aws s3api list-buckets | grep -i 'name' > Tier0_buckets.txt

            "Name": "thf-xxxx-tierxxxx-projects-centospackage-projectbucket-xxxx"
            "Name": "thf-xxxx-tierxxxx-projects-centospackage-resultsbucket-xxxx"

###################################
# Perl to do some text processing #
###################################

##################################################################################################################
# read in Tier0_buckets.txt which is created by redirecting output of the command                                #
# aws s3api list-buckets | grep -i 'name' > Tier0_buckets.txt                                                    #
# Need the bucket url to be redirected to another output file (Tier0_buckets_pruned.txt)                         #
# which is what this script does                                                                                 #
# Then use the bash script bucket_loop.sh to create a file of all buckets and their contents (objects)           #
# command for that is                                                                                            #
# cat Tier0_buckets_pruned.txt | while read lines; do aws s3api list-objects --output text --bucket $lines; done #
##################################################################################################################

#!/usr/bin/perl
use strict;
use warnings;

my $infile = "Tier0_buckets.txt";
my $outfile = "Tier0_buckets_pruned.txt";

open (my $fhin,'<',$infile) or die $!;
open (my $fhout,'>',$outfile) or die $!;
while (my $lines = <$fhin>) {
        chomp $lines;
        if ($lines =~ m/^\s.*(thf.*?)"/g) {
                print $fhout $1 , "\n";
                }
        }
close $fhin;
close $fhout;
exit;

thf-xxxx-tierxxxx-projects-centospackage-projectbucket-xxxx
thf-xxxx-tierxxxx-projects-centospackage-resultsbucket-xxxx


