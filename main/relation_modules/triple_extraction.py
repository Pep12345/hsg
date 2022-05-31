from subject_object_extraction_it import findSVOs
import spacy_stanza
import warnings
from main.utils.entity import Entity
from main.utils.triple import Triple

from main.individual_extractor.individual_extractor import IndividualExtractor

import text_examples
from pprint import pprint

def extract_entity(t):
    ent_extractor = IndividualExtractor()
    listaa = ent_extractor.get_list_modules()
    active_modules = [True]*len(listaa)
    active_modules[1] = False
    from itertools import compress
    list_active_modules = list(compress(listaa, active_modules))
    heu = ent_extractor.get_list_heuristic()[0]

    list_entities = ent_extractor.start_analysis(t, list_active_modules, heu)
    return list_entities

def main(t):
    import spacy_stanza
    import warnings
    warnings.filterwarnings("ignore")
    nlp = spacy_stanza.load_pipeline(name='it', processor="tokenize,mwt,pos,lemma,depparse")
    tok = nlp(t)
    return findSVOs(tok)


def create_entity_from_spacy(ent):
    return Entity(str_text=ent.text, start_char=ent.i, end_char=ent.i+len(ent.text))


class TripleExtractor:

    def __init__(self):
        warnings.filterwarnings("ignore")
        self._nlp = spacy_stanza.load_pipeline(name='it', processor="tokenize,mwt,pos,lemma,ner,depparse")

    def extract_triple(self, text):
        tokens = self._nlp(text)
        list_tuples = findSVOs(tokens)
        list_triple = []
        for sub,verb,obj in list_tuples:
            sub_ent = create_entity_from_spacy(sub)
            obj_ent = create_entity_from_spacy(obj)
            negative = True if verb[0] == "!" else False
            verb_text = verb.replace("!", "")
            triple = Triple(verb_text=verb_text, arg0=sub_ent, arg1=obj_ent)
            if negative:
                triple.set_negative()
            list_triple.append(triple)
        return list_triple


if __name__ == "__main__":
    texts = [text_examples.sentence_test_parte_1, text_examples.sentence_test_parte_2, text_examples.sentence_test_parte_3]
    te = TripleExtractor()
    for t in texts:
        print("-----------------------")
        print(t)
        list_entity = extract_entity(t)
        pprint(list_entity)
        print("###########")
        list_triple = te.extract_triple(t)
        pprint(list_triple)
        print("-----------------------")

