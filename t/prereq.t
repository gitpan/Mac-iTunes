#$Id: prereq.t,v 1.6 2004/09/18 16:39:17 comdog Exp $
use Test::More;
eval "use Test::Prereq";
plan skip_all => "Test::Prereq required to test dependencies" if $@;
prereq_ok();
