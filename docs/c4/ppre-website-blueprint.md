# Blueprint: ppre-website

Accepted by Mohamed on 31 Oct 2026. This is the phase 2 artifact for the container `ppre-website`. The container is now in phase 3, Build. Build has not been started.

Parent is root. This scope is a container, not a component, so the blueprint names define-now children and does not attach a check to each task. The public interface is below.

No application code belongs in this file.

## Already decided

See docs/index.md.

## Define-now children

These are specified before any of them is built. None is a component yet, so none has a check.

| Child | What it is |
| :--- | :--- |
| Static shell | The HTML, CSS, and small script that load one answer and render the page. |
| JSON answers | One file per comparison. See docs/index.md. |
| Chart.js view | Curves and the room of a hundred, drawn from the answer already loaded. See docs/index.md. |
| Answer layout | See docs/index.md. |
| Glossary hovers | See docs/index.md. |
| Three languages | See docs/index.md. |
| Two screens | The same page on a phone and on a computer. See docs/index.md. |

Version one does not include longitudinal data. See docs/index.md.

## Public interface

### Error shape

A failure is a JSON object. It is not a comparison.

| Field | Value |
| :--- | :--- |
| error | `answer-missing`, `chart-failed`, or `script-failed` |
| message | A plain sentence saying what happened |
| action | `refresh` when the visitor should try again |

`answer-missing` is the reliability case: the precomputed answer file is not on the VPS. The message explains that. See docs/index.md.

`chart-failed` and `script-failed` are the safe-failure case. The message says it couldn't load at the moment. The rest of the page keeps working. The visitor is invited to refresh.

A comparison with fewer than 2 answered items is not this error. It is a normal answer that says the data has no score for that comparison. A small-sample group is not this error. The comparison is shown, with the warning in the verdict. See docs/index.md.

### Response cap

One JSON answer per response. The file contains the two groups' summary numbers and the sentences. It contains no raw respondent rows. Each answer file is at most 100 KB.

### Deprecation window

When the answer JSON shape changes, the previous field names keep working for 6 months after the new shape is deployed. After that window the old names may be removed.
