# Reverse scoring

Some IPIP-NEO-120 questions are worded backward. A high answer means less of the trait, not more. Reverse scoring flips those answers so that a high number always means more of the trait.

The flip is 1 becomes 5, 2 becomes 4, 4 becomes 2, and 5 becomes 1. The middle answer, 3, stays 3.

Take a neuroticism question such as “I remain calm under pressure.” Agreeing means less neuroticism. Someone who marks 5, Very Accurate, is calm, so that answer is stored as 1 and adds little to their neuroticism score. Someone who marks 1, Very Inaccurate, is not calm, so that answer is stored as 5 and adds a lot. After the flip, both people can be added up on the same scale.

A group comparison is meaningless if the two groups are not flipped the same way. One group would look higher only because its backward questions were still pointing the wrong direction.

In `IPIP120.dat` this flip is already stored. The format guide says reverse-scored items were recoded when the person finished the inventory. The build should read those values, score each facet once, and save the scores. Every precomputed pair should use those saved scores. Flipping the same items again would undo the correction.

Status: accepted
