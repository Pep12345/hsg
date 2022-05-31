import queue

from sympy import Interval, Union

# input set of string ex: ("Giovanni Mazzucco", "Lorenzo Gastaldi",...)
def precion_and_recall_between_two_sets_exact_match(set_predicted, set_gold):
    intersection = set_predicted.intersection(set_gold)
    if len(intersection) == 0:
        return 0, 0, "", []
    prec = len(intersection) / len(set_predicted)
    rec = len(intersection) / len(set_gold)
    string_result = f"tp: {len(intersection)},fp: {len(set_predicted)-len(intersection)}, " \
                    f"fn:{len(set_gold)- len(intersection)}"
    return prec, rec, string_result, intersection


def precision_and_recall_between_two_sets_partial_match_using_in(set_predicted, set_gold):
    pred = list(set_predicted)
    gold = list(set_gold)
    list_output = []
    tp = 0
    for word in gold:
        # estraggo tutti i partial match tra word e il dataset predetto
        r = [v for v in pred if word in v or v in word]
        #print(f"partial match: {word}  -> {r}")
        # se c'è almeno un partial match incremento true positive
        if len(r) > 0:
            tp += 1
            list_output.append((word,r))
    if tp == 0:
        return 0,0, "", []
    prec = tp/ len(set_predicted)
    rec = tp/ len(set_gold)
    string_result = f"tp: {tp},fp: {len(set_predicted)-tp}, " \
                    f"fn:{len(set_gold)- tp}"
    return prec, rec, string_result, list_output