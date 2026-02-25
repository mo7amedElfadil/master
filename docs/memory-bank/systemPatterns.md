# System Patterns

> How does the system work? Architecture, design patterns, and key decisions.

## Architecture Style
<!-- e.g., Monolith, Modular Monolith, Microservices, Serverless, Hybrid -->

## High-Level Architecture
<!-- Describe the major components and how data flows between them -->

```
<Component A> ──── <Component B> ──── <Component C>
      │                   │                 │
      ▼                   ▼                 ▼
   <Store>            <Cache>           <Output>
```

## Key Design Patterns
<!-- List the patterns used and why -->

- **<Pattern Name>:** <where used and why>
  - Example: "Repository Pattern: all DB access goes through service layers, never direct SQL in routes"
- **<Pattern Name>:** <where used and why>

## Data Flow
<!-- How does data move through the system? -->

### Write Path
```
<Input> → <Validation> → <Processing> → <Storage>
```

### Read Path
```
<Request> → <Cache Check> → <DB Query> → <Response>
```

## Module / Service Boundaries
<!-- How is the codebase organized? What owns what? -->

| Module/Service | Responsibility | Key Files |
|---------------|---------------|-----------|
| <name> | <what it does> | <paths> |

## Critical State Machines
<!-- Any important state transitions the system manages -->

```
<State A> → <Event> → <State B> → <Event> → <State C>
```

## Design Decisions Log
<!-- Major decisions and their rationale — link to ADRs if they exist -->
- <decision>: <rationale> (see `project_system/decisions/<ADR>.md`)
