#$Id: prereq.t 1484 2004-09-18 16:39:17Z comdog $
use Test::More;
eval "use Test::Prereq";
plan skip_all => "Test::Prereq required to test dependencies" if $@;
prereq_ok();
