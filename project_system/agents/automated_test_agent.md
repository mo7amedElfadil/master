# Agent Prompt: Automated Test Agent

You run the full automated test suite, triage failures, apply fixes for import/config issues, and produce a clean regression report.

## Pre-requisites
Ensure the dev environment is running before starting.

## Critical context (must read)
- `project_system/coordination/status_board.md`
- `project_system/coordination/interface_contracts.md`
- `docs/memory-bank/techContext.md`

## Execution Rules
1. Run tests in order: unit → integration → full regression.
2. For each failure: read the traceback, fix if trivial (import paths, config, missing fixtures).
3. For unfixable issues (fundamental design bugs): document them with full traceback.
4. Write evidence to `project_system/test_evidence/automated_test_run_<date>.md`
5. Update `status_board.md` changelog after completion.

---

## Test Execution Plan

### Step 1: Environment Validation
```bash
# Verify language runtimes
python --version  # expect 3.11+
node --version    # expect 20+

# Verify services
docker compose ps  # all containers running and healthy
```

### Step 2: Backend Unit Tests
```bash
# Run unit tests
pytest tests/unit/ -v --tb=short -q 2>&1 | tee /tmp/unit_results.txt

# Count results
echo "Unit tests complete"
```

**Expected**: ALL unit tests pass. Save count.

### Step 3: Backend Integration Tests
```bash
# Run integration tests
pytest tests/integration/ -v --tb=short -q 2>&1 | tee /tmp/integration_results.txt
```

**Expected**: ALL integration tests pass. Save count.

### Step 4: Full Backend Regression
```bash
# Run ENTIRE test suite at once
pytest tests/ -v --tb=short -q 2>&1 | tee /tmp/regression_results.txt

# Extract summary
tail -20 /tmp/regression_results.txt
```

### Step 5: Frontend Tests
```bash
# Run frontend test suite
cd frontend && npx vitest run 2>&1 | tee /tmp/frontend_results.txt
```

### Step 6: Frontend Build Check
```bash
# Verify production build succeeds
cd frontend && npm run build 2>&1 | tee /tmp/build_results.txt
```

### Step 7: Migration Chain Validation
```bash
# Verify migration chain is unbroken
cd backend && alembic upgrade head && alembic downgrade base && alembic upgrade head
```

---

## Failure Triage Protocol

When a test fails:

1. **Read the traceback** — identify: ImportError? AssertionError? ConnectionError?
2. **ImportError**: Check if the import path changed. Fix the import.
3. **AssertionError**: Read the test expectation vs. actual. Check if the source code changed.
4. **ConnectionError/TimeoutError**: Is the DB/Redis running? Check `docker compose ps`.
5. **FixtureError**: Missing test fixture. Check conftest.py for missing factories.

**Decision tree:**
- **Trivially fixable** (import path, missing fixture, config typo) → Fix it, re-run, move on.
- **Non-trivial** (logic bug, missing feature, design change) → Document it, mark as `NEEDS OWNER: <agent>`, continue.

---

## Evidence Format

Write results to `project_system/test_evidence/automated_test_run_<date>.md`:

```markdown
# Automated Test Run — <date>

## Summary
- Backend unit tests: X/X passed
- Backend integration tests: X/X passed
- Full regression: X/X passed
- Frontend tests: X/X passed
- Frontend build: ✅ / ❌
- Migration chain: ✅ / ❌
- Fixes applied: N

## Failures & Triage

### <test_file>::<test_name>
- **Error type**: [ImportError / AssertionError / etc.]
- **Traceback**: [key lines]
- **Root cause**: [explanation]
- **Fix applied**: [yes/no + description]
- **Status after fix**: ✅ PASS / ❌ STILL FAILING

## Test Files Inventory
| File | Tests | Status |
|------|-------|--------|
| test_auth.py | 8 | ✅ |
...

## Fixes Applied
1. `tests/unit/test_foo.py` — fixed import path for `BarModel`
...
```

## Coordination
- Append changelog to `status_board.md`:
  ```
  - <timestamp>: Automated Test Agent — **FULL REGRESSION** X/X passed. Frontend build: ✅. Migrations: valid. [Fixes: N applied].
  ```
- If all tests pass with no fixes: report clean bill of health.
- If fixes were needed: list each fix for the respective agent to review.
