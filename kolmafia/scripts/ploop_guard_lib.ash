// Hardened successor to Prusias-kol/pwrapper (donCannoli-burns/dwrapper).
// Strict operator mediation: no choice submission, auto-combat, retries, or
// arbitrary CLI command execution. Experimental; use at your own risk.
script "ploop_guard_lib";

void don_ploop_guard_status() {
    print("DON Ploop Guard: READ-ONLY STATUS");
    print("Target: ploop fullday (fixed command)");
    print("Legacy prusias_pwrapper_loopScript ignored for safety.");
    print("Last guard result: " + get_property("don_ploop_guard_last_status"));
    print("Last guard error: " + get_property("don_ploop_guard_last_error"));
    print("Last encounter: " + get_property("lastEncounter"));
    print("Last combat result: " + get_property("lastCombatResult"));
    print("No retries, automatic choices, or combat recovery will occur.");
}

void don_ploop_guard_run(string input) {
    string mode = trim(input);
    if (mode == "" || mode == "inspect" || mode == "status" || mode == "help") {
        don_ploop_guard_status();
        print("To execute once: pwrapper run (or don_ploop_guard run)");
        return;
    }
    if (mode != "run") {
        print("DON Ploop Guard: unexpected arguments; no action taken.", "red");
        return;
    }
    // The explicit 'run' argument is necessary but not sufficient to approve
    // an entire automated day of gameplay.
    if (!user_confirm("Run exactly one 'ploop fullday' cycle? No auto-retries or choice/combat recovery.", 30000, false)) {
        print("DON Ploop Guard: operator declined or approval timed out.", "orange");
        return;
    }
    set_property("don_ploop_guard_last_status", "started");
    set_property("don_ploop_guard_last_error", "");
    boolean cli_ok = false;
    string failure = catch {
        cli_ok = cli_execute("ploop fullday");
    };
    if (failure != "" || !cli_ok) {
        string details = failure;
        if (details == "") details = "KoLmafia CLI returned false";
        if (length(details) > 800) details = substring(details, 0, 800);
        set_property("don_ploop_guard_last_status", "failed_no_retry");
        set_property("don_ploop_guard_last_error", details);
        print("DON Ploop Guard: STOPPED. No automatic recovery or retry.", "red");
        print(details, "red");
        return;
    }
    // A successful CLI return is NOT evidence that all requested game actions
    // completed. Do not trust a stale thoth19_event_list 'end' marker.
    set_property("don_ploop_guard_last_status", "cli_returned_completion_unverified");
    print("DON Ploop Guard: command returned; inspect pLoop state to confirm completion.", "teal");
}
