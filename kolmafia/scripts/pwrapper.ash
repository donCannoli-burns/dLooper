// Legacy command compatibility: original Prusias-kol/pwrapper.
// Safety change: a bare pwrapper invocation is inspect-only.
script "pwrapper";
import <ploop_guard_lib.ash>;
void main(string input) { don_ploop_guard_run(input); }
