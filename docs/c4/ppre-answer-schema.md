# Answer file schema

Status: accepted. Mohamed accepted this schema on 31 Oct 2026.

One successful comparison is one JSON file. It is not the error object. The error object, the 100 KB cap, and the 6-month deprecation window stay in the blueprint. See docs/index.md.

The page layout is not in this file. Phone, tablet, and computer sizing stay in CSS. See docs/index.md.

Chart.js draws the curves and the room of a hundred from the numbers in this file. The glossary text stays on the page.

## Fields

| Field | What it holds |
| :--- | :--- |
| `id` | Comparison identity. One human-readable name, the same five parts as the Umami event: target, group A’s gender, group A’s age band, group B’s gender, group B’s age band. Example: `anxiety_male_25-34_female_35-44`. |
| `target.kind` | `facet` or `trait`. |
| `target.id` | Which of the 35 options. Both groups use this same target. |
| `groups.a` and `groups.b` | The two groups. |
| `groups.*.gender` | `male` or `female`. Omitted on the whole-population baseline, which is not one sex. |
| `groups.*.ageBand` | Optional. `10-13`, `14-17`, `18-24`, `25-34`, `35-44`, `45-54`, `55-64`, or `65+`. Omitted for all men, all women, and the whole population. |
| `groups.*.n` | Sample size for that group. A count. |
| `groups.*.mean` | The group score. A number, or `null` when the group has no score. |
| `groups.*.sd` | Standard deviation. A number, or `null` when the group has no score. |
| `groups.*.smallSample` | `true` when `n` is fewer than 30. The comparison is still shown. |
| `groups.*.room` | Five counts of a hundred people, in this order: very low, low, average, high, very high. The counts add up to 100. Scores run from 1 to 5. The cut points are in the room lesson. See docs/index.md. |
| `cohensD` | Cohen’s d for the pair. A number, or `null` when there is no score. |
| `dLabel` | `negligible`, `small`, `medium`, or `large`, from the absolute value of `cohensD`. `null` when there is no score. |
| `overlapPercent` | How much of the two groups’ scores fall in the same range. A number from 0 to 100, or `null` when there is no score. Shown on hover, not inside the verdict sentence. |
| `scored` | `true` when both groups have a score. `false` when a group has fewer than 2 answered items. That case is a normal answer, not an error. |
| `verdict.en` | The verdict sentence in English. |
| `verdict.fr` | The verdict sentence in French. See docs/index.md. |
| `verdict.ar` | The verdict sentence in Arabic. See docs/index.md. |

When either `smallSample` is `true`, the page adds this warning inline with the verdict: “this comparison is based on a small sample, so read it with caution.” The warning is not a separate banner. The French warning is in the French visitor copy. The Arabic warning is in the Arabic visitor copy. See docs/index.md.

Missing ages stay in the whole population and in the sex-only slices. They are left out of age-band comparisons.

## Example

```json
{
  "id": "anxiety_male_25-34_female_35-44",
  "target": { "kind": "facet", "id": "anxiety" },
  "groups": {
    "a": {
      "gender": "male",
      "ageBand": "25-34",
      "n": 1200,
      "mean": 3.1,
      "sd": 0.8,
      "smallSample": false,
      "room": [10, 20, 40, 20, 10]
    },
    "b": {
      "gender": "female",
      "ageBand": "35-44",
      "n": 18,
      "mean": 2.8,
      "sd": 0.9,
      "smallSample": true,
      "room": [12, 22, 40, 18, 8]
    }
  },
  "cohensD": 0.3,
  "dLabel": "small",
  "overlapPercent": 88,
  "scored": true,
  "verdict": {
    "en": "Men aged 25–34 scored higher on neuroticism anxiety than women aged 35–44. The difference is a small shift, hard to notice in everyday life.",
    "fr": "Les hommes de 25 à 34 ans ont un score plus élevé en anxiété (névrosisme) que les femmes de 35 à 44 ans. L'écart est faible, difficile à remarquer au quotidien.",
    "ar": "سجّل الرجال الذين تتراوح أعمارهم بين 25 و34 عاماً درجة أعلى في القلق (العصابية) من النساء اللواتي تتراوح أعمارهن بين 35 و44 عاماً. الفرق صغير، ويصعب ملاحظته في الحياة اليومية."
  }
}
```

The `room` counts in the example are an illustration. They are not computed from the data. Order is very low, low, average, high, very high.

## Review notes

The first part of the event name is the target. That target is a facet or a trait. See docs/index.md.
