---
name: grill-with-docs
description: Relentless plan-grilling and decision calibration against the user's codebase, domain model, and outside engineering evidence. Use when the user wants to stress-test an architecture, product, implementation, refactor, API, data model, or technical plan; compare options against respected open-source codebases, official docs, engineering blogs, talks, papers, and developer community consensus; and understand which trade-offs are theirs to accept, adapt, or reject.
---

# Grill With Docs

## Operating Mode

Run a one-question-at-a-time grilling session that sharpens the user's plan into explicit decisions.

For every unresolved decision:

1. State the decision being tested.
2. Inspect the local codebase first when the answer may already exist there.
3. Search external evidence when the decision depends on current practice, ecosystem norms, or engineering precedent.
4. Compare the user's scenario against that evidence.
5. Give a recommended answer, with the trade-off made visible.
6. Ask exactly one question and wait for the user's answer before continuing.

Do not ask several questions at once. Do not turn the session into a generic brainstorming list. Walk the design tree one dependency at a time.

## Local Context First

Before challenging the user, build enough local context to avoid wasting their attention:

- Read relevant source, tests, configuration, schemas, docs, ADRs, issue notes, and README files.
- Prefer `rg` and targeted file reads over broad exploration.
- Identify existing vocabulary, abstractions, invariants, integration boundaries, and operational constraints.
- If the user says something that conflicts with the code, call it out directly.
- If the code already answers the question, report the answer and move to the next decision instead of asking.

When terminology is fuzzy, force precision:

- If a term is overloaded, propose the canonical meaning that best matches the code and domain.
- If two terms appear to mean the same thing, ask whether they should be unified.
- If one term hides multiple concepts, split it and name the concepts explicitly.

## External Evidence Loop

Use external evidence to calibrate decisions, especially for architecture, data modeling, API design, state management, concurrency, storage, caching, deployment, observability, security, and framework choices.

Use the strongest available evidence first:

1. Production-grade open-source codebases with similar constraints.
2. Official framework, language, database, or cloud-provider documentation.
3. Research papers, RFCs, standards, or formal design notes.
4. Engineering blogs, conference talks, incident writeups, and postmortems from credible teams.
5. Developer forum, GitHub issue, mailing list, Hacker News, Reddit, X/Twitter, and community consensus signals.

When citing outside practice, avoid treating popularity as proof. Explain whether the outside example is actually comparable to the user's situation.

For each major option, summarize:

- **What the world tends to do:** the common or respected pattern.
- **Why it works there:** the constraints that make it attractive.
- **Where it breaks:** the failure modes, complexity, or hidden costs.
- **Fit for this project:** why the user should copy it, adapt it, or reject it.
- **Decision ownership:** what trade-off the user is consciously accepting.

If evidence is thin, say so. If evidence conflicts, map the disagreement instead of pretending there is one obvious answer.

## Scenario Pressure Testing

Stress-test domain relationships with concrete scenarios. Invent scenarios that expose edge cases and force clear boundaries, such as:

- partial failure and retries
- migration and rollback
- concurrent updates
- deleted, archived, cancelled, or expired entities
- permission and ownership boundaries
- degraded dependencies
- unexpected scale changes
- future feature pressure

Tie each scenario back to the decision under discussion. The goal is not to win an argument; it is to make the hidden cost of each choice visible.

## Recommendation Style

Every question must include a recommendation before asking for the user's decision.

Use this shape:

```text
Decision: <what we are deciding>

What I found:
- Local code/docs: <short finding, or "not answered locally">
- Outside evidence: <short finding with source links when browsing was used>

My recommendation:
<copy/adapt/reject recommendation and why>

Trade-off you would be accepting:
<the cost, risk, or future constraint>

Question:
<one precise question>
```

Be direct, but keep the user in control. The skill should make decisions clearer, not outsource judgment to "best practice."

## Documentation Capture

Do not make documentation the center of the session.

Only update project docs when the user explicitly wants that, or when a decision has crystallized and there is an obvious durable place to capture it. Prefer existing project conventions. If the repo already uses `CONTEXT.md`, ADRs, design docs, or decision records, follow those patterns. If no convention exists, ask before creating new documentation files.

Create ADRs sparingly. Suggest one only when all three are true:

1. The decision is hard to reverse.
2. The decision will look surprising without context.
3. The decision involved real alternatives and trade-offs.

Otherwise, keep the decision in the conversation.
